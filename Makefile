GLFW_DIR = libs/glfw
GLFW_LIB = $(GLFW_DIR)/src/libglfw.so.3.3

LUA_DIR = libs/LuaJIT
LUA_JIT = $(LUA_DIR)/src/luajit

LUA_MAIN = main.lua

.PHONY: all default run sync
all: $(GLFW_LIB) $(LUA_JIT)
default: all

run: all
	$(LUA_JIT) $(LUA_MAIN)

sync:
	git submodule foreach --recursive git pull origin master

$(GLFW_LIB):
	cd $(GLFW_DIR); cmake -DBUILD_SHARED_LIBS=ON .; make -j$(nproc)

$(LUA_JIT):
	cd $(LUA_DIR); make -j$(nproc)
