local ffi = require('ffi')
local libgles3 = ffi.load('GLESv2')

ffi.cdef[[

typedef void			GLvoid;
typedef char			GLchar;
typedef unsigned int	GLenum;
typedef unsigned char	GLboolean;
typedef unsigned int 	GLbitfield;
typedef int8_t			GLbyte;
typedef short			GLshort;
typedef int				GLint;
typedef int				GLsizei;
typedef uint8_t			GLubyte;
typedef unsigned short	GLushort;
typedef unsigned int	GLuint;
typedef float			GLfloat;
typedef float			GLclampf;
typedef int32_t			GLfixed;
typedef long int		GLintptr;
typedef long int		GLsizeiptr;

typedef unsigned short	GLhalf;
typedef int64_t			GLint64;
typedef uint64_t		GLuint64;
typedef struct __GLsync	*GLsync;

void glClear(GLbitfield mask);
void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
const GLubyte* glGetString(GLenum name);
GLenum glGetError();
GLuint glCreateProgram();

]]

local gl = {
	COLOR_BUFFER_BIT = 0x00004000,
	VENDOR = 0x1F00,
	RENDERER = 0x1F01,
	VERSION = 0x1F02,
	EXTENSIONS = 0x1F03,
	SHADING_LANGUAGE_VERSION = 0x8B8C,

	clear = libgles3.glClear,
	clearColor = libgles3.glClearColor,
	getString = libgles3.glGetString,
	getError = libgles3.glGetError,
	createProgram = libgles3.glCreateProgram,
}

return gl
