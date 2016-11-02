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

]]

local gl = {
	COLOR_BUFFER_BIT = 0x00004000,

	clear = libgles3.glClear,
}

return gl
