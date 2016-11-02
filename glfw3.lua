local ffi = require('ffi')
libglfw3 = ffi.load('libs/glfw/src/libglfw.so')

ffi.cdef[[

typedef struct GLFWmonitor GLFWmonitor;
typedef struct GLFWwindow GLFWwindow;

int glfwInit();
void glfwTerminate();
GLFWwindow* glfwCreateWindow(int width, int height, const char *title, GLFWmonitor *monitor, GLFWwindow *share);
void glfwDestroyWindow(GLFWwindow *window);
int glfwWindowShouldClose(GLFWwindow *window);
void glfwMakeContextCurrent(GLFWwindow *window);
void glfwSwapBuffers(GLFWwindow *window);
void glfwPollEvents();

]]
