#include "prog.h"
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <linux/in.h>
#include <linux/bpf.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <linux/if_ether.h>
#include <linux/pkt_cls.h>
#include <iproute2/bpf_elf.h>
#include <bpf_endian.h>
#include <bpf_helpers.h>
struct bpf_elf_map SEC("maps") acc_map = {
    .type           = BPF_MAP_TYPE_HASH,
    .size_key       = sizeof(struct flow_key),
    .size_value     = sizeof(struct data_elem),
    .max_elem    = ELEM_MAX,
    .pinning = 2
};

struct bpf_elf_map SEC("maps") ip_map = {
    .type           = BPF_MAP_TYPE_HASH,
    .size_key       = sizeof(struct ip_key),
    .size_value     = sizeof(struct hash_elem),
    .max_elem    = MAX_IP,
    .pinning = 2
};

static int is_TCP(void *data_begin, void *data_end){
  struct ethhdr *eth = data_begin;
  if ((void *)(eth + 1) > data_end)
    return 0;
  if (eth->h_proto == bpf_htons(ETH_P_IP))
  {
    struct iphdr *iph = (struct iphdr *)(eth + 1); // or (struct iphdr *)( ((void*)eth) + ETH_HLEN );
    if ((void *)(iph + 1) > data_end)
      return 0;
    if (iph->protocol == IPPROTO_TCP)
      return 1;
  }
  return 0;
}

/*
 * Access the old position wich store ip_addr's info
 */
static int getHashOld(uint32_t ip_addr, uint16_t port) {
    struct ip_key key = {
        .ip = ip_addr,
        .port = port
    };
    struct hash_elem *val = bpf_map_lookup_elem(&ip_map, &key);
    int ret = -1;
    if(!val) return -1;
    ret = val->counter;
    if(ret >= 0) val->counter --;
    return ret;
}

/*
 * Access a new position to store ip
 */
static int getHashNew(uint32_t ip_addr, uint16_t port) {
    struct ip_key key = {
        .ip = ip_addr,
        .port = port
    };
    struct hash_elem *val = bpf_map_lookup_elem(&ip_map, &key);
    if(!val) {
        struct hash_elem emp;
        emp.counter = 0;
        if(bpf_map_update_elem(&ip_map, &key, &emp, BPF_ANY) < 0)
            return -1;
        return 0;
    }
    return ++ val->counter;
}
static void storeIP(uint32_t ip_addr, uint16_t port, uint32_t counter, unsigned char* store_res) {
    struct flow_key key = {
        .key = {ip_addr, port},
        .idx = counter
    };
    struct data_elem *data = bpf_map_lookup_elem(&acc_map, &key);
    if(!data) return ;
    data->data[0] = store_res[0];
    data->data[1] = store_res[1];
    data->data[2] = store_res[2];
    data->data[3] = store_res[3];
    data->data[4] = store_res[4];
    data->data[5] = store_res[5];
}
static void restoreIP(uint32_t ip_addr, uint16_t port, uint32_t counter, unsigned char* store_pos) {
    struct flow_key key = {
        .key = {ip_addr, port},
        .idx = counter
    };
    struct data_elem *data = bpf_map_lookup_elem(&acc_map, &key);
    if(!data) return ;
    store_pos[0] = data->data[0];
    store_pos[1] = data->data[1];
    store_pos[2] = data->data[2];
    store_pos[3] = data->data[3];
    store_pos[4] = data->data[4];
    store_pos[5] = data->data[5];
}
SEC("tc_egr")
int tc_egress(struct __sk_buff* skb) {
    void *data = (void *)(long)skb->data;
    void *data_end = (void *)(long)skb->data_end;

    if(!is_TCP(data, data_end)) //Not a tcp packet.
        return TC_ACT_OK;
    struct ethhdr *eth = data;
    struct iphdr *iph = (data + sizeof(struct ethhdr));
    struct tcphdr *tcph = (struct tcphdr*)(iph + 1);
    if((void*)(tcph + 1) > data_end)
        return TC_ACT_OK;
    int old_counter = getHashOld(iph->daddr, tcph->source);
    if(old_counter < 0)
        return TC_ACT_OK;
    restoreIP(iph->daddr, tcph->source, old_counter, eth->h_dest);
    return TC_ACT_OK;
}
SEC("xdp_ing")
int xdp_ingress(struct xdp_md* ctx) {
    void *data = (void *)(long)ctx->data;
    void *data_end = (void*)(long)ctx->data_end;
    if(!is_TCP(data, data_end))
        return XDP_PASS;
    struct ethhdr *eth = data;
    struct iphdr *iph = (data + sizeof(struct ethhdr));
    struct tcphdr *tcph = (struct tcphdr*)(iph + 1);
    if((void*)(tcph + 1) > data_end)
        return XDP_PASS;
    int new_counter = getHashNew(iph->saddr, tcph->dest);
    if(new_counter < 0)
        return XDP_PASS;
    storeIP(iph->saddr, tcph->dest, new_counter, eth->h_source);
    return XDP_PASS;
}
