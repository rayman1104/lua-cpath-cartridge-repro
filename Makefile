workspace_root:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: build_cartridge_c

clean:
	rm -rf tokio-hyper/target
	rm -rf hello-world/libcmodule.so
	rm -rf .rocks

build_cartridge_c: hello-world/libcmodule.so
build_cartridge_c: export LUA_CPATH=$(workspace_root)/hello-world/libcmodule.so
build_cartridge_c:
	cartridge build

hello-world/libcmodule.so:
	cd hello-world && cc -shared -o libcmodule.so lib.c

build_cartridge_rust: build_cargo
ifeq ($(shell uname), Darwin)
build_cartridge_rust: export LUA_CPATH=$(workspace_root)/tokio-hyper/target/debug/libtokio_hyper.dylib
else
build_cartridge_rust: export LUA_CPATH=$(workspace_root)/tokio-hyper/target/debug/libtokio_hyper.so
endif
build_cartridge_rust:
	cartridge build

build_cargo:
	cd tokio-hyper && cargo build
