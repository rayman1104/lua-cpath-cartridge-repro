workspace_root:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: run_cartridge_c

clean:
	cartridge stop
	killall -9 tarantool || true
	rm -rf tokio-hyper/target
	rm -rf hello-world/libcmodule.so
	rm -rf tmp
	rm -rf .rocks

run_cartridge_c: build_cartridge_c
	cartridge start

build_cartridge_c: export LUA_CPATH=$(workspace_root)/hello-world/lib?.so;;
build_cartridge_c: hello-world/libcmodule.so
	cartridge build

hello-world/libcmodule.so:
	cd hello-world && cc -shared -o libcmodule.so lib.c

run_cartridge_rust: build_cartridge_rust
	cartridge start

build_cartridge_rust: export LUA_CPATH=$(workspace_root)/tokio-hyper/target/debug/lib?.dylib;$(workspace_root)/tokio-hyper/target/debug/lib?.so;;
build_cartridge_rust: tokio-hyper/target
	cartridge build

tokio-hyper/target:
	cd tokio-hyper && cargo build
