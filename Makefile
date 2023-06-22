workspace_root:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: build_cartridge_c

build_cartridge_c: build_hello_world
ifeq ($(shell uname), Darwin)
build_cartridge_c: export LUA_CPATH=$(workspace_root)/hello-world/libcmodule.dylib
else
build_cartridge_c: export LUA_CPATH=$(workspace_root)/hello-world/libcmodule.so
endif
build_cartridge_c:
	cartridge build

build_hello_world:
	cd hello-world && cc -shared -o libcmodule.dylib lib.c

build_cartridge: build_cargo
ifeq ($(shell uname), Darwin)
build_cartridge: export LUA_CPATH=$(workspace_root)/tokio-hyper/target/debug/libtokio_hyper.dylib
else
build_cartridge: export LUA_CPATH=$(workspace_root)/tokio-hyper/target/debug/libtokio_hyper.so
endif
build_cartridge:
	cartridge build

build_cargo:
	cd tokio-hyper && cargo build
