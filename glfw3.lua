local ffi = require('ffi')
local libglfw3 = ffi.load('libs/glfw/src/libglfw.so')

ffi.cdef[[

typedef struct GLFWmonitor GLFWmonitor;
typedef struct GLFWwindow GLFWwindow;

int glfwInit();
void glfwTerminate();
GLFWwindow* glfwCreateWindow(int width, int height, const char *title, GLFWmonitor *monitor, GLFWwindow *share);
void glfwDestroyWindow(GLFWwindow *window);
int glfwWindowShouldClose(GLFWwindow *window);
void glfwMakeContextCurrent(GLFWwindow *window);
void glfwSwapInterval(int interval);
void glfwSwapBuffers(GLFWwindow *window);
void glfwPollEvents();

]]

local glfw = {
	init = libglfw3.glfwInit,
	terminate = libglfw3.glfwTerminate,
	createWindow = libglfw3.glfwCreateWindow,
	destroyWindow = libglfw3.glfwDestroyWindow,
	windowShouldClose = libglfw3.glfwWindowShouldClose,
	makeContextCurrent = libglfw3.glfwMakeContextCurrent,
	swapInterval = libglfw3.glfwSwapInterval,
	swapBuffers = libglfw3.glfwSwapBuffers,
	pollEvents = libglfw3.glfwPollEvents,
}

return glfw
