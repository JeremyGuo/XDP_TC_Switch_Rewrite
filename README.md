# TC_XDP_TEST

## Prepare

``` bash
sudo apt install clang llvm libelf-dev
```

And you should download the source code of iproute2

```
./configure --prefix=/usr
make
sudo make install
```

## Make environment

(Test in Ubuntu 18.04)

```bash
./make-env.sh
```

## Make object file

```bash
cd src
make tc
```

## Inject XDP(Ingress)

```bash
sudo ip link set dev veth0 xdp obj prog_tc.o sec xdp_ing
```

## Inject TC(Egress)

```bash
sudo tc qdisc add dev veth0 clsact
sudo tc filter add dev veth0 egress bpf da object-file prog_tc.o sec tc_egr
```
