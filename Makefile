GFX_DIR = libs/libgfx
GFX_LIB = $(GFX_DIR)/libgfx.a

LUA_DIR = libs/LuaJIT
LUA_JIT = $(LUA_DIR)/src/luajit

LUA_MAIN = src/main.lua

.PHONY: all default run clean sync $(GFX_LIB)
all: $(GFX_LIB) $(LUA_JIT)
default: all

run: all
	$(LUA_JIT) $(LUA_MAIN)

clean:
	cd $(GFX_DIR); make clean
	cd $(LUA_DIR); make clean

sync:
	git submodule foreach --recursive git pull origin master

$(GFX_LIB):
	cd $(GFX_DIR); make -j$(nproc)

$(LUA_JIT):
	cd $(LUA_DIR); make -j$(nproc)
