#ifndef H_PROG

#include <linux/bpf.h>
#include <bpf_helpers.h>
#include <bpf_endian.h>
#include <linux/pkt_cls.h>
#include <linux/if_ether.h>
#include <linux/in.h>
#include <linux/ip.h>
#include <linux/tcp.h>

typedef unsigned int uint32_t;
typedef unsigned short uint16_t;

#ifndef lock_xadd
#define lock_xadd(ptr, val)	((void) __sync_fetch_and_add(ptr, val))
#endif

#define ELEM_MAX 32768
#define ELEM_MASK 32767
#define MAX_IP 256

struct data_elem {
    unsigned char   data[ETH_ALEN];
};

struct hash_elem {
    uint32_t counter;
};

struct ip_key {
    uint32_t ip;
    uint32_t port;
};

struct flow_key {
    struct ip_key key;
    int idx;
};

#define H_PROG
#endif