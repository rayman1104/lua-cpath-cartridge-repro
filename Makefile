workspace_root:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: build_cartridge

build_cargo:
	cd tokio-hyper && cargo build

build_cartridge: build_cargo
ifeq ($(shell uname), Darwin)
build_cartridge: export LUA_CPATH=$(workspace_root)/tokio-hyper/target/debug/libtokio_hyper.dylib
else
build_cartridge: export LUA_CPATH=$(workspace_root)/tokio-hyper/target/debug/libtokio_hyper.so
endif
build_cartridge:
	cartridge build
