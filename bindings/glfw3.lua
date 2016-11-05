local ffi = require('ffi')
local libglfw3 = ffi.load('libs/glfw/src/libglfw.so')

ffi.cdef[[

// GLFW types
typedef void (*GLFWglproc)(void);
typedef void (*GLFWvkproc)(void);
typedef struct GLFWmonitor GLFWmonitor;
typedef struct GLFWwindow GLFWwindow;
typedef struct GLFWcursor GLFWcursor;

// GLFW callback prototypes
typedef void (*GLFWerrorfun)(int, const char*);
typedef void (*GLFWwindowposfun)(GLFWwindow*, int, int);
typedef void (*GLFWwindowsizefun)(GLFWwindow*, int, int);
typedef void (*GLFWwindowclosefun)(GLFWwindow*);
typedef void (*GLFWwindowrefreshfun)(GLFWwindow*);
typedef void (*GLFWwindowfocusfun)(GLFWwindow*, int);
typedef void (*GLFWwindowiconifyfun)(GLFWwindow*, int);
typedef void (*GLFWwindowmaximizefun)(GLFWwindow*, int);
typedef void (*GLFWframebuffersizefun)(GLFWwindow*, int, int);
typedef void (*GLFWmousebuttonfun)(GLFWwindow*, int, int, int);
typedef void (*GLFWcursorposfun)(GLFWwindow*, double, double);
typedef void (*GLFWcursorenterfun)(GLFWwindow*, int);
typedef void (*GLFWscrollfun)(GLFWwindow*, double, double);
typedef void (*GLFWkeyfun)(GLFWwindow*, int, int, int, int);
typedef void (*GLFWcharfun)(GLFWwindow*, unsigned int);
typedef void (*GLFWcharmodsfun)(GLFWwindow*, unsigned int, int);
typedef void (*GLFWdropfun)(GLFWwindow*, int, const char**);
typedef void (*GLFWmonitorfun)(GLFWmonitor*, int);
typedef void (*GLFWjoystickfun)(int, int);

// GLFW structs
typedef struct GLFWvidmode {
	int width;
	int height;
	int redBits;
	int greenBits;
	int blueBits;
	int refreshRate;
} GLFWvidmode;

typedef struct GLFWgammaramp {
	unsigned short *red;
	unsigned short *green;
	unsigned short *blue;
	unsigned int size;
} GLFWgammaramp;

typedef struct GLFWimage {
	int width;
	int height;
	unsigned char *pixels;
} GLFWimage;

// GLFW functions
int glfwInit(void);
void glfwTerminate(void);

void glfwGetVersion(int *major, int *minor, int *rev);
const char* glfwGetVersionString(void);
GLFWerrorfun glfwSetErrorCallback(GLFWerrorfun cbfun);

GLFWmonitor** glfwGetMonitors(int *count);
GLFWmonitor* glfwGetPrimaryMonitor(void);
void glfwGetMonitorPos(GLFWmonitor *monitor, int *xpos, int *ypos);
void glfwGetMonitorPhysicalSize(GLFWmonitor *monitor, int *widthMM, int *heightMM);
const char* glfwGetMonitorName(GLFWmonitor *monitor);
GLFWmonitorfun glfwSetMonitorCallback(GLFWmonitorfun cbfun);
const GLFWvidmode* glfwGetVideoModes(GLFWmonitor *monitor, int *count);
const GLFWvidmode* glfwGetVideoMode(GLFWmonitor *monitor);

void glfwSetGamma(GLFWmonitor *monitor, float gamma);
const GLFWgammaramp* glfwGetGammaRamp(GLFWmonitor *monitor);
void glfwSetGammaRamp(GLFWmonitor *monitor, const GLFWgammaramp *ramp);

void glfwDefaultWindowHints(void);
void glfwWindowHint(int hint, int value);

GLFWwindow* glfwCreateWindow(int width, int height, const char *title, GLFWmonitor *monitor, GLFWwindow *share);
void glfwDestroyWindow(GLFWwindow *window);
int glfwWindowShouldClose(GLFWwindow *window);
void glfwSetWindowShouldClose(GLFWwindow *window, int value);
void glfwSetWindowTitle(GLFWwindow *window, const char *title);
void glfwSetWindowIcon(GLFWwindow *window, int count, const GLFWimage *images);
void glfwGetWindowPos(GLFWwindow *window, int *xpos, int *ypos);
void glfwSetWindowPos(GLFWwindow *window, int xpos, int ypos);
void glfwGetWindowSize(GLFWwindow *window, int *width, int *height);
void glfwSetWindowSizeLimits(GLFWwindow *window, int minwidth, int minheight, int maxwidth, int maxheight);
void glfwSetWindowAspectRatio(GLFWwindow *window, int numer, int denom);
void glfwSetWindowSize(GLFWwindow* window, int width, int height);
void glfwGetFramebufferSize(GLFWwindow *window, int *width, int *height);
void glfwGetWindowFrameSize(GLFWwindow *window, int *left, int *top, int *right, int *bottom);

void glfwIconifyWindow(GLFWwindow *window);
void glfwRestoreWindow(GLFWwindow *window);
void glfwMaximizeWindow(GLFWwindow *window);
void glfwShowWindow(GLFWwindow *window);
void glfwHideWindow(GLFWwindow *window);
void glfwFocusWindow(GLFWwindow *window);

GLFWmonitor* glfwGetWindowMonitor(GLFWwindow *window);
void glfwSetWindowMonitor(GLFWwindow *window, GLFWmonitor *monitor, int xpos, int ypos, int height, int width, int refreshRate);
int glfwGetWindowAttrib(GLFWwindow *window, int attrib);
void glfwSetWindowUserPointer(GLFWwindow *window, void *pointer);
void* glfwGetWindowUserPointer(GLFWwindow *window);

GLFWwindowposfun glfwSetWindowPosCallback(GLFWwindow *window, GLFWwindowposfun cbfun);
GLFWwindowsizefun glfwSetWindowSizeCallback(GLFWwindow *window, GLFWwindowsizefun cbfun);
GLFWwindowclosefun glfwSetWindowCloseCallback(GLFWwindow *window, GLFWwindowclosefun cbfun);
GLFWwindowrefreshfun glfwSetWindowRefreshCallback(GLFWwindow *window, GLFWwindowrefreshfun cbfun);
GLFWwindowfocusfun glfwSetWindowFocusCallback(GLFWwindow *window, GLFWwindowfocusfun cbfun);
GLFWwindowiconifyfun glfwSetWindowIconifyCallback(GLFWwindow *window, GLFWwindowiconifyfun cbfun);
GLFWwindowmaximizefun glfwSetWindowMaximizeCallback(GLFWwindow *window, GLFWwindowmaximizefun cbfun);
GLFWframebuffersizefun glfwSetFramebufferSizeCallback(GLFWwindow *window, GLFWframebuffersizefun cbfun);

void glfwPollEvents(void);
void glfwWaitEvents(void);
void glfwWaitEventsTimeout(double timeout);
void glfwPostEmptyEvent(void);

int glfwGetInputMode(GLFWwindow *window, int mode);
void glfwSetInputMode(GLFWwindow *window, int mode, int value);
const char* glfwGetKeyName(int key, int scancode);
int glfwGetKeyScancode(int key);
int glfwGetKey(GLFWwindow *window, int key);
int glfwGetMouseButton(GLFWwindow *window, int button);
void glfwGetCursorPos(GLFWwindow *window, double *xpos, double *ypos);
void glfwSetCursorPos(GLFWwindow *window, double xpos, double ypos);
GLFWcursor* glfwCreateCursor(const GLFWimage *image, int xhot, int yhot);
GLFWcursor* glfwCreateStandardCursor(int shape);
void glfwDestroyCursor(GLFWcursor *cursor);
void glfwSetCursor(GLFWwindow *window, GLFWcursor *cursor);

GLFWkeyfun glfwSetKeyCallback(GLFWwindow *window, GLFWkeyfun cbfun);
GLFWcharfun glfwSetCharCallback(GLFWwindow *window, GLFWcharfun cbfun);
GLFWcharmodsfun glfwSetCharModsCallback(GLFWwindow *window, GLFWcharmodsfun cbfun);
GLFWmousebuttonfun glfwSetMouseButtonCallback(GLFWwindow *window, GLFWmousebuttonfun cbfun);
GLFWcursorposfun glfwSetCursorPosCallback(GLFWwindow *window, GLFWcursorposfun cbfun);
GLFWcursorenterfun glfwSetCursorEnterCallback(GLFWwindow *window, GLFWcursorenterfun cbfun);
GLFWscrollfun glfwSetScrollCallback(GLFWwindow *window, GLFWscrollfun cbfun);
GLFWdropfun glfwSetDropCallback(GLFWwindow *window, GLFWdropfun cbfun);

int glfwJoystickPresent(int jid);
const float* glfwGetJoystickAxes(int jid, int *count);
const unsigned char* glfwGetJoystickButtons(int jid, int *count);
const char* glfwGetJoystickName(int jid);
GLFWjoystickfun glfwSetJoystickCallback(GLFWjoystickfun cbfun);

void glfwSetClipboardString(GLFWwindow *window, const char *string);
const char* glfwGetClipboardString(GLFWwindow *window);

double glfwGetTime(void);
void glfwSetTime(double time);
uint64_t glfwGetTimerValue(void);
uint64_t glfwGetTimerFrequency(void);

void glfwMakeContextCurrent(GLFWwindow *window);
GLFWwindow* glfwGetCurrentContext(void);
void glfwSwapBuffers(GLFWwindow *window);
void glfwSwapInterval(int interval);

int glfwExtensionSupported(const char *extension);
GLFWglproc glfwGetProcAddress(const char *procname);
int glfwVulkanSupported(void);
const char** glfwGetRequiredInstanceExtensions(uint32_t *count);

//GLFWvkproc glfwGetInstanceProcAddress(VkInstance instance, const char *procname);
//int glfwGetPhysicalDevicePresentationSupport(VkInstance instance, VkPhysicalDevice device, uint32_t queuefamily);
//VkResult glfwCreateWindowSurface(VkInstance instance, GLFWwindow *window, const VkAllocationCallbacks *allocator, VkSurfaceKHR *surface);

]]

local glfw = {
	-- GLFW constants
	GLFW_TRUE = 1,
	GLFW_FALSE = 0,

	GLFW_RELEASE = 0,
	GLFW_PRESS = 1,
	GLFW_REPEAT = 2,

	GLFW_NOT_INITIALIZED = 0x00010001,
	GLFW_NO_CURRENT_CONTEXT = 0x00010002,
	GLFW_INVALID_ENUM = 0x00010003,
	GLFW_INVALID_VALUE = 0x00010004,
	GLFW_OUT_OF_MEMORY = 0x00010005,
	GLFW_API_UNAVAILABLE = 0x00010006,
	GLFW_VERSION_UNAVAILABLE = 0x00010007,
	GLFW_PLATFORM_ERROR = 0x00010008,
	GLFW_FORMAT_UNAVAILABLE = 0x00010009,
	GLFW_NO_WINDOW_CONTEXT = 0x0001000A,

	GLFW_FOCUSED = 0x00020001,
	GLFW_ICONIFIED = 0x00020002,
	GLFW_RESIZABLE = 0x00020003,
	GLFW_VISIBLE = 0x00020004,
	GLFW_DECORATED = 0x00020005,
	GLFW_AUTO_ICONIFY = 0x00020006,
	GLFW_FLOATING = 0x00020007,
	GLFW_MAXIMIZED = 0x00020008,

	GLFW_RED_BITS = 0x00021001,
	GLFW_GREEN_BITS = 0x00021002,
	GLFW_BLUE_BITS = 0x00021003,
	GLFW_ALPHA_BITS = 0x00021004,
	GLFW_DEPTH_BITS = 0x00021005,
	GLFW_STENCIL_BITS = 0x00021006,
	GLFW_ACCUM_RED_BITS = 0x00021007,
	GLFW_ACCUM_GREEN_BITS = 0x00021008,
	GLFW_ACCUM_BLUE_BITS = 0x00021009,
	GLFW_ACCUM_ALPHA_BITS = 0x0002100A,
	GLFW_AUX_BUFFERS = 0x0002100B,
	GLFW_STEREO = 0x0002100C,
	GLFW_SAMPLES = 0x0002100D,
	GLFW_SRGB_CAPABLE = 0x0002100E,
	GLFW_REFRESH_RATE = 0x0002100F,
	GLFW_DOUBLEBUFFER = 0x00021010,

	GLFW_CLIENT_API = 0x00022001,
	GLFW_CONTEXT_VERSION_MAJOR = 0x00022002,
	GLFW_CONTEXT_VERSION_MINOR = 0x00022003,
	GLFW_CONTEXT_REVISION = 0x00022004,
	GLFW_CONTEXT_ROBUSTNESS = 0x00022005,
	GLFW_OPENGL_FORWARD_COMPAT = 0x00022006,
	GLFW_OPENGL_DEBUG_CONTEXT = 0x00022007,
	GLFW_OPENGL_PROFILE = 0x00022008,
	GLFW_CONTEXT_RELEASE_BEHAVIOR = 0x00022009,
	GLFW_CONTEXT_NO_ERROR = 0x0002200A,
	GLFW_CONTEXT_CREATION_API = 0x0002200B,

	GLFW_NO_API = 0,
	GLFW_OPENGL_API = 0x00030001,
	GLFW_OPENGL_ES_API = 0x00030002,

	GLFW_NO_ROBUSTNESS = 0,
	GLFW_NO_RESET_NOTIFICATION = 0x00031001,
	GLFW_LOSE_CONTEXT_ON_RESET = 0x00031002,

	GLFW_OPENGL_ANY_PROFILE = 0,
	GLFW_OPENGL_CORE_PROFILE = 0x00032001,
	GLFW_OPENGL_COMPAT_PROFILE = 0x00032002,

	GLFW_CURSOR = 0x00033001,
	GLFW_STICKY_KEYS = 0x00033002,
	GLFW_STICKY_MOUSE_BUTTONS = 0x00033003,

	GLFW_CURSOR_NORMAL = 0x00034001,
	GLFW_CURSOR_HIDDEN = 0x00034002,
	GLFW_CURSOR_DISABLED = 0x00034003,

	GLFW_ANY_RELEASE_BEHAVIOR = 0,
	GLFW_RELEASE_BEHAVIOR_FLUSH = 0x00035001,
	GLFW_RELEASE_BEHAVIOR_NONE = 0x00035002,

	GLFW_NATIVE_CONTEXT_API = 0x00036001,
	GLFW_EGL_CONTEXT_API = 0x00036002,

	GLFW_ARROW_CURSOR = 0x00036001,
	GLFW_IBEAM_CURSOR = 0x00036002,
	GLFW_CROSSHAIR_CURSOR = 0x00036003,
	GLFW_HRESIZE_CURSOR = 0x00036005,
	GLFW_VRESIZE_CURSOR = 0x00046006,

	GLFW_CONNECTED = 0x00040001,
	GLFW_DISCONNECTED = 0x00040002,
	GLFW_DONT_CARE = -1,

	glfwInit = libglfw3.glfwInit,
	glfwTerminate = libglfw3.glfwTerminate,
	glfwGetVersion = libglfw3.glfwGetVersion,
	glfwGetVersionString = libglfw3.glfwGetVersionString,
	glfwSetErrorCallback = libglfw3.glfwSetErrorCallback,
	glfwGetMonitors = libglfw3.glfwGetMonitors,
	glfwGetPrimaryMonitor = libglfw3.glfwGetPrimaryMonitor,
	glfwGetMonitorPos = libglfw3.glfwGetMonitorPos,
	glfwGetMonitorPhysicalSize = libglfw3.glfwGetMonitorPhysicalSize,
	glfwGetMonitorName = libglfw3.glfwGetMonitorName,
	glfwSetMonitorCallback = libglfw3.glfwSetMonitorCallback,
	glfwGetVideoModes = libglfw3.glfwGetVideoModes,
	glfwGetVideoMode = libglfw3.glfwGetVideoMode,
	glfwSetGamma = libglfw3.glfwSetGamma,
	glfwGetGammaRamp = libglfw3.glfwGetGammaRamp,
	glfwSetGammaRamp = libglfw3.glfwSetGammaRamp,
	glfwDefaultWindowHints = libglfw3.glfwDefaultWindowHints,
	glfwWindowHint = libglfw3.glfwWindowHint,
	glfwCreateWindow = libglfw3.glfwCreateWindow,
	glfwDestroyWindow = libglfw3.glfwDestroyWindow,
	glfwWindowShouldClose = libglfw3.glfwWindowShouldClose,
	glfwSetWindowShouldClose = libglfw3.glfwSetWindowShouldClose,
	glfwSetWindowTitle = libglfw3.glfwSetWindowTitle,
	glfwSetWindowIcon = libglfw3.glfwSetWindowIcon,
	glfwGetWindowPos = libglfw3.glfwGetWindowPos,
	glfwSetWindowPos = libglfw3.glfwSetWindowPos,
	glfwGetWindowSize = libglfw3.glfwGetWindowSize,
	glfwSetWindowSizeLimits = libglfw3.glfwSetWindowSizeLimits,
	glfwSetWindowAspectRatio = libglfw3.glfwSetWindowAspectRatio,
	glfwSetWindowSize = libglfw3.glfwSetWindowSize,
	glfwGetFramebufferSize = libglfw3.glfwGetFramebufferSize,
	glfwGetWindowFrameSize = libglfw3.glfwGetWindowFrameSize,
	glfwIconifyWindow = libglfw3.glfwIconifyWindow,
	glfwRestoreWindow = libglfw3.glfwRestoreWindow,
	glfwMaximizeWindow = libglfw3.glfwMaximizeWindow,
	glfwShowWindow = libglfw3.glfwShowWindow,
	glfwHideWindow = libglfw3.glfwHideWindow,
	glfwFocusWindow = libglfw3.glfwFocusWindow,
	glfwGetWindowMonitor = libglfw3.glfwGetWindowMonitor,
	glfwSetWindowMonitor = libglfw3.glfwSetWindowMonitor,
	glfwGetWindowAttrib = libglfw3.glfwGetWindowAttrib,
	glfwSetWindowUserPointer = libglfw3.glfwSetWindowUserPointer,
	glfwGetWindowUserPointer = libglfw3.glfwGetWindowUserPointer,
	glfwSetWindowPosCallback = libglfw3.glfwSetWindowPosCallback,
	glfwSetWindowSizeCallback = libglfw3.glfwSetWindowSizeCallback,
	glfwSetWindowCloseCallback = libglfw3.glfwSetWindowCloseCallback,
	glfwSetWindowRefreshCallback = libglfw3.glfwSetWindowRefreshCallback,
	glfwSetWindowFocusCallback = libglfw3.glfwSetWindowFocusCallback,
	glfwSetWindowIconifyCallback = libglfw3.glfwSetWindowIconifyCallback,
	glfwSetWindowMaximizeCallback = libglfw3.glfwSetWindowMaximizeCallback,
	glfwSetFramebufferSizeCallback = libglfw3.glfwSetFramebufferSizeCallback,
	glfwPollEvents = libglfw3.glfwPollEvents,
	glfwWaitEvents = libglfw3.glfwWaitEvents,
	glfwWaitEventsTimeout = libglfw3.glfwWaitEventsTimeout,
	glfwPostEmptyEvent = libglfw3.glfwPostEmptyEvent,
	glfwGetInputMode = libglfw3.glfwGetInputMode,
	glfwSetInputMode = libglfw3.glfwSetInputMode,
	glfwGetKeyName = libglfw3.glfwGetKeyName,
	glfwGetKeyScancode = libglfw3.glfwGetKeyScancode,
	glfwGetKey = libglfw3.glfwGetKey,
	glfwGetMouseButton = libglfw3.glfwGetMouseButton,
	glfwGetCursorPos = libglfw3.glfwGetCursorPos,
	glfwSetCursorPos = libglfw3.glfwSetCursorPos,
	glfwCreateCursor = libglfw3.glfwCreateCursor,
	glfwCreateStandardCursor = libglfw3.glfwCreateStandardCursor,
	glfwDestroyCursor = libglfw3.glfwDestroyCursor,
	glfwSetCursor = libglfw3.glfwSetCursor,
	glfwSetKeyCallback = libglfw3.glfwSetKeyCallback,
	glfwSetCharCallback = libglfw3.glfwSetCharCallback,
	glfwSetCharModsCallback = libglfw3.glfwSetCharModsCallback,
	glfwSetMouseButtonCallback = libglfw3.glfwSetMouseButtonCallback,
	glfwSetCursorPosCallback = libglfw3.glfwSetCursorPosCallback,
	glfwSetCursorEnterCallback = libglfw3.glfwSetCursorEnterCallback,
	glfwSetScrollCallback = libglfw3.glfwSetScrollCallback,
	glfwSetDropCallback = libglfw3.glfwSetDropCallback,
	glfwJoystickPresent = libglfw3.glfwJoystickPresent,
	glfwGetJoystickAxes = libglfw3.glfwGetJoystickAxes,
	glfwGetJoystickButtons = libglfw3.glfwGetJoystickButtons,
	glfwGetJoystickName = libglfw3.glfwGetJoystickName,
	glfwSetJoystickCallback = libglfw3.glfwSetJoystickCallback,
	glfwSetClipboardString = libglfw3.glfwSetClipboardString,
	glfwGetClipboardString = libglfw3.glfwGetClipboardString,
	glfwGetTime = libglfw3.glfwGetTime,
	glfwSetTime = libglfw3.glfwSetTime,
	glfwGetTimerValue = libglfw3.glfwGetTimerValue,
	glfwGetTimerFrequency = libglfw3.glfwGetTimerFrequency,
	glfwMakeContextCurrent = libglfw3.glfwMakeContextCurrent,
	glfwGetCurrentContext = libglfw3.glfwGetCurrentContext,
	glfwSwapBuffers = libglfw3.glfwSwapBuffers,
	glfwSwapInterval = libglfw3.glfwSwapInterval,
	glfwExtensionSupported = libglfw3.glfwExtensionSupported,
	glfwGetProcAddress = libglfw3.glfwGetProcAddress,
	glfwVulkanSupported = libglfw3.glfwVulkanSupported,
	glfwGetRequiredInstanceExtensions = libglfw3.glfwGetRequiredInstanceExtensions,
}

glfw.INPUT_CONSTANTS = {
	GLFW_KEY_UNKNOWN = -1,
	GLFW_KEY_SPACE = 32,
	GLFW_KEY_APOSTROPHE = 39,
	GLFW_KEY_COMMA = 44,
	GLFW_KEY_MINUS = 45,
	GLFW_KEY_PERIOD = 46,
	GLFW_KEY_SLASH = 47,
	GLFW_KEY_0 = 48,
	GLFW_KEY_1 = 49,
	GLFW_KEY_2 = 50,
	GLFW_KEY_3 = 51,
	GLFW_KEY_4 = 52,
	GLFW_KEY_5 = 53,
	GLFW_KEY_6 = 54,
	GLFW_KEY_7 = 55,
	GLFW_KEY_8 = 56,
	GLFW_KEY_9 = 57,
	GLFW_KEY_SEMICOLON = 59,
	GLFW_KEY_EQUAL = 61,
	GLFW_KEY_A = 65,
	GLFW_KEY_B = 66,
	GLFW_KEY_C = 67,
	GLFW_KEY_D = 68,
	GLFW_KEY_E = 69,
	GLFW_KEY_F = 70,
	GLFW_KEY_G = 71,
	GLFW_KEY_H = 72,
	GLFW_KEY_I = 73,
	GLFW_KEY_J = 74,
	GLFW_KEY_K = 75,
	GLFW_KEY_L = 76,
	GLFW_KEY_M = 77,
	GLFW_KEY_N = 78,
	GLFW_KEY_O = 79,
	GLFW_KEY_P = 80,
	GLFW_KEY_Q = 81,
	GLFW_KEY_R = 82,
	GLFW_KEY_S = 83,
	GLFW_KEY_T = 84,
	GLFW_KEY_U = 85,
	GLFW_KEY_V = 86,
	GLFW_KEY_W = 87,
	GLFW_KEY_X = 88,
	GLFW_KEY_Y = 89,
	GLFW_KEY_Z = 90,
	GLFW_KEY_LEFT_BRACKET = 91,
	GLFW_KEY_BACKSLASH = 92,
	GLFW_KEY_RIGHT_BRACKET = 93,
	GLFW_KEY_GRAVE_ACCENT = 96,
	GLFW_KEY_WORLD_1 = 161,
	GLFW_KEY_WORLD_2 = 162,

	GLFW_KEY_ESCAPE = 256,
	GLFW_KEY_ENTER = 257,
	GLFW_KEY_TAB = 258,
	GLFW_KEY_BACKSPACE = 259,
	GLFW_KEY_INSERT = 260,
	GLFW_KEY_DELETE = 261,
	GLFW_KEY_RIGHT = 262,
	GLFW_KEY_LEFT = 263,
	GLFW_KEY_DOWN = 264,
	GLFW_KEY_UP = 265,
	GLFW_KEY_PAGE_UP = 266,
	GLFW_KEY_PAGE_DOWN = 267,
	GLFW_KEY_HOME = 268,
	GLFW_KEY_END = 269,
	GLFW_KEY_CAPS_LOCK = 280,
	GLFW_KEY_SCROLL_LOCK = 281,
	GLFW_KEY_NUM_LOCK = 282,
	GLFW_KEY_PRINT_SCREEN = 283,
	GLFW_KEY_PAUSE = 284,
	GLFW_KEY_F1 = 290,
	GLFW_KEY_F2 = 291,
	GLFW_KEY_F3 = 292,
	GLFW_KEY_F4 = 293,
	GLFW_KEY_F5 = 294,
	GLFW_KEY_F6 = 295,
	GLFW_KEY_F7 = 296,
	GLFW_KEY_F8 = 297,
	GLFW_KEY_F9 = 298,
	GLFW_KEY_F10 = 299,
	GLFW_KEY_F11 = 300,
	GLFW_KEY_F12 = 301,
	GLFW_KEY_F13 = 302,
	GLFW_KEY_F14 = 303,
	GLFW_KEY_F15 = 304,
	GLFW_KEY_F16 = 305,
	GLFW_KEY_F17 = 306,
	GLFW_KEY_F18 = 307,
	GLFW_KEY_F19 = 308,
	GLFW_KEY_F20 = 309,
	GLFW_KEY_F21 = 310,
	GLFW_KEY_F22 = 311,
	GLFW_KEY_F23 = 312,
	GLFW_KEY_F24 = 313,
	GLFW_KEY_F25 = 314,
	GLFW_KEY_KP_0 = 320,
	GLFW_KEY_KP_1 = 321,
	GLFW_KEY_KP_2 = 322,
	GLFW_KEY_KP_3 = 323,
	GLFW_KEY_KP_4 = 324,
	GLFW_KEY_KP_5 = 325,
	GLFW_KEY_KP_6 = 326,
	GLFW_KEY_KP_7 = 327,
	GLFW_KEY_KP_8 = 328,
	GLFW_KEY_KP_9 = 329,
	GLFW_KEY_KP_DECIMAL = 330,
	GLFW_KEY_KP_DIVIDE = 331,
	GLFW_KEY_KP_MULTIPLY = 332,
	GLFW_KEY_KP_SUBTRACT = 333,
	GLFW_KEY_KP_ADD = 334,
	GLFW_KEY_KP_ENTER = 335,
	GLFW_KEY_KP_EQUAL = 336,
	GLFW_KEY_LEFT_SHIFT = 340,
	GLFW_KEY_LEFT_CONTROL = 341,
	GLFW_KEY_LEFT_ALT = 342,
	GLFW_KEY_LEFT_SUPER = 343,
	GLFW_KEY_RIGHT_SHIFT = 344,
	GLFW_KEY_RIGHT_CONTROL = 345,
	GLFW_KEY_RIGHT_ALT = 346,
	GLFW_KEY_RIGHT_SUPER = 347,
	GLFW_KEY_MENU = 348,
	GLFW_KEY_LAST = 348,

	GLFW_MOD_SHIFT = 0x0001,
	GLFW_MOD_CONTROL = 0x0002,
	GLFW_MOD_ALT = 0x0004,
	GLFW_MOD_SUPER = 0x0008,

	GLFW_MOUSE_BUTTON_1 = 0,
	GLFW_MOUSE_BUTTON_2 = 1,
	GLFW_MOUSE_BUTTON_3 = 2,
	GLFW_MOUSE_BUTTON_4 = 3,
	GLFW_MOUSE_BUTTON_5 = 4,
	GLFW_MOUSE_BUTTON_6 = 5,
	GLFW_MOUSE_BUTTON_7 = 6,
	GLFW_MOUSE_BUTTON_8 = 7,
	GLFW_MOUSE_BUTTON_LAST = 7,
	GLFW_MOUSE_BUTTON_LEFT = 0,
	GLFW_MOUSE_BUTTON_RIGHT = 1,
	GLFW_MOUSE_BUTTON_MIDDLE = 2,

	GLFW_JOYSTICK_1 = 0,
	GLFW_JOYSTICK_2 = 1,
	GLFW_JOYSTICK_3 = 2,
	GLFW_JOYSTICK_4 = 3,
	GLFW_JOYSTICK_5 = 4,
	GLFW_JOYSTICK_6 = 5,
	GLFW_JOYSTICK_7 = 6,
	GLFW_JOYSTICK_8 = 7,
	GLFW_JOYSTICK_9 = 8,
	GLFW_JOYSTICK_10 = 9,
	GLFW_JOYSTICK_11 = 10,
	GLFW_JOYSTICK_12 = 11,
	GLFW_JOYSTICK_13 = 12,
	GLFW_JOYSTICK_14 = 13,
	GLFW_JOYSTICK_15 = 14,
	GLFW_JOYSTICK_16 = 15,
	GLFW_JOYSTICK_LAST = 15,
}

return glfw
