BPF_CFLAGS ?= -I../headers/

tc:
	clang -S \
	    -target bpf \
	    -D __BPF_TRACING__ \
	    $(BPF_CFLAGS) \
	    -Wall \
	    -Wno-unused-value \
	    -Wno-pointer-sign \
	    -Wno-compare-distinct-pointer-types \
	    -Werror \
	    -O2 -emit-llvm -c prog_tc.c -g -o prog_tc.ll
	 llc -march=bpf -filetype=obj -o prog_tc.o prog_tc.ll

test:
	clang -S \
	    -target bpf \
	    -D __BPF_TRACING__ \
	    $(BPF_CFLAGS) \
	    -Wall \
	    -Wno-unused-value \
	    -Wno-pointer-sign \
	    -Wno-compare-distinct-pointer-types \
	    -Werror \
	    -O2 -emit-llvm -c prog_test.c -g -o prog_test.ll
	llc -march=bpf -filetype=obj -o prog_test.o prog_test.ll

xdp:
	clang -S \
	    -target bpf \
	    -D __BPF_TRACING__ \
	    $(BPF_CFLAGS) \
	    -Wall \
	    -Wno-unused-value \
	    -Wno-pointer-sign \
	    -Wno-compare-distinct-pointer-types \
	    -Werror \
	    -O2 -emit-llvm -c prog_xdp.c -g -o prog_xdp.ll
	llc -march=bpf -filetype=obj -o prog_xdp.o prog_xdp.ll

