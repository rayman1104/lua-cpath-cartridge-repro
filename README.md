# Tarantool-module repro for override.fiber error

https://github.com/picodata/tarantool-module/issues/22

## How to run

```bash
$ make
cd tokio-hyper && cargo build
    Finished dev [unoptimized + debuginfo] target(s) in 0.07s
cartridge build
   • Build application
   • Running `cartridge.pre-build`
   • Running `tarantoolctl rocks make`
PANIC: unprotected error in call to Lua API (builtin/internal.loaders.lua:222: error loading module 'override.fiber' from file './tokio-hyper/target/debug/libtokio_hyper.dylib':
	dlsym(0x9b2b3e30, luaopen_override_fiber): symbol not found)
   ⨯ Failed to install rocks: Failed to run
/opt/homebrew/bin/tarantoolctl rocks make

exit status 1
make: *** [build_cartridge] Error 1
```
