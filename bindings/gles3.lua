local ffi = require('ffi')
libgles3 = ffi.load('GLESv2')

--[[
Definition taken from:
https://www.khronos.org/registry/gles/api/GLES3/gl3.h
--]]

ffi.cdef[[

// GLES 2.0 types
typedef int8_t          GLbyte;
typedef float           GLclampf;
typedef int32_t         GLfixed;
typedef short           GLshort;
typedef unsigned short  GLushort;
typedef void            GLvoid;
typedef struct __GLsync *GLsync;
typedef int64_t         GLint64;
typedef uint64_t        GLuint64;
typedef unsigned int    GLenum;
typedef unsigned int    GLuint;
typedef char            GLchar;
typedef float           GLfloat;
typedef long int        GLsizeiptr;
typedef long int        GLintptr;
typedef unsigned int    GLbitfield;
typedef int             GLint;
typedef unsigned char   GLboolean;
typedef int             GLsizei;
typedef uint8_t         GLubyte;

// GLES 3.0 types
typedef unsigned short  GLhalf;

// GLES 2.0 functions
void glActiveTexture (GLenum texture);
void glAttachShader (GLuint program, GLuint shader);
void glBindAttribLocation (GLuint program, GLuint index, const GLchar *name);
void glBindBuffer (GLenum target, GLuint buffer);
void glBindFramebuffer (GLenum target, GLuint framebuffer);
void glBindRenderbuffer (GLenum target, GLuint renderbuffer);
void glBindTexture (GLenum target, GLuint texture);
void glBlendColor (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
void glBlendEquation (GLenum mode);
void glBlendEquationSeparate (GLenum modeRGB, GLenum modeAlpha);
void glBlendFunc (GLenum sfactor, GLenum dfactor);
void glBlendFuncSeparate (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
void glBufferData (GLenum target, GLsizeiptr size, const void *data, GLenum usage);
void glBufferSubData (GLenum target, GLintptr offset, GLsizeiptr size, const void *data);
GLenum glCheckFramebufferStatus (GLenum target);
void glClear (GLbitfield mask);
void glClearColor (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
void glClearDepthf (GLfloat d);
void glClearStencil (GLint s);
void glColorMask (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
void glCompileShader (GLuint shader);
void glCompressedTexImage2D (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void *data);
void glCompressedTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *data);
void glCopyTexImage2D (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
void glCopyTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
GLuint glCreateProgram (void);
GLuint glCreateShader (GLenum type);
void glCullFace (GLenum mode);
void glDeleteBuffers (GLsizei n, const GLuint *buffers);
void glDeleteFramebuffers (GLsizei n, const GLuint *framebuffers);
void glDeleteProgram (GLuint program);
void glDeleteRenderbuffers (GLsizei n, const GLuint *renderbuffers);
void glDeleteShader (GLuint shader);
void glDeleteTextures (GLsizei n, const GLuint *textures);
void glDepthFunc (GLenum func);
void glDepthMask (GLboolean flag);
void glDepthRangef (GLfloat n, GLfloat f);
void glDetachShader (GLuint program, GLuint shader);
void glDisable (GLenum cap);
void glDisableVertexAttribArray (GLuint index);
void glDrawArrays (GLenum mode, GLint first, GLsizei count);
void glDrawElements (GLenum mode, GLsizei count, GLenum type, const void *indices);
void glEnable (GLenum cap);
void glEnableVertexAttribArray (GLuint index);
void glFinish (void);
void glFlush (void);
void glFramebufferRenderbuffer (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
void glFramebufferTexture2D (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void glFrontFace (GLenum mode);
void glGenBuffers (GLsizei n, GLuint *buffers);
void glGenerateMipmap (GLenum target);
void glGenFramebuffers (GLsizei n, GLuint *framebuffers);
void glGenRenderbuffers (GLsizei n, GLuint *renderbuffers);
void glGenTextures (GLsizei n, GLuint *textures);
void glGetActiveAttrib (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
void glGetActiveUniform (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
void glGetAttachedShaders (GLuint program, GLsizei maxCount, GLsizei *count, GLuint *shaders);
GLint glGetAttribLocation (GLuint program, const GLchar *name);
void glGetBooleanv (GLenum pname, GLboolean *data);
void glGetBufferParameteriv (GLenum target, GLenum pname, GLint *params);
GLenum glGetError (void);
void glGetFloatv (GLenum pname, GLfloat *data);
void glGetFramebufferAttachmentParameteriv (GLenum target, GLenum attachment, GLenum pname, GLint *params);
void glGetIntegerv (GLenum pname, GLint *data);
void glGetProgramiv (GLuint program, GLenum pname, GLint *params);
void glGetProgramInfoLog (GLuint program, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
void glGetRenderbufferParameteriv (GLenum target, GLenum pname, GLint *params);
void glGetShaderiv (GLuint shader, GLenum pname, GLint *params);
void glGetShaderInfoLog (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
void glGetShaderPrecisionFormat (GLenum shadertype, GLenum precisiontype, GLint *range, GLint *precision);
void glGetShaderSource (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *source);
const GLubyte* glGetString (GLenum name);
void glGetTexParameterfv (GLenum target, GLenum pname, GLfloat *params);
void glGetTexParameteriv (GLenum target, GLenum pname, GLint *params);
void glGetUniformfv (GLuint program, GLint location, GLfloat *params);
void glGetUniformiv (GLuint program, GLint location, GLint *params);
GLint glGetUniformLocation (GLuint program, const GLchar *name);
void glGetVertexAttribfv (GLuint index, GLenum pname, GLfloat *params);
void glGetVertexAttribiv (GLuint index, GLenum pname, GLint *params);
void glGetVertexAttribPointerv (GLuint index, GLenum pname, void **pointer);
void glHint (GLenum target, GLenum mode);
GLboolean glIsBuffer (GLuint buffer);
GLboolean glIsEnabled (GLenum cap);
GLboolean glIsFramebuffer (GLuint framebuffer);
GLboolean glIsProgram (GLuint program);
GLboolean glIsRenderbuffer (GLuint renderbuffer);
GLboolean glIsShader (GLuint shader);
GLboolean glIsTexture (GLuint texture);
void glLineWidth (GLfloat width);
void glLinkProgram (GLuint program);
void glPixelStorei (GLenum pname, GLint param);
void glPolygonOffset (GLfloat factor, GLfloat units);
void glReadPixels (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, void *pixels);
void glReleaseShaderCompiler (void);
void glRenderbufferStorage (GLenum target, GLenum internalformat, GLsizei width, GLsizei height);
void glSampleCoverage (GLfloat value, GLboolean invert);
void glScissor (GLint x, GLint y, GLsizei width, GLsizei height);
void glShaderBinary (GLsizei count, const GLuint *shaders, GLenum binaryformat, const void *binary, GLsizei length);
void glShaderSource (GLuint shader, GLsizei count, const GLchar *const*string, const GLint *length);
void glStencilFunc (GLenum func, GLint ref, GLuint mask);
void glStencilFuncSeparate (GLenum face, GLenum func, GLint ref, GLuint mask);
void glStencilMask (GLuint mask);
void glStencilMaskSeparate (GLenum face, GLuint mask);
void glStencilOp (GLenum fail, GLenum zfail, GLenum zpass);
void glStencilOpSeparate (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass);
void glTexImage2D (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const void *pixels);
void glTexParameterf (GLenum target, GLenum pname, GLfloat param);
void glTexParameterfv (GLenum target, GLenum pname, const GLfloat *params);
void glTexParameteri (GLenum target, GLenum pname, GLint param);
void glTexParameteriv (GLenum target, GLenum pname, const GLint *params);
void glTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels);
void glUniform1f (GLint location, GLfloat v0);
void glUniform1fv (GLint location, GLsizei count, const GLfloat *value);
void glUniform1i (GLint location, GLint v0);
void glUniform1iv (GLint location, GLsizei count, const GLint *value);
void glUniform2f (GLint location, GLfloat v0, GLfloat v1);
void glUniform2fv (GLint location, GLsizei count, const GLfloat *value);
void glUniform2i (GLint location, GLint v0, GLint v1);
void glUniform2iv (GLint location, GLsizei count, const GLint *value);
void glUniform3f (GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
void glUniform3fv (GLint location, GLsizei count, const GLfloat *value);
void glUniform3i (GLint location, GLint v0, GLint v1, GLint v2);
void glUniform3iv (GLint location, GLsizei count, const GLint *value);
void glUniform4f (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
void glUniform4fv (GLint location, GLsizei count, const GLfloat *value);
void glUniform4i (GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
void glUniform4iv (GLint location, GLsizei count, const GLint *value);
void glUniformMatrix2fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix3fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix4fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUseProgram (GLuint program);
void glValidateProgram (GLuint program);
void glVertexAttrib1f (GLuint index, GLfloat x);
void glVertexAttrib1fv (GLuint index, const GLfloat *v);
void glVertexAttrib2f (GLuint index, GLfloat x, GLfloat y);
void glVertexAttrib2fv (GLuint index, const GLfloat *v);
void glVertexAttrib3f (GLuint index, GLfloat x, GLfloat y, GLfloat z);
void glVertexAttrib3fv (GLuint index, const GLfloat *v);
void glVertexAttrib4f (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glVertexAttrib4fv (GLuint index, const GLfloat *v);
void glVertexAttribPointer (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const void *pointer);
void glViewport (GLint x, GLint y, GLsizei width, GLsizei height);

// GLES 3.0 functions
void glBeginQuery (GLenum target, GLuint id);
void glBeginTransformFeedback (GLenum primitiveMode);
void glBindBufferBase (GLenum target, GLuint index, GLuint buffer);
void glBindBufferRange (GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size);
void glBindSampler (GLuint unit, GLuint sampler);
void glBindTransformFeedback (GLenum target, GLuint id);
void glBindVertexArray (GLuint array);
void glBlitFramebuffer (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
void glClearBufferfi (GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil);
void glClearBufferfv (GLenum buffer, GLint drawbuffer, const GLfloat *value);
void glClearBufferiv (GLenum buffer, GLint drawbuffer, const GLint *value);
void glClearBufferuiv (GLenum buffer, GLint drawbuffer, const GLuint *value);
GLenum glClientWaitSync (GLsync sync, GLbitfield flags, GLuint64 timeout);
void glCompressedTexImage3D (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void *data);
void glCompressedTexSubImage3D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *data);
void glCopyBufferSubData (GLenum readTarget, GLenum writeTarget, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size);
void glCopyTexSubImage3D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glDeleteQueries (GLsizei n, const GLuint *ids);
void glDeleteSamplers (GLsizei count, const GLuint *samplers);
void glDeleteSync (GLsync sync);
void glDeleteTransformFeedbacks (GLsizei n, const GLuint *ids);
void glDeleteVertexArrays (GLsizei n, const GLuint *arrays);
void glDrawArraysInstanced (GLenum mode, GLint first, GLsizei count, GLsizei instancecount);
void glDrawBuffers (GLsizei n, const GLenum *bufs);
void glDrawElementsInstanced (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei instancecount);
void glDrawRangeElements (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const void *indices);
void glEndQuery (GLenum target);
void glEndTransformFeedback (void);
GLsync glFenceSync (GLenum condition, GLbitfield flags);
void glFlushMappedBufferRange (GLenum target, GLintptr offset, GLsizeiptr length);
void glFramebufferTextureLayer (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer);
void glGenQueries (GLsizei n, GLuint *ids);
void glGenSamplers (GLsizei count, GLuint *samplers);
void glGenTransformFeedbacks (GLsizei n, GLuint *ids);
void glGenVertexArrays (GLsizei n, GLuint *arrays);
void glGetActiveUniformBlockName (GLuint program, GLuint uniformBlockIndex, GLsizei bufSize, GLsizei *length, GLchar *uniformBlockName);
void glGetActiveUniformBlockiv (GLuint program, GLuint uniformBlockIndex, GLenum pname, GLint *params);
void glGetActiveUniformsiv (GLuint program, GLsizei uniformCount, const GLuint *uniformIndices, GLenum pname, GLint *params);
void glGetBufferParameteri64v (GLenum target, GLenum pname, GLint64 *params);
void glGetBufferPointerv (GLenum target, GLenum pname, void **params);
GLint glGetFragDataLocation (GLuint program, const GLchar *name);
void glGetInteger64i_v (GLenum target, GLuint index, GLint64 *data);
void glGetInteger64v (GLenum pname, GLint64 *data);
void glGetIntegeri_v (GLenum target, GLuint index, GLint *data);
void glGetInternalformativ (GLenum target, GLenum internalformat, GLenum pname, GLsizei bufSize, GLint *params);
void glGetProgramBinary (GLuint program, GLsizei bufSize, GLsizei *length, GLenum *binaryFormat, void *binary);
void glGetQueryObjectuiv (GLuint id, GLenum pname, GLuint *params);
void glGetQueryiv (GLenum target, GLenum pname, GLint *params);
void glGetSamplerParameterfv (GLuint sampler, GLenum pname, GLfloat *params);
void glGetSamplerParameteriv (GLuint sampler, GLenum pname, GLint *params);
const GLubyte* glGetStringi (GLenum name, GLuint index);
void glGetSynciv (GLsync sync, GLenum pname, GLsizei bufSize, GLsizei *length, GLint *values);
void glGetTransformFeedbackVarying (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLsizei *size, GLenum *type, GLchar *name);
GLuint glGetUniformBlockIndex (GLuint program, const GLchar *uniformBlockName);
void glGetUniformIndices (GLuint program, GLsizei uniformCount, const GLchar *const*uniformNames, GLuint *uniformIndices);
void glGetUniformuiv (GLuint program, GLint location, GLuint *params);
void glGetVertexAttribIiv (GLuint index, GLenum pname, GLint *params);
void glGetVertexAttribIuiv (GLuint index, GLenum pname, GLuint *params);
void glInvalidateFramebuffer (GLenum target, GLsizei numAttachments, const GLenum *attachments);
void glInvalidateSubFramebuffer (GLenum target, GLsizei numAttachments, const GLenum *attachments, GLint x, GLint y, GLsizei width, GLsizei height);
GLboolean glIsQuery (GLuint id);
GLboolean glIsSampler (GLuint sampler);
GLboolean glIsSync (GLsync sync);
GLboolean glIsTransformFeedback (GLuint id);
GLboolean glIsVertexArray (GLuint array);
void glMapBufferRange (GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access);
void glPauseTransformFeedback (void);
void glProgramBinary (GLuint program, GLenum binaryFormat, const void *binary, GLsizei length);
void glProgramParameteri (GLuint program, GLenum pname, GLint value);
void glReadBuffer (GLenum src);
void glRenderbufferStorageMultisample (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
void glResumeTransformFeedback (void);
void glSamplerParameterf (GLuint sampler, GLenum pname, GLfloat param);
void glSamplerParameterfv (GLuint sampler, GLenum pname, const GLfloat *param);
void glSamplerParameteri (GLuint sampler, GLenum pname, GLint param);
void glSamplerParameteriv (GLuint sampler, GLenum pname, const GLint *param);
void glTexImage3D (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void *pixels);
void glTexStorage2D (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
void glTexStorage3D (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
void glTexSubImage3D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels);
void glTransformFeedbackVaryings (GLuint program, GLsizei count, const GLchar *const*varyings, GLenum bufferMode);
void glUniform1ui (GLint location, GLuint v0);
void glUniform1uiv (GLint location, GLsizei count, const GLuint *value);
void glUniform2ui (GLint location, GLuint v0, GLuint v1);
void glUniform2uiv (GLint location, GLsizei count, const GLuint *value);
void glUniform3ui (GLint location, GLuint v0, GLuint v1, GLuint v2);
void glUniform3uiv (GLint location, GLsizei count, const GLuint *value);
void glUniform4ui (GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
void glUniform4uiv (GLint location, GLsizei count, const GLuint *value);
void glUniformBlockBinding (GLuint program, GLuint uniformBlockIndex, GLuint uniformBlockBinding);
void glUniformMatrix2x3fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix2x4fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix3x2fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix3x4fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix4x2fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix4x3fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
GLboolean glUnmapBuffer (GLenum target);
void glVertexAttribDivisor (GLuint index, GLuint divisor);
void glVertexAttribI4i (GLuint index, GLint x, GLint y, GLint z, GLint w);
void glVertexAttribI4iv (GLuint index, const GLint *v);
void glVertexAttribI4ui (GLuint index, GLuint x, GLuint y, GLuint z, GLuint w);
void glVertexAttribI4uiv (GLuint index, const GLuint *v);
void glVertexAttribIPointer (GLuint index, GLint size, GLenum type, GLsizei stride, const void *pointer);
void glWaitSync (GLsync sync, GLbitfield flags, GLuint64 timeout);

]]

local gl = {

	-- GLES 2.0 constants
	ACTIVE_ATTRIBUTES = 0x8B89,
	ACTIVE_ATTRIBUTE_MAX_LENGTH = 0x8B8A,
	ACTIVE_TEXTURE = 0x84E0,
	ACTIVE_UNIFORMS = 0x8B86,
	ACTIVE_UNIFORM_MAX_LENGTH = 0x8B87,
	ALIASED_LINE_WIDTH_RANGE = 0x846E,
	ALIASED_POINT_SIZE_RANGE = 0x846D,
	ALPHA = 0x1906,
	ALPHA_BITS = 0x0D55,
	ALWAYS = 0x0207,
	ARRAY_BUFFER = 0x8892,
	ARRAY_BUFFER_BINDING = 0x8894,
	ATTACHED_SHADERS = 0x8B85,
	BACK = 0x0405,
	BLEND = 0x0BE2,
	BLEND_COLOR = 0x8005,
	BLEND_DST_ALPHA = 0x80CA,
	BLEND_DST_RGB = 0x80C8,
	BLEND_EQUATION = 0x8009,
	BLEND_EQUATION_ALPHA = 0x883D,
	BLEND_EQUATION_RGB = 0x8009,
	BLEND_SRC_ALPHA = 0x80CB,
	BLEND_SRC_RGB = 0x80C9,
	BLUE_BITS = 0x0D54,
	BOOL = 0x8B56,
	BOOL_VEC2 = 0x8B57,
	BOOL_VEC3 = 0x8B58,
	BOOL_VEC4 = 0x8B59,
	BUFFER_SIZE = 0x8764,
	BUFFER_USAGE = 0x8765,
	BYTE = 0x1400,
	CCW = 0x0901,
	CLAMP_TO_EDGE = 0x812F,
	COLOR_ATTACHMENT0 = 0x8CE0,
	COLOR_BUFFER_BIT = 0x00004000,
	COLOR_CLEAR_VALUE = 0x0C22,
	COLOR_WRITEMASK = 0x0C23,
	COMPILE_STATUS = 0x8B81,
	COMPRESSED_TEXTURE_FORMATS = 0x86A3,
	CONSTANT_ALPHA = 0x8003,
	CONSTANT_COLOR = 0x8001,
	CULL_FACE = 0x0B44,
	CULL_FACE_MODE = 0x0B45,
	CURRENT_PROGRAM = 0x8B8D,
	CURRENT_VERTEX_ATTRIB = 0x8626,
	CW = 0x0900,
	DECR = 0x1E03,
	DECR_WRAP = 0x8508,
	DELETE_STATUS = 0x8B80,
	DEPTH_ATTACHMENT = 0x8D00,
	DEPTH_BITS = 0x0D56,
	DEPTH_BUFFER_BIT = 0x00000100,
	DEPTH_CLEAR_VALUE = 0x0B73,
	DEPTH_COMPONENT = 0x1902,
	DEPTH_COMPONENT16 = 0x81A5,
	DEPTH_FUNC = 0x0B74,
	DEPTH_RANGE = 0x0B70,
	DEPTH_TEST = 0x0B71,
	DEPTH_WRITEMASK = 0x0B72,
	DITHER = 0x0BD0,
	DONT_CARE = 0x1100,
	DST_ALPHA = 0x0304,
	DST_COLOR = 0x0306,
	DYNAMIC_DRAW = 0x88E8,
	ELEMENT_ARRAY_BUFFER = 0x8893,
	ELEMENT_ARRAY_BUFFER_BINDING = 0x8895,
	EQUAL = 0x0202,
	EXTENSIONS = 0x1F03,
	FALSE = 0,
	FASTEST = 0x1101,
	FIXED = 0x140C,
	FLOAT = 0x1406,
	FLOAT_MAT2 = 0x8B5A,
	FLOAT_MAT3 = 0x8B5B,
	FLOAT_MAT4 = 0x8B5C,
	FLOAT_VEC2 = 0x8B50,
	FLOAT_VEC3 = 0x8B51,
	FLOAT_VEC4 = 0x8B52,
	FRAGMENT_SHADER = 0x8B30,
	FRAMEBUFFER = 0x8D40,
	FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1,
	FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0,
	FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3,
	FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2,
	FRAMEBUFFER_BINDING = 0x8CA6,
	FRAMEBUFFER_COMPLETE = 0x8CD5,
	FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6,
	FRAMEBUFFER_INCOMPLETE_DIMENSIONS = 0x8CD9,
	FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7,
	FRAMEBUFFER_UNSUPPORTED = 0x8CDD,
	FRONT = 0x0404,
	FRONT_AND_BACK = 0x0408,
	FRONT_FACE = 0x0B46,
	FUNC_ADD = 0x8006,
	FUNC_REVERSE_SUBTRACT = 0x800B,
	FUNC_SUBTRACT = 0x800A,
	GENERATE_MIPMAP_HINT = 0x8192,
	GEQUAL = 0x0206,
	GREATER = 0x0204,
	GREEN_BITS = 0x0D53,
	HIGH_FLOAT = 0x8DF2,
	HIGH_INT = 0x8DF5,
	IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B,
	IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A,
	INCR = 0x1E02,
	INCR_WRAP = 0x8507,
	INFO_LOG_LENGTH = 0x8B84,
	INT = 0x1404,
	INT_VEC2 = 0x8B53,
	INT_VEC3 = 0x8B54,
	INT_VEC4 = 0x8B55,
	INVALID_ENUM = 0x0500,
	INVALID_FRAMEBUFFER_OPERATION = 0x0506,
	INVALID_OPERATION = 0x0502,
	INVALID_VALUE = 0x0501,
	INVERT = 0x150A,
	KEEP = 0x1E00,
	LEQUAL = 0x0203,
	LESS = 0x0201,
	LINEAR = 0x2601,
	LINEAR_MIPMAP_LINEAR = 0x2703,
	LINEAR_MIPMAP_NEAREST = 0x2701,
	LINES = 0x0001,
	LINE_LOOP = 0x0002,
	LINE_STRIP = 0x0003,
	LINE_WIDTH = 0x0B21,
	LINK_STATUS = 0x8B82,
	LOW_FLOAT = 0x8DF0,
	LOW_INT = 0x8DF3,
	LUMINANCE = 0x1909,
	LUMINANCE_ALPHA = 0x190A,
	MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D,
	MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C,
	MAX_FRAGMENT_UNIFORM_VECTORS = 0x8DFD,
	MAX_RENDERBUFFER_SIZE = 0x84E8,
	MAX_TEXTURE_IMAGE_UNITS = 0x8872,
	MAX_TEXTURE_SIZE = 0x0D33,
	MAX_VARYING_VECTORS = 0x8DFC,
	MAX_VERTEX_ATTRIBS = 0x8869,
	MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C,
	MAX_VERTEX_UNIFORM_VECTORS = 0x8DFB,
	MAX_VIEWPORT_DIMS = 0x0D3A,
	MEDIUM_FLOAT = 0x8DF1,
	MEDIUM_INT = 0x8DF4,
	MIRRORED_REPEAT = 0x8370,
	NEAREST = 0x2600,
	NEAREST_MIPMAP_LINEAR = 0x2702,
	NEAREST_MIPMAP_NEAREST = 0x2700,
	NEVER = 0x0200,
	NICEST = 0x1102,
	NONE = 0,
	NOTEQUAL = 0x0205,
	NO_ERROR = 0,
	NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2,
	NUM_SHADER_BINARY_FORMATS = 0x8DF9,
	ONE = 1,
	ONE_MINUS_CONSTANT_ALPHA = 0x8004,
	ONE_MINUS_CONSTANT_COLOR = 0x8002,
	ONE_MINUS_DST_ALPHA = 0x0305,
	ONE_MINUS_DST_COLOR = 0x0307,
	ONE_MINUS_SRC_ALPHA = 0x0303,
	ONE_MINUS_SRC_COLOR = 0x0301,
	OUT_OF_MEMORY = 0x0505,
	PACK_ALIGNMENT = 0x0D05,
	POINTS = 0x0000,
	POLYGON_OFFSET_FACTOR = 0x8038,
	POLYGON_OFFSET_FILL = 0x8037,
	POLYGON_OFFSET_UNITS = 0x2A00,
	RED_BITS = 0x0D52,
	RENDERBUFFER = 0x8D41,
	RENDERBUFFER_ALPHA_SIZE = 0x8D53,
	RENDERBUFFER_BINDING = 0x8CA7,
	RENDERBUFFER_BLUE_SIZE = 0x8D52,
	RENDERBUFFER_DEPTH_SIZE = 0x8D54,
	RENDERBUFFER_GREEN_SIZE = 0x8D51,
	RENDERBUFFER_HEIGHT = 0x8D43,
	RENDERBUFFER_INTERNAL_FORMAT = 0x8D44,
	RENDERBUFFER_RED_SIZE = 0x8D50,
	RENDERBUFFER_STENCIL_SIZE = 0x8D55,
	RENDERBUFFER_WIDTH = 0x8D42,
	RENDERER = 0x1F01,
	REPEAT = 0x2901,
	REPLACE = 0x1E01,
	RGB = 0x1907,
	RGB565 = 0x8D62,
	RGB5_A1 = 0x8057,
	RGBA = 0x1908,
	RGBA4 = 0x8056,
	SAMPLER_2D = 0x8B5E,
	SAMPLER_CUBE = 0x8B60,
	SAMPLES = 0x80A9,
	SAMPLE_ALPHA_TO_COVERAGE = 0x809E,
	SAMPLE_BUFFERS = 0x80A8,
	SAMPLE_COVERAGE = 0x80A0,
	SAMPLE_COVERAGE_INVERT = 0x80AB,
	SAMPLE_COVERAGE_VALUE = 0x80AA,
	SCISSOR_BOX = 0x0C10,
	SCISSOR_TEST = 0x0C11,
	SHADER_BINARY_FORMATS = 0x8DF8,
	SHADER_COMPILER = 0x8DFA,
	SHADER_SOURCE_LENGTH = 0x8B88,
	SHADER_TYPE = 0x8B4F,
	SHADING_LANGUAGE_VERSION = 0x8B8C,
	SHORT = 0x1402,
	SRC_ALPHA = 0x0302,
	SRC_ALPHA_SATURATE = 0x0308,
	SRC_COLOR = 0x0300,
	STATIC_DRAW = 0x88E4,
	STENCIL_ATTACHMENT = 0x8D20,
	STENCIL_BACK_FAIL = 0x8801,
	STENCIL_BACK_FUNC = 0x8800,
	STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802,
	STENCIL_BACK_PASS_DEPTH_PASS = 0x8803,
	STENCIL_BACK_REF = 0x8CA3,
	STENCIL_BACK_VALUE_MASK = 0x8CA4,
	STENCIL_BACK_WRITEMASK = 0x8CA5,
	STENCIL_BITS = 0x0D57,
	STENCIL_BUFFER_BIT = 0x00000400,
	STENCIL_CLEAR_VALUE = 0x0B91,
	STENCIL_FAIL = 0x0B94,
	STENCIL_FUNC = 0x0B92,
	STENCIL_INDEX8 = 0x8D48,
	STENCIL_PASS_DEPTH_FAIL = 0x0B95,
	STENCIL_PASS_DEPTH_PASS = 0x0B96,
	STENCIL_REF = 0x0B97,
	STENCIL_TEST = 0x0B90,
	STENCIL_VALUE_MASK = 0x0B93,
	STENCIL_WRITEMASK = 0x0B98,
	STREAM_DRAW = 0x88E0,
	SUBPIXEL_BITS = 0x0D50,
	TEXTURE = 0x1702,
	TEXTURE0 = 0x84C0,
	TEXTURE1 = 0x84C1,
	TEXTURE10 = 0x84CA,
	TEXTURE11 = 0x84CB,
	TEXTURE12 = 0x84CC,
	TEXTURE13 = 0x84CD,
	TEXTURE14 = 0x84CE,
	TEXTURE15 = 0x84CF,
	TEXTURE16 = 0x84D0,
	TEXTURE17 = 0x84D1,
	TEXTURE18 = 0x84D2,
	TEXTURE19 = 0x84D3,
	TEXTURE2 = 0x84C2,
	TEXTURE20 = 0x84D4,
	TEXTURE21 = 0x84D5,
	TEXTURE22 = 0x84D6,
	TEXTURE23 = 0x84D7,
	TEXTURE24 = 0x84D8,
	TEXTURE25 = 0x84D9,
	TEXTURE26 = 0x84DA,
	TEXTURE27 = 0x84DB,
	TEXTURE28 = 0x84DC,
	TEXTURE29 = 0x84DD,
	TEXTURE3 = 0x84C3,
	TEXTURE30 = 0x84DE,
	TEXTURE31 = 0x84DF,
	TEXTURE4 = 0x84C4,
	TEXTURE5 = 0x84C5,
	TEXTURE6 = 0x84C6,
	TEXTURE7 = 0x84C7,
	TEXTURE8 = 0x84C8,
	TEXTURE9 = 0x84C9,
	TEXTURE_2D = 0x0DE1,
	TEXTURE_BINDING_2D = 0x8069,
	TEXTURE_BINDING_CUBE_MAP = 0x8514,
	TEXTURE_CUBE_MAP = 0x8513,
	TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516,
	TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518,
	TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A,
	TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515,
	TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517,
	TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519,
	TEXTURE_MAG_FILTER = 0x2800,
	TEXTURE_MIN_FILTER = 0x2801,
	TEXTURE_WRAP_S = 0x2802,
	TEXTURE_WRAP_T = 0x2803,
	TRIANGLES = 0x0004,
	TRIANGLE_FAN = 0x0006,
	TRIANGLE_STRIP = 0x0005,
	TRUE = 1,
	UNPACK_ALIGNMENT = 0x0CF5,
	UNSIGNED_BYTE = 0x1401,
	UNSIGNED_INT = 0x1405,
	UNSIGNED_SHORT = 0x1403,
	UNSIGNED_SHORT_4_4_4_4 = 0x8033,
	UNSIGNED_SHORT_5_5_5_1 = 0x8034,
	UNSIGNED_SHORT_5_6_5 = 0x8363,
	VALIDATE_STATUS = 0x8B83,
	VENDOR = 0x1F00,
	VERSION = 0x1F02,
	VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F,
	VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622,
	VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A,
	VERTEX_ATTRIB_ARRAY_POINTER = 0x8645,
	VERTEX_ATTRIB_ARRAY_SIZE = 0x8623,
	VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624,
	VERTEX_ATTRIB_ARRAY_TYPE = 0x8625,
	VERTEX_SHADER = 0x8B31,
	VIEWPORT = 0x0BA2,
	ZERO = 0,

	-- GLES 3.0 constants
	ACTIVE_UNIFORM_BLOCKS = 0x8A36,
	ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 0x8A35,
	ALREADY_SIGNALED = 0x911A,
	ANY_SAMPLES_PASSED = 0x8C2F,
	ANY_SAMPLES_PASSED_CONSERVATIVE = 0x8D6A,
	BLUE = 0x1905,
	BUFFER_ACCESS_FLAGS = 0x911F,
	BUFFER_MAPPED = 0x88BC,
	BUFFER_MAP_LENGTH = 0x9120,
	BUFFER_MAP_OFFSET = 0x9121,
	BUFFER_MAP_POINTER = 0x88BD,
	COLOR = 0x1800,
	COLOR_ATTACHMENT1 = 0x8CE1,
	COLOR_ATTACHMENT10 = 0x8CEA,
	COLOR_ATTACHMENT11 = 0x8CEB,
	COLOR_ATTACHMENT12 = 0x8CEC,
	COLOR_ATTACHMENT13 = 0x8CED,
	COLOR_ATTACHMENT14 = 0x8CEE,
	COLOR_ATTACHMENT15 = 0x8CEF,
	COLOR_ATTACHMENT16 = 0x8CF0,
	COLOR_ATTACHMENT17 = 0x8CF1,
	COLOR_ATTACHMENT18 = 0x8CF2,
	COLOR_ATTACHMENT19 = 0x8CF3,
	COLOR_ATTACHMENT2 = 0x8CE2,
	COLOR_ATTACHMENT20 = 0x8CF4,
	COLOR_ATTACHMENT21 = 0x8CF5,
	COLOR_ATTACHMENT22 = 0x8CF6,
	COLOR_ATTACHMENT23 = 0x8CF7,
	COLOR_ATTACHMENT24 = 0x8CF8,
	COLOR_ATTACHMENT25 = 0x8CF9,
	COLOR_ATTACHMENT26 = 0x8CFA,
	COLOR_ATTACHMENT27 = 0x8CFB,
	COLOR_ATTACHMENT28 = 0x8CFC,
	COLOR_ATTACHMENT29 = 0x8CFD,
	COLOR_ATTACHMENT3 = 0x8CE3,
	COLOR_ATTACHMENT30 = 0x8CFE,
	COLOR_ATTACHMENT31 = 0x8CFF,
	COLOR_ATTACHMENT4 = 0x8CE4,
	COLOR_ATTACHMENT5 = 0x8CE5,
	COLOR_ATTACHMENT6 = 0x8CE6,
	COLOR_ATTACHMENT7 = 0x8CE7,
	COLOR_ATTACHMENT8 = 0x8CE8,
	COLOR_ATTACHMENT9 = 0x8CE9,
	COMPARE_REF_TO_TEXTURE = 0x884E,
	COMPRESSED_R11_EAC = 0x9270,
	COMPRESSED_RG11_EAC = 0x9272,
	COMPRESSED_RGB8_ETC2 = 0x9274,
	COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9276,
	COMPRESSED_RGBA8_ETC2_EAC = 0x9278,
	COMPRESSED_SIGNED_R11_EAC = 0x9271,
	COMPRESSED_SIGNED_RG11_EAC = 0x9273,
	COMPRESSED_SRGB8_ALPHA8_ETC2_EAC = 0x9279,
	COMPRESSED_SRGB8_ETC2 = 0x9275,
	COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9277,
	CONDITION_SATISFIED = 0x911C,
	COPY_READ_BUFFER = 0x8F36,
	COPY_READ_BUFFER_BINDING = 0x8F36,
	COPY_WRITE_BUFFER = 0x8F37,
	COPY_WRITE_BUFFER_BINDING = 0x8F37,
	CURRENT_QUERY = 0x8865,
	DEPTH = 0x1801,
	DEPTH24_STENCIL8 = 0x88F0,
	DEPTH32F_STENCIL8 = 0x8CAD,
	DEPTH_COMPONENT24 = 0x81A6,
	DEPTH_COMPONENT32F = 0x8CAC,
	DEPTH_STENCIL = 0x84F9,
	DEPTH_STENCIL_ATTACHMENT = 0x821A,
	DRAW_BUFFER0 = 0x8825,
	DRAW_BUFFER1 = 0x8826,
	DRAW_BUFFER10 = 0x882F,
	DRAW_BUFFER11 = 0x8830,
	DRAW_BUFFER12 = 0x8831,
	DRAW_BUFFER13 = 0x8832,
	DRAW_BUFFER14 = 0x8833,
	DRAW_BUFFER15 = 0x8834,
	DRAW_BUFFER2 = 0x8827,
	DRAW_BUFFER3 = 0x8828,
	DRAW_BUFFER4 = 0x8829,
	DRAW_BUFFER5 = 0x882A,
	DRAW_BUFFER6 = 0x882B,
	DRAW_BUFFER7 = 0x882C,
	DRAW_BUFFER8 = 0x882D,
	DRAW_BUFFER9 = 0x882E,
	DRAW_FRAMEBUFFER = 0x8CA9,
	DRAW_FRAMEBUFFER_BINDING = 0x8CA6,
	DYNAMIC_COPY = 0x88EA,
	DYNAMIC_READ = 0x88E9,
	FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD,
	FLOAT_MAT2x3 = 0x8B65,
	FLOAT_MAT2x4 = 0x8B66,
	FLOAT_MAT3x2 = 0x8B67,
	FLOAT_MAT3x4 = 0x8B68,
	FLOAT_MAT4x2 = 0x8B69,
	FLOAT_MAT4x3 = 0x8B6A,
	FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B,
	FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215,
	FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214,
	FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210,
	FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211,
	FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216,
	FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213,
	FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212,
	FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217,
	FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4,
	FRAMEBUFFER_DEFAULT = 0x8218,
	FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56,
	FRAMEBUFFER_UNDEFINED = 0x8219,
	GREEN = 0x1904,
	HALF_FLOAT = 0x140B,
	INTERLEAVED_ATTRIBS = 0x8C8C,
	INT_2_10_10_10_REV = 0x8D9F,
	INT_SAMPLER_2D = 0x8DCA,
	INT_SAMPLER_2D_ARRAY = 0x8DCF,
	INT_SAMPLER_3D = 0x8DCB,
	INT_SAMPLER_CUBE = 0x8DCC,
	INVALID_INDEX = 0xFFFFFFFF,
	MAJOR_VERSION = 0x821B,
	MAP_FLUSH_EXPLICIT_BIT = 0x0010,
	MAP_INVALIDATE_BUFFER_BIT = 0x0008,
	MAP_INVALIDATE_RANGE_BIT = 0x0004,
	MAP_READ_BIT = 0x0001,
	MAP_UNSYNCHRONIZED_BIT = 0x0020,
	MAP_WRITE_BIT = 0x0002,
	MAX = 0x8008,
	MAX_3D_TEXTURE_SIZE = 0x8073,
	MAX_ARRAY_TEXTURE_LAYERS = 0x88FF,
	MAX_COLOR_ATTACHMENTS = 0x8CDF,
	MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33,
	MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E,
	MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31,
	MAX_DRAW_BUFFERS = 0x8824,
	MAX_ELEMENTS_INDICES = 0x80E9,
	MAX_ELEMENTS_VERTICES = 0x80E8,
	MAX_ELEMENT_INDEX = 0x8D6B,
	MAX_FRAGMENT_INPUT_COMPONENTS = 0x9125,
	MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D,
	MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49,
	MAX_PROGRAM_TEXEL_OFFSET = 0x8905,
	MAX_SAMPLES = 0x8D57,
	MAX_SERVER_WAIT_TIMEOUT = 0x9111,
	MAX_TEXTURE_LOD_BIAS = 0x84FD,
	MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A,
	MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B,
	MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80,
	MAX_UNIFORM_BLOCK_SIZE = 0x8A30,
	MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F,
	MAX_VARYING_COMPONENTS = 0x8B4B,
	MAX_VERTEX_OUTPUT_COMPONENTS = 0x9122,
	MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B,
	MAX_VERTEX_UNIFORM_COMPONENTS = 0x8B4A,
	MIN = 0x8007,
	MINOR_VERSION = 0x821C,
	MIN_PROGRAM_TEXEL_OFFSET = 0x8904,
	NUM_EXTENSIONS = 0x821D,
	NUM_PROGRAM_BINARY_FORMATS = 0x87FE,
	NUM_SAMPLE_COUNTS = 0x9380,
	OBJECT_TYPE = 0x9112,
	PACK_ROW_LENGTH = 0x0D02,
	PACK_SKIP_PIXELS = 0x0D04,
	PACK_SKIP_ROWS = 0x0D03,
	PIXEL_PACK_BUFFER = 0x88EB,
	PIXEL_PACK_BUFFER_BINDING = 0x88ED,
	PIXEL_UNPACK_BUFFER = 0x88EC,
	PIXEL_UNPACK_BUFFER_BINDING = 0x88EF,
	PRIMITIVE_RESTART_FIXED_INDEX = 0x8D69,
	PROGRAM_BINARY_FORMATS = 0x87FF,
	PROGRAM_BINARY_LENGTH = 0x8741,
	PROGRAM_BINARY_RETRIEVABLE_HINT = 0x8257,
	QUERY_RESULT = 0x8866,
	QUERY_RESULT_AVAILABLE = 0x8867,
	R11F_G11F_B10F = 0x8C3A,
	R16F = 0x822D,
	R16I = 0x8233,
	R16UI = 0x8234,
	R32F = 0x822E,
	R32I = 0x8235,
	R32UI = 0x8236,
	R8 = 0x8229,
	R8I = 0x8231,
	R8UI = 0x8232,
	R8_SNORM = 0x8F94,
	RASTERIZER_DISCARD = 0x8C89,
	READ_BUFFER = 0x0C02,
	READ_FRAMEBUFFER = 0x8CA8,
	READ_FRAMEBUFFER_BINDING = 0x8CAA,
	RED = 0x1903,
	RED_INTEGER = 0x8D94,
	RENDERBUFFER_SAMPLES = 0x8CAB,
	RG = 0x8227,
	RG16F = 0x822F,
	RG16I = 0x8239,
	RG16UI = 0x823A,
	RG32F = 0x8230,
	RG32I = 0x823B,
	RG32UI = 0x823C,
	RG8 = 0x822B,
	RG8I = 0x8237,
	RG8UI = 0x8238,
	RG8_SNORM = 0x8F95,
	RGB10_A2 = 0x8059,
	RGB10_A2UI = 0x906F,
	RGB16F = 0x881B,
	RGB16I = 0x8D89,
	RGB16UI = 0x8D77,
	RGB32F = 0x8815,
	RGB32I = 0x8D83,
	RGB32UI = 0x8D71,
	RGB8 = 0x8051,
	RGB8I = 0x8D8F,
	RGB8UI = 0x8D7D,
	RGB8_SNORM = 0x8F96,
	RGB9_E5 = 0x8C3D,
	RGBA16F = 0x881A,
	RGBA16I = 0x8D88,
	RGBA16UI = 0x8D76,
	RGBA32F = 0x8814,
	RGBA32I = 0x8D82,
	RGBA32UI = 0x8D70,
	RGBA8 = 0x8058,
	RGBA8I = 0x8D8E,
	RGBA8UI = 0x8D7C,
	RGBA8_SNORM = 0x8F97,
	RGBA_INTEGER = 0x8D99,
	RGB_INTEGER = 0x8D98,
	RG_INTEGER = 0x8228,
	SAMPLER_2D_ARRAY = 0x8DC1,
	SAMPLER_2D_ARRAY_SHADOW = 0x8DC4,
	SAMPLER_2D_SHADOW = 0x8B62,
	SAMPLER_3D = 0x8B5F,
	SAMPLER_BINDING = 0x8919,
	SAMPLER_CUBE_SHADOW = 0x8DC5,
	SEPARATE_ATTRIBS = 0x8C8D,
	SIGNALED = 0x9119,
	SIGNED_NORMALIZED = 0x8F9C,
	SRGB = 0x8C40,
	SRGB8 = 0x8C41,
	SRGB8_ALPHA8 = 0x8C43,
	STATIC_COPY = 0x88E6,
	STATIC_READ = 0x88E5,
	STENCIL = 0x1802,
	STREAM_COPY = 0x88E2,
	STREAM_READ = 0x88E1,
	SYNC_CONDITION = 0x9113,
	SYNC_FENCE = 0x9116,
	SYNC_FLAGS = 0x9115,
	SYNC_FLUSH_COMMANDS_BIT = 0x00000001,
	SYNC_GPU_COMMANDS_COMPLETE = 0x9117,
	SYNC_STATUS = 0x9114,
	TEXTURE_2D_ARRAY = 0x8C1A,
	TEXTURE_3D = 0x806F,
	TEXTURE_BASE_LEVEL = 0x813C,
	TEXTURE_BINDING_2D_ARRAY = 0x8C1D,
	TEXTURE_BINDING_3D = 0x806A,
	TEXTURE_COMPARE_FUNC = 0x884D,
	TEXTURE_COMPARE_MODE = 0x884C,
	TEXTURE_IMMUTABLE_FORMAT = 0x912F,
	TEXTURE_IMMUTABLE_LEVELS = 0x82DF,
	TEXTURE_MAX_LEVEL = 0x813D,
	TEXTURE_MAX_LOD = 0x813B,
	TEXTURE_MIN_LOD = 0x813A,
	TEXTURE_SWIZZLE_A = 0x8E45,
	TEXTURE_SWIZZLE_B = 0x8E44,
	TEXTURE_SWIZZLE_G = 0x8E43,
	TEXTURE_SWIZZLE_R = 0x8E42,
	TEXTURE_WRAP_R = 0x8072,
	TIMEOUT_EXPIRED = 0x911B,
	TIMEOUT_IGNORED = 0xFFFFFFFFFFFFFFFF,
	TRANSFORM_FEEDBACK = 0x8E22,
	TRANSFORM_FEEDBACK_ACTIVE = 0x8E24,
	TRANSFORM_FEEDBACK_BINDING = 0x8E25,
	TRANSFORM_FEEDBACK_BUFFER = 0x8C8E,
	TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F,
	TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F,
	TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85,
	TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84,
	TRANSFORM_FEEDBACK_PAUSED = 0x8E23,
	TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88,
	TRANSFORM_FEEDBACK_VARYINGS = 0x8C83,
	TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 0x8C76,
	UNIFORM_ARRAY_STRIDE = 0x8A3C,
	UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42,
	UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43,
	UNIFORM_BLOCK_BINDING = 0x8A3F,
	UNIFORM_BLOCK_DATA_SIZE = 0x8A40,
	UNIFORM_BLOCK_INDEX = 0x8A3A,
	UNIFORM_BLOCK_NAME_LENGTH = 0x8A41,
	UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46,
	UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44,
	UNIFORM_BUFFER = 0x8A11,
	UNIFORM_BUFFER_BINDING = 0x8A28,
	UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34,
	UNIFORM_BUFFER_SIZE = 0x8A2A,
	UNIFORM_BUFFER_START = 0x8A29,
	UNIFORM_IS_ROW_MAJOR = 0x8A3E,
	UNIFORM_MATRIX_STRIDE = 0x8A3D,
	UNIFORM_NAME_LENGTH = 0x8A39,
	UNIFORM_OFFSET = 0x8A3B,
	UNIFORM_SIZE = 0x8A38,
	UNIFORM_TYPE = 0x8A37,
	UNPACK_IMAGE_HEIGHT = 0x806E,
	UNPACK_ROW_LENGTH = 0x0CF2,
	UNPACK_SKIP_IMAGES = 0x806D,
	UNPACK_SKIP_PIXELS = 0x0CF4,
	UNPACK_SKIP_ROWS = 0x0CF3,
	UNSIGNALED = 0x9118,
	UNSIGNED_INT_10F_11F_11F_REV = 0x8C3B,
	UNSIGNED_INT_24_8 = 0x84FA,
	UNSIGNED_INT_2_10_10_10_REV = 0x8368,
	UNSIGNED_INT_5_9_9_9_REV = 0x8C3E,
	UNSIGNED_INT_SAMPLER_2D = 0x8DD2,
	UNSIGNED_INT_SAMPLER_2D_ARRAY = 0x8DD7,
	UNSIGNED_INT_SAMPLER_3D = 0x8DD3,
	UNSIGNED_INT_SAMPLER_CUBE = 0x8DD4,
	UNSIGNED_INT_VEC2 = 0x8DC6,
	UNSIGNED_INT_VEC3 = 0x8DC7,
	UNSIGNED_INT_VEC4 = 0x8DC8,
	UNSIGNED_NORMALIZED = 0x8C17,
	VERTEX_ARRAY_BINDING = 0x85B5,
	VERTEX_ATTRIB_ARRAY_DIVISOR = 0x88FE,
	VERTEX_ATTRIB_ARRAY_INTEGER = 0x88FD,
	WAIT_FAILED = 0x911D,

	-- GLES 2.0 function refs
	activeTexture = libgles3.glActiveTexture,
	attachShader = libgles3.glAttachShader,
	bindAttribLocation = libgles3.glBindAttribLocation,
	bindBuffer = libgles3.glBindBuffer,
	bindFramebuffer = libgles3.glBindFramebuffer,
	bindRenderbuffer = libgles3.glBindRenderbuffer,
	bindTexture = libgles3.glBindTexture,
	blendColor = libgles3.glBlendColor,
	blendEquation = libgles3.glBlendEquation,
	blendEquationSeparate = libgles3.glBlendEquationSeparate,
	blendFunc = libgles3.glBlendFunc,
	blendFuncSeparate = libgles3.glBlendFuncSeparate,
	bufferData = libgles3.glBufferData,
	bufferSubData = libgles3.glBufferSubData,
	checkFramebufferStatus = libgles3.glCheckFramebufferStatus,
	clear = libgles3.glClear,
	clearColor = libgles3.glClearColor,
	clearDepthf = libgles3.glClearDepthf,
	clearStencil = libgles3.glClearStencil,
	colorMask = libgles3.glColorMask,
	compileShader = libgles3.glCompileShader,
	compressedTexImage2D = libgles3.glCompressedTexImage2D,
	compressedTexSubImage2D = libgles3.glCompressedTexSubImage2D,
	copyTexImage2D = libgles3.glCopyTexImage2D,
	copyTexSubImage2D = libgles3.glCopyTexSubImage2D,
	createProgram = libgles3.glCreateProgram,
	createShader = libgles3.glCreateShader,
	cullFace = libgles3.glCullFace,
	deleteBuffers = libgles3.glDeleteBuffers,
	deleteFramebuffers = libgles3.glDeleteFramebuffers,
	deleteProgram = libgles3.glDeleteProgram,
	deleteRenderbuffers = libgles3.glDeleteRenderbuffers,
	deleteShader = libgles3.glDeleteShader,
	deleteTextures = libgles3.glDeleteTextures,
	depthFunc = libgles3.glDepthFunc,
	depthMask = libgles3.glDepthMask,
	depthRangef = libgles3.glDepthRangef,
	detachShader = libgles3.glDetachShader,
	disable = libgles3.glDisable,
	disableVertexAttribArray = libgles3.glDisableVertexAttribArray,
	drawArrays = libgles3.glDrawArrays,
	drawElements = libgles3.glDrawElements,
	enable = libgles3.glEnable,
	enableVertexAttribArray = libgles3.glEnableVertexAttribArray,
	finish = libgles3.glFinish,
	flush = libgles3.glFlush,
	framebufferRenderbuffer = libgles3.glFramebufferRenderbuffer,
	framebufferTexture2D = libgles3.glFramebufferTexture2D,
	frontFace = libgles3.glFrontFace,
	genBuffers = libgles3.glGenBuffers,
	generateMipmap = libgles3.glGenerateMipmap,
	genFramebuffers = libgles3.glGenFramebuffers,
	genRenderbuffers = libgles3.glGenRenderbuffers,
	genTextures = libgles3.glGenTextures,
	getActiveAttrib = libgles3.glGetActiveAttrib,
	getActiveUniform = libgles3.glGetActiveUniform,
	getAttachedShaders = libgles3.glGetAttachedShaders,
	getAttribLocation = libgles3.glGetAttribLocation,
	getBooleanv = libgles3.glGetBooleanv,
	getBufferParameteriv = libgles3.glGetBufferParameteriv,
	getError = libgles3.glGetError,
	getFloatv = libgles3.glGetFloatv,
	getFramebufferAttachmentParameteriv = libgles3.glGetFramebufferAttachmentParameteriv,
	getIntegerv = libgles3.glGetIntegerv,
	getProgramiv = libgles3.glGetProgramiv,
	getProgramInfoLog = libgles3.glGetProgramInfoLog,
	getRenderbufferParameteriv = libgles3.glGetRenderbufferParameteriv,
	getShaderiv = libgles3.glGetShaderiv,
	getShaderInfoLog = libgles3.glGetShaderInfoLog,
	getShaderPrecisionFormat = libgles3.glGetShaderPrecisionFormat,
	getShaderSource = libgles3.glGetShaderSource,
	getString = libgles3.glGetString,
	getTexParameterfv = libgles3.glGetTexParameterfv,
	getTexParameteriv = libgles3.glGetTexParameteriv,
	getUniformfv = libgles3.glGetUniformfv,
	getUniformiv = libgles3.glGetUniformiv,
	getUniformLocation = libgles3.glGetUniformLocation,
	getVertexAttribfv = libgles3.glGetVertexAttribfv,
	getVertexAttribiv = libgles3.glGetVertexAttribiv,
	getVertexAttribPointerv = libgles3.glGetVertexAttribPointerv,
	hint = libgles3.glHint,
	isBuffer = libgles3.glIsBuffer,
	isEnabled = libgles3.glIsEnabled,
	isFramebuffer = libgles3.glIsFramebuffer,
	isProgram = libgles3.glIsProgram,
	isRenderbuffer = libgles3.glIsRenderbuffer,
	isShader = libgles3.glIsShader,
	isTexture = libgles3.glIsTexture,
	lineWidth = libgles3.glLineWidth,
	linkProgram = libgles3.glLinkProgram,
	pixelStorei = libgles3.glPixelStorei,
	polygonOffset = libgles3.glPolygonOffset,
	readPixels = libgles3.glReadPixels,
	releaseShaderCompiler = libgles3.glReleaseShaderCompiler,
	renderbufferStorage = libgles3.glRenderbufferStorage,
	sampleCoverage = libgles3.glSampleCoverage,
	scissor = libgles3.glScissor,
	shaderBinary = libgles3.glShaderBinary,
	shaderSource = libgles3.glShaderSource,
	stencilFunc = libgles3.glStencilFunc,
	stencilFuncSeparate = libgles3.glStencilFuncSeparate,
	stencilMask = libgles3.glStencilMask,
	stencilMaskSeparate = libgles3.glStencilMaskSeparate,
	stencilOp = libgles3.glStencilOp,
	stencilOpSeparate = libgles3.glStencilOpSeparate,
	texImage2D = libgles3.glTexImage2D,
	texParameterf = libgles3.glTexParameterf,
	texParameterfv = libgles3.glTexParameterfv,
	texParameteri = libgles3.glTexParameteri,
	texParameteriv = libgles3.glTexParameteriv,
	texSubImage2D = libgles3.glTexSubImage2D,
	uniform1f = libgles3.glUniform1f,
	uniform1fv = libgles3.glUniform1fv,
	uniform1i = libgles3.glUniform1i,
	uniform1iv = libgles3.glUniform1iv,
	uniform2f = libgles3.glUniform2f,
	uniform2fv = libgles3.glUniform2fv,
	uniform2i = libgles3.glUniform2i,
	uniform2iv = libgles3.glUniform2iv,
	uniform3f = libgles3.glUniform3f,
	uniform3fv = libgles3.glUniform3fv,
	uniform3i = libgles3.glUniform3i,
	uniform3iv = libgles3.glUniform3iv,
	uniform4f = libgles3.glUniform4f,
	uniform4fv = libgles3.glUniform4fv,
	uniform4i = libgles3.glUniform4i,
	uniform4iv = libgles3.glUniform4iv,
	uniformMatrix2fv = libgles3.glUniformMatrix2fv,
	uniformMatrix3fv = libgles3.glUniformMatrix3fv,
	uniformMatrix4fv = libgles3.glUniformMatrix4fv,
	useProgram = libgles3.glUseProgram,
	validateProgram = libgles3.glValidateProgram,
	vertexAttrib1f = libgles3.glVertexAttrib1f,
	vertexAttrib1fv = libgles3.glVertexAttrib1fv,
	vertexAttrib2f = libgles3.glVertexAttrib2f,
	vertexAttrib2fv = libgles3.glVertexAttrib2fv,
	vertexAttrib3f = libgles3.glVertexAttrib3f,
	vertexAttrib3fv = libgles3.glVertexAttrib3fv,
	vertexAttrib4f = libgles3.glVertexAttrib4f,
	vertexAttrib4fv = libgles3.glVertexAttrib4fv,
	vertexAttribPointer = libgles3.glVertexAttribPointer,
	viewport = libgles3.glViewport,

	-- GLES 3.0 function refs
	beginQuery = libgles3.glBeginQuery,
	beginTransformFeedback = libgles3.glBeginTransformFeedback,
	bindBufferBase = libgles3.glBindBufferBase,
	bindBufferRange = libgles3.glBindBufferRange,
	bindSampler = libgles3.glBindSampler,
	bindTransformFeedback = libgles3.glBindTransformFeedback,
	bindVertexArray = libgles3.glBindVertexArray,
	blitFramebuffer = libgles3.glBlitFramebuffer,
	clearBufferfi = libgles3.glClearBufferfi,
	clearBufferfv = libgles3.glClearBufferfv,
	clearBufferiv = libgles3.glClearBufferiv,
	clearBufferuiv = libgles3.glClearBufferuiv,
	clientWaitSync = libgles3.glClientWaitSync,
	compressedTexImage3D = libgles3.glCompressedTexImage3D,
	compressedTexSubImage3D = libgles3.glCompressedTexSubImage3D,
	copyBufferSubData = libgles3.glCopyBufferSubData,
	copyTexSubImage3D = libgles3.glCopyTexSubImage3D,
	deleteQueries = libgles3.glDeleteQueries,
	deleteSamplers = libgles3.glDeleteSamplers,
	deleteSync = libgles3.glDeleteSync,
	deleteTransformFeedbacks = libgles3.glDeleteTransformFeedbacks,
	deleteVertexArrays = libgles3.glDeleteVertexArrays,
	drawArraysInstanced = libgles3.glDrawArraysInstanced,
	drawBuffers = libgles3.glDrawBuffers,
	drawElementsInstanced = libgles3.glDrawElementsInstanced,
	drawRangeElements = libgles3.glDrawRangeElements,
	endQuery = libgles3.glEndQuery,
	endTransformFeedback = libgles3.glEndTransformFeedback,
	fenceSync = libgles3.glFenceSync,
	flushMappedBufferRange = libgles3.glFlushMappedBufferRange,
	framebufferTextureLayer = libgles3.glFramebufferTextureLayer,
	genQueries = libgles3.glGenQueries,
	genSamplers = libgles3.glGenSamplers,
	genTransformFeedbacks = libgles3.glGenTransformFeedbacks,
	genVertexArrays = libgles3.glGenVertexArrays,
	getActiveUniformBlockName = libgles3.glGetActiveUniformBlockName,
	getActiveUniformBlockiv = libgles3.glGetActiveUniformBlockiv,
	getActiveUniformsiv = libgles3.glGetActiveUniformsiv,
	getBufferParameteri64v = libgles3.glGetBufferParameteri64v,
	getBufferPointerv = libgles3.glGetBufferPointerv,
	getFragDataLocation = libgles3.glGetFragDataLocation,
	getInteger64i_v = libgles3.glGetInteger64i_v,
	getInteger64v = libgles3.glGetInteger64v,
	getIntegeri_v = libgles3.glGetIntegeri_v,
	getInternalformativ = libgles3.glGetInternalformativ,
	getProgramBinary = libgles3.glGetProgramBinary,
	getQueryObjectuiv = libgles3.glGetQueryObjectuiv,
	getQueryiv = libgles3.glGetQueryiv,
	getSamplerParameterfv = libgles3.glGetSamplerParameterfv,
	getSamplerParameteriv = libgles3.glGetSamplerParameteriv,
	getStringi = libgles3.glGetStringi,
	getSynciv = libgles3.glGetSynciv,
	getTransformFeedbackVarying = libgles3.glGetTransformFeedbackVarying,
	getUniformBlockIndex = libgles3.glGetUniformBlockIndex,
	getUniformIndices = libgles3.glGetUniformIndices,
	getUniformuiv = libgles3.glGetUniformuiv,
	getVertexAttribIiv = libgles3.glGetVertexAttribIiv,
	getVertexAttribIuiv = libgles3.glGetVertexAttribIuiv,
	invalidateFramebuffer = libgles3.glInvalidateFramebuffer,
	invalidateSubFramebuffer = libgles3.glInvalidateSubFramebuffer,
	isQuery = libgles3.glIsQuery,
	isSampler = libgles3.glIsSampler,
	isSync = libgles3.glIsSync,
	isTransformFeedback = libgles3.glIsTransformFeedback,
	isVertexArray = libgles3.glIsVertexArray,
	mapBufferRange = libgles3.glMapBufferRange,
	pauseTransformFeedback = libgles3.glPauseTransformFeedback,
	programBinary = libgles3.glProgramBinary,
	programParameteri = libgles3.glProgramParameteri,
	readBuffer = libgles3.glReadBuffer,
	renderbufferStorageMultisample = libgles3.glRenderbufferStorageMultisample,
	resumeTransformFeedback = libgles3.glResumeTransformFeedback,
	samplerParameterf = libgles3.glSamplerParameterf,
	samplerParameterfv = libgles3.glSamplerParameterfv,
	samplerParameteri = libgles3.glSamplerParameteri,
	samplerParameteriv = libgles3.glSamplerParameteriv,
	texImage3D = libgles3.glTexImage3D,
	texStorage2D = libgles3.glTexStorage2D,
	texStorage3D = libgles3.glTexStorage3D,
	texSubImage3D = libgles3.glTexSubImage3D,
	transformFeedbackVaryings = libgles3.glTransformFeedbackVaryings,
	uniform1ui = libgles3.glUniform1ui,
	uniform1uiv = libgles3.glUniform1uiv,
	uniform2ui = libgles3.glUniform2ui,
	uniform2uiv = libgles3.glUniform2uiv,
	uniform3ui = libgles3.glUniform3ui,
	uniform3uiv = libgles3.glUniform3uiv,
	uniform4ui = libgles3.glUniform4ui,
	uniform4uiv = libgles3.glUniform4uiv,
	uniformBlockBinding = libgles3.glUniformBlockBinding,
	uniformMatrix2x3fv = libgles3.glUniformMatrix2x3fv,
	uniformMatrix2x4fv = libgles3.glUniformMatrix2x4fv,
	uniformMatrix3x2fv = libgles3.glUniformMatrix3x2fv,
	uniformMatrix3x4fv = libgles3.glUniformMatrix3x4fv,
	uniformMatrix4x2fv = libgles3.glUniformMatrix4x2fv,
	uniformMatrix4x3fv = libgles3.glUniformMatrix4x3fv,
	unmapBuffer = libgles3.glUnmapBuffer,
	vertexAttribDivisor = libgles3.glVertexAttribDivisor,
	vertexAttribI4i = libgles3.glVertexAttribI4i,
	vertexAttribI4iv = libgles3.glVertexAttribI4iv,
	vertexAttribI4ui = libgles3.glVertexAttribI4ui,
	vertexAttribI4uiv = libgles3.glVertexAttribI4uiv,
	vertexAttribIPointer = libgles3.glVertexAttribIPointer,
	waitSync = libgles3.glWaitSync,
}

return gl
