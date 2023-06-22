# Tarantool repro for override.fiber error
This error is reproduced with Tarantool 2.11.0 and cartridge-cli 2.12.4 both on macOS and Linux.

## How to run

```bash
$ make
cd hello-world && cc -shared -o libcmodule.dylib lib.c
cartridge build
   • Build application
   • Running `cartridge.pre-build`
   • Running `tarantoolctl rocks make`
PANIC: unprotected error in call to Lua API (builtin/internal.loaders.lua:222: error loading module 'override.fiber' from file './hello-world/libcmodule.dylib':
	dlsym(0x9eaa7e30, luaopen_override_fiber): symbol not found)
   ⨯ Failed to install rocks: Failed to run
/opt/homebrew/bin/tarantoolctl rocks make

exit status 1
make: *** [build_cartridge_c] Error 1
```
