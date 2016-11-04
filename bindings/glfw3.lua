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

]]

local glfw = {
	
	-- GLFW constants
	TRUE = 1,
	FALSE = 0,

	RELEASE = 0,
	PRESS = 1,
	REPEAT = 2,

	NOT_INITIALIZED = 0x00010001,
	NO_CURRENT_CONTEXT = 0x00010002,
	INVALID_ENUM = 0x00010003,
	INVALID_VALUE = 0x00010004,
	OUT_OF_MEMORY = 0x00010005,
	API_UNAVAILABLE = 0x00010006,
	VERSION_UNAVAILABLE = 0x00010007,
	PLATFORM_ERROR = 0x00010008,
	FORMAT_UNAVAILABLE = 0x00010009,
	NO_WINDOW_CONTEXT = 0x0001000A,

	FOCUSED = 0x00020001,
	ICONIFIED = 0x00020002,
	RESIZABLE = 0x00020003,
	VISIBLE = 0x00020004,
	DECORATED = 0x00020005,
	AUTO_ICONIFY = 0x00020006,
	FLOATING = 0x00020007,
	MAXIMIZED = 0x00020008,

	RED_BITS = 0x00021001,
	GREEN_BITS = 0x00021002,
	BLUE_BITS = 0x00021003,
	ALPHA_BITS = 0x00021004,
	DEPTH_BITS = 0x00021005,
	STENCIL_BITS = 0x00021006,
	ACCUM_RED_BITS = 0x00021007,
	ACCUM_GREEN_BITS = 0x00021008,
	ACCUM_BLUE_BITS = 0x00021009,
	ACCUM_ALPHA_BITS = 0x0002100A,
	AUX_BUFFERS = 0x0002100B,
	STEREO = 0x0002100C,
	SAMPLES = 0x0002100D,
	SRGB_CAPABLE = 0x0002100E,
	REFRESH_RATE = 0x0002100F,
	DOUBLEBUFFER = 0x00021010,

	CLIENT_API = 0x00022001,
	CONTEXT_VERSION_MAJOR = 0x00022002,
	CONTEXT_VERSION_MINOR = 0x00022003,
	CONTEXT_REVISION = 0x00022004,
	CONTEXT_ROBUSTNESS = 0x00022005,
	OPENGL_FORWARD_COMPAT = 0x00022006,
	OPENGL_DEBUG_CONTEXT = 0x00022007,
	OPENGL_PROFILE = 0x00022008,
	CONTEXT_RELEASE_BEHAVIOR = 0x00022009,
	CONTEXT_NO_ERROR = 0x0002200A,
	CONTEXT_CREATION_API = 0x0002200B,

	NO_API = 0,
	OPENGL_API = 0x00030001,
	OPENGL_ES_API = 0x00030002,

	NO_ROBUSTNESS = 0,
	NO_RESET_NOTIFICATION = 0x00031001,
	LOSE_CONTEXT_ON_RESET = 0x00031002,

	OPENGL_ANY_PROFILE = 0,
	OPENGL_CORE_PROFILE = 0x00032001,
	OPENGL_COMPAT_PROFILE = 0x00032002,

	CURSOR = 0x00033001,
	STICKY_KEYS = 0x00033002,
	STICKY_MOUSE_BUTTONS = 0x00033003,

	CURSOR_NORMAL = 0x00034001,
	CURSOR_HIDDEN = 0x00034002,
	CURSOR_DISABLED = 0x00034003,

	ANY_RELEASE_BEHAVIOR = 0,
	RELEASE_BEHAVIOR_FLUSH = 0x00035001,
	RELEASE_BEHAVIOR_NONE = 0x00035002,

	NATIVE_CONTEXT_API = 0x00036001,
	EGL_CONTEXT_API = 0x00036002,

	ARROW_CURSOR = 0x00036001,
	IBEAM_CURSOR = 0x00036002,
	CROSSHAIR_CURSOR = 0x00036003,
	HRESIZE_CURSOR = 0x00036005,
	VRESIZE_CURSOR = 0x00046006,

	CONNECTED = 0x00040001,
	DISCONNECTED = 0x00040002,
	DONT_CARE = -1,

	init = libglfw3.glfwInit,
	terminate = libglfw3.glfwTerminate,
	getVersion = libglfw3.glfwGetVersion,
	getVersionString = libglfw3.glfwGetVersionString,
	setErrorCallback = libglfw3.glfwSetErrorCallback,
	getMonitors = libglfw3.glfwGetMonitors,
	getPrimaryMonitor = libglfw3.glfwGetPrimaryMonitor,
	getMonitorPos = libglfw3.glfwGetMonitorPos,
	getMonitorPhysicalSize = libglfw3.glfwGetMonitorPhysicalSize,
	getMonitorName = libglfw3.glfwGetMonitorName,
	setMonitorCallback = libglfw3.glfwSetMonitorCallback,
	getVideoModes = libglfw3.glfwGetVideoModes,
	getVideoMode = libglfw3.glfwGetVideoMode,
	setGamma = libglfw3.glfwSetGamma,
	getGammaRamp = libglfw3.glfwGetGammaRamp,
	setGammaRamp = libglfw3.glfwSetGammaRamp,
	defaultWindowHints = libglfw3.glfwDefaultWindowHints,
	windowHint = libglfw3.glfwWindowHint,
	createWindow = libglfw3.glfwCreateWindow,
	destroyWindow = libglfw3.glfwDestroyWindow,
	windowShouldClose = libglfw3.glfwWindowShouldClose,
	setWindowShouldClose = libglfw3.glfwSetWindowShouldClose,
	setWindowTitle = libglfw3.glfwSetWindowTitle,
	setWindowIcon = libglfw3.glfwSetWindowIcon,
	getWindowPos = libglfw3.glfwGetWindowPos,
	setWindowPos = libglfw3.glfwSetWindowPos,
	getWindowSize = libglfw3.glfwGetWindowSize,
	setWindowSizeLimits = libglfw3.glfwSetWindowSizeLimits,
	setWindowAspectRatio = libglfw3.glfwSetWindowAspectRatio,
	setWindowSize = libglfw3.glfwSetWindowSize,
	getFramebufferSize = libglfw3.glfwGetFramebufferSize,
	getWindowFrameSize = libglfw3.glfwGetWindowFrameSize,
	iconifyWindow = libglfw3.glfwIconifyWindow,
	restoreWindow = libglfw3.glfwRestoreWindow,
	maximizeWindow = libglfw3.glfwMaximizeWindow,
	showWindow = libglfw3.glfwShowWindow,
	hideWindow = libglfw3.glfwHideWindow,
	focusWindow = libglfw3.glfwFocusWindow,
	getWindowMonitor = libglfw3.glfwGetWindowMonitor,
	setWindowMonitor = libglfw3.glfwSetWindowMonitor,
	getWindowAttrib = libglfw3.glfwGetWindowAttrib,
	setWindowUserPointer = libglfw3.glfwSetWindowUserPointer,
	getWindowUserPointer = libglfw3.glfwGetWindowUserPointer,
	setWindowPosCallback = libglfw3.glfwSetWindowPosCallback,
	setWindowSizeCallback = libglfw3.glfwSetWindowSizeCallback,
	setWindowCloseCallback = libglfw3.glfwSetWindowCloseCallback,
	setWindowRefreshCallback = libglfw3.glfwSetWindowRefreshCallback,
	setWindowFocusCallback = libglfw3.glfwSetWindowFocusCallback,
	setWindowIconifyCallback = libglfw3.glfwSetWindowIconifyCallback,
	setWindowMaximizeCallback = libglfw3.glfwSetWindowMaximizeCallback,
	setFramebufferSizeCallback = libglfw3.glfwSetFramebufferSizeCallback,
	pollEvents = libglfw3.glfwPollEvents,
	waitEvents = libglfw3.glfwWaitEvents,
	waitEventsTimeout = libglfw3.glfwWaitEventsTimeout,
	postEmptyEvent = libglfw3.glfwPostEmptyEvent,
	getInputMode = libglfw3.glfwGetInputMode,
	setInputMode = libglfw3.glfwSetInputMode,
	getKeyName = libglfw3.glfwGetKeyName,
	getKeyScancode = libglfw3.glfwGetKeyScancode,
	getKey = libglfw3.glfwGetKey,
	getMouseButton = libglfw3.glfwGetMouseButton,
	getCursorPos = libglfw3.glfwGetCursorPos,
	setCursorPos = libglfw3.glfwSetCursorPos,
	createCursor = libglfw3.glfwCreateCursor,
	createStandardCursor = libglfw3.glfwCreateStandardCursor,
	destroyCursor = libglfw3.glfwDestroyCursor,
	setCursor = libglfw3.glfwSetCursor,
	setKeyCallback = libglfw3.glfwSetKeyCallback,
	setCharCallback = libglfw3.glfwSetCharCallback,
	setCharModsCallback = libglfw3.glfwSetCharModsCallback,
	setMouseButtonCallback = libglfw3.glfwSetMouseButtonCallback,
	setCursorPosCallback = libglfw3.glfwSetCursorPosCallback,
	setCursorEnterCallback = libglfw3.glfwSetCursorEnterCallback,
	setScrollCallback = libglfw3.glfwSetScrollCallback,
	setDropCallback = libglfw3.glfwSetDropCallback,
	joystickPresent = libglfw3.glfwJoystickPresent,
	getJoystickAxes = libglfw3.glfwGetJoystickAxes,
	getJoystickButtons = libglfw3.glfwGetJoystickButtons,
	getJoystickName = libglfw3.glfwGetJoystickName,
	setJoystickCallback = libglfw3.glfwSetJoystickCallback,
	setClipboardString = libglfw3.glfwSetClipboardString,
	getClipboardString = libglfw3.glfwGetClipboardString,
	getTime = libglfw3.glfwGetTime,
	setTime = libglfw3.glfwSetTime,
	getTimerValue = libglfw3.glfwGetTimerValue,
	getTimerFrequency = libglfw3.glfwGetTimerFrequency,
	makeContextCurrent = libglfw3.glfwMakeContextCurrent,
	getCurrentContext = libglfw3.glfwGetCurrentContext,
	swapBuffers = libglfw3.glfwSwapBuffers,
	swapInterval = libglfw3.glfwSwapInterval,
	extensionSupported = libglfw3.glfwExtensionSupported,
	getProcAddress = libglfw3.glfwGetProcAddress,
	vulkanSupported = libglfw3.glfwVulkanSupported,
	getRequiredInstanceExtensions = libglfw3.glfwGetRequiredInstanceExtensions,

}

glfw.INPUT_CONSTANTS = {

	KEY_UNKNOWN = -1,
	KEY_SPACE = 32,
	KEY_APOSTROPHE = 39,
	KEY_COMMA = 44,
	KEY_MINUS = 45,
	KEY_PERIOD = 46,
	KEY_SLASH = 47,
	KEY_0 = 48,
	KEY_1 = 49,
	KEY_2 = 50,
	KEY_3 = 51,
	KEY_4 = 52,
	KEY_5 = 53,
	KEY_6 = 54,
	KEY_7 = 55,
	KEY_8 = 56,
	KEY_9 = 57,
	KEY_SEMICOLON = 59,
	KEY_EQUAL = 61,
	KEY_A = 65,
	KEY_B = 66,
	KEY_C = 67,
	KEY_D = 68,
	KEY_E = 69,
	KEY_F = 70,
	KEY_G = 71,
	KEY_H = 72,
	KEY_I = 73,
	KEY_J = 74,
	KEY_K = 75,
	KEY_L = 76,
	KEY_M = 77,
	KEY_N = 78,
	KEY_O = 79,
	KEY_P = 80,
	KEY_Q = 81,
	KEY_R = 82,
	KEY_S = 83,
	KEY_T = 84,
	KEY_U = 85,
	KEY_V = 86,
	KEY_W = 87,
	KEY_X = 88,
	KEY_Y = 89,
	KEY_Z = 90,
	KEY_LEFT_BRACKET = 91,
	KEY_BACKSLASH = 92,
	KEY_RIGHT_BRACKET = 93,
	KEY_GRAVE_ACCENT = 96,
	KEY_WORLD_1 = 161,
	KEY_WORLD_2 = 162,

	KEY_ESCAPE = 256,
	KEY_ENTER = 257,
	KEY_TAB = 258,
	KEY_BACKSPACE = 259,
	KEY_INSERT = 260,
	KEY_DELETE = 261,
	KEY_RIGHT = 262,
	KEY_LEFT = 263,
	KEY_DOWN = 264,
	KEY_UP = 265,
	KEY_PAGE_UP = 266,
	KEY_PAGE_DOWN = 267,
	KEY_HOME = 268,
	KEY_END = 269,
	KEY_CAPS_LOCK = 280,
	KEY_SCROLL_LOCK = 281,
	KEY_NUM_LOCK = 282,
	KEY_PRINT_SCREEN = 283,
	KEY_PAUSE = 284,
	KEY_F1 = 290,
	KEY_F2 = 291,
	KEY_F3 = 292,
	KEY_F4 = 293,
	KEY_F5 = 294,
	KEY_F6 = 295,
	KEY_F7 = 296,
	KEY_F8 = 297,
	KEY_F9 = 298,
	KEY_F10 = 299,
	KEY_F11 = 300,
	KEY_F12 = 301,
	KEY_F13 = 302,
	KEY_F14 = 303,
	KEY_F15 = 304,
	KEY_F16 = 305,
	KEY_F17 = 306,
	KEY_F18 = 307,
	KEY_F19 = 308,
	KEY_F20 = 309,
	KEY_F21 = 310,
	KEY_F22 = 311,
	KEY_F23 = 312,
	KEY_F24 = 313,
	KEY_F25 = 314,
	KEY_KP_0 = 320,
	KEY_KP_1 = 321,
	KEY_KP_2 = 322,
	KEY_KP_3 = 323,
	KEY_KP_4 = 324,
	KEY_KP_5 = 325,
	KEY_KP_6 = 326,
	KEY_KP_7 = 327,
	KEY_KP_8 = 328,
	KEY_KP_9 = 329,
	KEY_KP_DECIMAL = 330,
	KEY_KP_DIVIDE = 331,
	KEY_KP_MULTIPLY = 332,
	KEY_KP_SUBTRACT = 333,
	KEY_KP_ADD = 334,
	KEY_KP_ENTER = 335,
	KEY_KP_EQUAL = 336,
	KEY_LEFT_SHIFT = 340,
	KEY_LEFT_CONTROL = 341,
	KEY_LEFT_ALT = 342,
	KEY_LEFT_SUPER = 343,
	KEY_RIGHT_SHIFT = 344,
	KEY_RIGHT_CONTROL = 345,
	KEY_RIGHT_ALT = 346,
	KEY_RIGHT_SUPER = 347,
	KEY_MENU = 348,
	KEY_LAST = 348,

	MOD_SHIFT = 0x0001,
	MOD_CONTROL = 0x0002,
	MOD_ALT = 0x0004,
	MOD_SUPER = 0x0008,

	MOUSE_BUTTON_1 = 0,
	MOUSE_BUTTON_2 = 1,
	MOUSE_BUTTON_3 = 2,
	MOUSE_BUTTON_4 = 3,
	MOUSE_BUTTON_5 = 4,
	MOUSE_BUTTON_6 = 5,
	MOUSE_BUTTON_7 = 6,
	MOUSE_BUTTON_8 = 7,
	MOUSE_BUTTON_LAST = 7,
	MOUSE_BUTTON_LEFT = 0,
	MOUSE_BUTTON_RIGHT = 1,
	MOUSE_BUTTON_MIDDLE = 2,

	JOYSTICK_1 = 0,
	JOYSTICK_2 = 1,
	JOYSTICK_3 = 2,
	JOYSTICK_4 = 3,
	JOYSTICK_5 = 4,
	JOYSTICK_6 = 5,
	JOYSTICK_7 = 6,
	JOYSTICK_8 = 7,
	JOYSTICK_9 = 8,
	JOYSTICK_10 = 9,
	JOYSTICK_11 = 10,
	JOYSTICK_12 = 11,
	JOYSTICK_13 = 12,
	JOYSTICK_14 = 13,
	JOYSTICK_15 = 14,
	JOYSTICK_16 = 15,
	JOYSTICK_LAST = 15,

}

return glfw
