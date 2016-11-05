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
	GL_ACTIVE_ATTRIBUTES = 0x8B89,
	GL_ACTIVE_ATTRIBUTE_MAX_LENGTH = 0x8B8A,
	GL_ACTIVE_TEXTURE = 0x84E0,
	GL_ACTIVE_UNIFORMS = 0x8B86,
	GL_ACTIVE_UNIFORM_MAX_LENGTH = 0x8B87,
	GL_ALIASED_LINE_WIDTH_RANGE = 0x846E,
	GL_ALIASED_POINT_SIZE_RANGE = 0x846D,
	GL_ALPHA = 0x1906,
	GL_ALPHA_BITS = 0x0D55,
	GL_ALWAYS = 0x0207,
	GL_ARRAY_BUFFER = 0x8892,
	GL_ARRAY_BUFFER_BINDING = 0x8894,
	GL_ATTACHED_SHADERS = 0x8B85,
	GL_BACK = 0x0405,
	GL_BLEND = 0x0BE2,
	GL_BLEND_COLOR = 0x8005,
	GL_BLEND_DST_ALPHA = 0x80CA,
	GL_BLEND_DST_RGB = 0x80C8,
	GL_BLEND_EQUATION = 0x8009,
	GL_BLEND_EQUATION_ALPHA = 0x883D,
	GL_BLEND_EQUATION_RGB = 0x8009,
	GL_BLEND_SRC_ALPHA = 0x80CB,
	GL_BLEND_SRC_RGB = 0x80C9,
	GL_BLUE_BITS = 0x0D54,
	GL_BOOL = 0x8B56,
	GL_BOOL_VEC2 = 0x8B57,
	GL_BOOL_VEC3 = 0x8B58,
	GL_BOOL_VEC4 = 0x8B59,
	GL_BUFFER_SIZE = 0x8764,
	GL_BUFFER_USAGE = 0x8765,
	GL_BYTE = 0x1400,
	GL_CCW = 0x0901,
	GL_CLAMP_TO_EDGE = 0x812F,
	GL_COLOR_ATTACHMENT0 = 0x8CE0,
	GL_COLOR_BUFFER_BIT = 0x00004000,
	GL_COLOR_CLEAR_VALUE = 0x0C22,
	GL_COLOR_WRITEMASK = 0x0C23,
	GL_COMPILE_STATUS = 0x8B81,
	GL_COMPRESSED_TEXTURE_FORMATS = 0x86A3,
	GL_CONSTANT_ALPHA = 0x8003,
	GL_CONSTANT_COLOR = 0x8001,
	GL_CULL_FACE = 0x0B44,
	GL_CULL_FACE_MODE = 0x0B45,
	GL_CURRENT_PROGRAM = 0x8B8D,
	GL_CURRENT_VERTEX_ATTRIB = 0x8626,
	GL_CW = 0x0900,
	GL_DECR = 0x1E03,
	GL_DECR_WRAP = 0x8508,
	GL_DELETE_STATUS = 0x8B80,
	GL_DEPTH_ATTACHMENT = 0x8D00,
	GL_DEPTH_BITS = 0x0D56,
	GL_DEPTH_BUFFER_BIT = 0x00000100,
	GL_DEPTH_CLEAR_VALUE = 0x0B73,
	GL_DEPTH_COMPONENT = 0x1902,
	GL_DEPTH_COMPONENT16 = 0x81A5,
	GL_DEPTH_FUNC = 0x0B74,
	GL_DEPTH_RANGE = 0x0B70,
	GL_DEPTH_TEST = 0x0B71,
	GL_DEPTH_WRITEMASK = 0x0B72,
	GL_DITHER = 0x0BD0,
	GL_DONT_CARE = 0x1100,
	GL_DST_ALPHA = 0x0304,
	GL_DST_COLOR = 0x0306,
	GL_DYNAMIC_DRAW = 0x88E8,
	GL_ELEMENT_ARRAY_BUFFER = 0x8893,
	GL_ELEMENT_ARRAY_BUFFER_BINDING = 0x8895,
	GL_EQUAL = 0x0202,
	GL_EXTENSIONS = 0x1F03,
	GL_FALSE = 0,
	GL_FASTEST = 0x1101,
	GL_FIXED = 0x140C,
	GL_FLOAT = 0x1406,
	GL_FLOAT_MAT2 = 0x8B5A,
	GL_FLOAT_MAT3 = 0x8B5B,
	GL_FLOAT_MAT4 = 0x8B5C,
	GL_FLOAT_VEC2 = 0x8B50,
	GL_FLOAT_VEC3 = 0x8B51,
	GL_FLOAT_VEC4 = 0x8B52,
	GL_FRAGMENT_SHADER = 0x8B30,
	GL_FRAMEBUFFER = 0x8D40,
	GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1,
	GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0,
	GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3,
	GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2,
	GL_FRAMEBUFFER_BINDING = 0x8CA6,
	GL_FRAMEBUFFER_COMPLETE = 0x8CD5,
	GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6,
	GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS = 0x8CD9,
	GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7,
	GL_FRAMEBUFFER_UNSUPPORTED = 0x8CDD,
	GL_FRONT = 0x0404,
	GL_FRONT_AND_BACK = 0x0408,
	GL_FRONT_FACE = 0x0B46,
	GL_FUNC_ADD = 0x8006,
	GL_FUNC_REVERSE_SUBTRACT = 0x800B,
	GL_FUNC_SUBTRACT = 0x800A,
	GL_GENERATE_MIPMAP_HINT = 0x8192,
	GL_GEQUAL = 0x0206,
	GL_GREATER = 0x0204,
	GL_GREEN_BITS = 0x0D53,
	GL_HIGH_FLOAT = 0x8DF2,
	GL_HIGH_INT = 0x8DF5,
	GL_IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B,
	GL_IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A,
	GL_INCR = 0x1E02,
	GL_INCR_WRAP = 0x8507,
	GL_INFO_LOG_LENGTH = 0x8B84,
	GL_INT = 0x1404,
	GL_INT_VEC2 = 0x8B53,
	GL_INT_VEC3 = 0x8B54,
	GL_INT_VEC4 = 0x8B55,
	GL_INVALID_ENUM = 0x0500,
	GL_INVALID_FRAMEBUFFER_OPERATION = 0x0506,
	GL_INVALID_OPERATION = 0x0502,
	GL_INVALID_VALUE = 0x0501,
	GL_INVERT = 0x150A,
	GL_KEEP = 0x1E00,
	GL_LEQUAL = 0x0203,
	GL_LESS = 0x0201,
	GL_LINEAR = 0x2601,
	GL_LINEAR_MIPMAP_LINEAR = 0x2703,
	GL_LINEAR_MIPMAP_NEAREST = 0x2701,
	GL_LINES = 0x0001,
	GL_LINE_LOOP = 0x0002,
	GL_LINE_STRIP = 0x0003,
	GL_LINE_WIDTH = 0x0B21,
	GL_LINK_STATUS = 0x8B82,
	GL_LOW_FLOAT = 0x8DF0,
	GL_LOW_INT = 0x8DF3,
	GL_LUMINANCE = 0x1909,
	GL_LUMINANCE_ALPHA = 0x190A,
	GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D,
	GL_MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C,
	GL_MAX_FRAGMENT_UNIFORM_VECTORS = 0x8DFD,
	GL_MAX_RENDERBUFFER_SIZE = 0x84E8,
	GL_MAX_TEXTURE_IMAGE_UNITS = 0x8872,
	GL_MAX_TEXTURE_SIZE = 0x0D33,
	GL_MAX_VARYING_VECTORS = 0x8DFC,
	GL_MAX_VERTEX_ATTRIBS = 0x8869,
	GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C,
	GL_MAX_VERTEX_UNIFORM_VECTORS = 0x8DFB,
	GL_MAX_VIEWPORT_DIMS = 0x0D3A,
	GL_MEDIUM_FLOAT = 0x8DF1,
	GL_MEDIUM_INT = 0x8DF4,
	GL_MIRRORED_REPEAT = 0x8370,
	GL_NEAREST = 0x2600,
	GL_NEAREST_MIPMAP_LINEAR = 0x2702,
	GL_NEAREST_MIPMAP_NEAREST = 0x2700,
	GL_NEVER = 0x0200,
	GL_NICEST = 0x1102,
	GL_NONE = 0,
	GL_NOTEQUAL = 0x0205,
	GL_NO_ERROR = 0,
	GL_NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2,
	GL_NUM_SHADER_BINARY_FORMATS = 0x8DF9,
	GL_ONE = 1,
	GL_ONE_MINUS_CONSTANT_ALPHA = 0x8004,
	GL_ONE_MINUS_CONSTANT_COLOR = 0x8002,
	GL_ONE_MINUS_DST_ALPHA = 0x0305,
	GL_ONE_MINUS_DST_COLOR = 0x0307,
	GL_ONE_MINUS_SRC_ALPHA = 0x0303,
	GL_ONE_MINUS_SRC_COLOR = 0x0301,
	GL_OUT_OF_MEMORY = 0x0505,
	GL_PACK_ALIGNMENT = 0x0D05,
	GL_POINTS = 0x0000,
	GL_POLYGON_OFFSET_FACTOR = 0x8038,
	GL_POLYGON_OFFSET_FILL = 0x8037,
	GL_POLYGON_OFFSET_UNITS = 0x2A00,
	GL_RED_BITS = 0x0D52,
	GL_RENDERBUFFER = 0x8D41,
	GL_RENDERBUFFER_ALPHA_SIZE = 0x8D53,
	GL_RENDERBUFFER_BINDING = 0x8CA7,
	GL_RENDERBUFFER_BLUE_SIZE = 0x8D52,
	GL_RENDERBUFFER_DEPTH_SIZE = 0x8D54,
	GL_RENDERBUFFER_GREEN_SIZE = 0x8D51,
	GL_RENDERBUFFER_HEIGHT = 0x8D43,
	GL_RENDERBUFFER_INTERNAL_FORMAT = 0x8D44,
	GL_RENDERBUFFER_RED_SIZE = 0x8D50,
	GL_RENDERBUFFER_STENCIL_SIZE = 0x8D55,
	GL_RENDERBUFFER_WIDTH = 0x8D42,
	GL_RENDERER = 0x1F01,
	GL_REPEAT = 0x2901,
	GL_REPLACE = 0x1E01,
	GL_RGB = 0x1907,
	GL_RGB565 = 0x8D62,
	GL_RGB5_A1 = 0x8057,
	GL_RGBA = 0x1908,
	GL_RGBA4 = 0x8056,
	GL_SAMPLER_2D = 0x8B5E,
	GL_SAMPLER_CUBE = 0x8B60,
	GL_SAMPLES = 0x80A9,
	GL_SAMPLE_ALPHA_TO_COVERAGE = 0x809E,
	GL_SAMPLE_BUFFERS = 0x80A8,
	GL_SAMPLE_COVERAGE = 0x80A0,
	GL_SAMPLE_COVERAGE_INVERT = 0x80AB,
	GL_SAMPLE_COVERAGE_VALUE = 0x80AA,
	GL_SCISSOR_BOX = 0x0C10,
	GL_SCISSOR_TEST = 0x0C11,
	GL_SHADER_BINARY_FORMATS = 0x8DF8,
	GL_SHADER_COMPILER = 0x8DFA,
	GL_SHADER_SOURCE_LENGTH = 0x8B88,
	GL_SHADER_TYPE = 0x8B4F,
	GL_SHADING_LANGUAGE_VERSION = 0x8B8C,
	GL_SHORT = 0x1402,
	GL_SRC_ALPHA = 0x0302,
	GL_SRC_ALPHA_SATURATE = 0x0308,
	GL_SRC_COLOR = 0x0300,
	GL_STATIC_DRAW = 0x88E4,
	GL_STENCIL_ATTACHMENT = 0x8D20,
	GL_STENCIL_BACK_FAIL = 0x8801,
	GL_STENCIL_BACK_FUNC = 0x8800,
	GL_STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802,
	GL_STENCIL_BACK_PASS_DEPTH_PASS = 0x8803,
	GL_STENCIL_BACK_REF = 0x8CA3,
	GL_STENCIL_BACK_VALUE_MASK = 0x8CA4,
	GL_STENCIL_BACK_WRITEMASK = 0x8CA5,
	GL_STENCIL_BITS = 0x0D57,
	GL_STENCIL_BUFFER_BIT = 0x00000400,
	GL_STENCIL_CLEAR_VALUE = 0x0B91,
	GL_STENCIL_FAIL = 0x0B94,
	GL_STENCIL_FUNC = 0x0B92,
	GL_STENCIL_INDEX8 = 0x8D48,
	GL_STENCIL_PASS_DEPTH_FAIL = 0x0B95,
	GL_STENCIL_PASS_DEPTH_PASS = 0x0B96,
	GL_STENCIL_REF = 0x0B97,
	GL_STENCIL_TEST = 0x0B90,
	GL_STENCIL_VALUE_MASK = 0x0B93,
	GL_STENCIL_WRITEMASK = 0x0B98,
	GL_STREAM_DRAW = 0x88E0,
	GL_SUBPIXEL_BITS = 0x0D50,
	GL_TEXTURE = 0x1702,
	GL_TEXTURE0 = 0x84C0,
	GL_TEXTURE1 = 0x84C1,
	GL_TEXTURE10 = 0x84CA,
	GL_TEXTURE11 = 0x84CB,
	GL_TEXTURE12 = 0x84CC,
	GL_TEXTURE13 = 0x84CD,
	GL_TEXTURE14 = 0x84CE,
	GL_TEXTURE15 = 0x84CF,
	GL_TEXTURE16 = 0x84D0,
	GL_TEXTURE17 = 0x84D1,
	GL_TEXTURE18 = 0x84D2,
	GL_TEXTURE19 = 0x84D3,
	GL_TEXTURE2 = 0x84C2,
	GL_TEXTURE20 = 0x84D4,
	GL_TEXTURE21 = 0x84D5,
	GL_TEXTURE22 = 0x84D6,
	GL_TEXTURE23 = 0x84D7,
	GL_TEXTURE24 = 0x84D8,
	GL_TEXTURE25 = 0x84D9,
	GL_TEXTURE26 = 0x84DA,
	GL_TEXTURE27 = 0x84DB,
	GL_TEXTURE28 = 0x84DC,
	GL_TEXTURE29 = 0x84DD,
	GL_TEXTURE3 = 0x84C3,
	GL_TEXTURE30 = 0x84DE,
	GL_TEXTURE31 = 0x84DF,
	GL_TEXTURE4 = 0x84C4,
	GL_TEXTURE5 = 0x84C5,
	GL_TEXTURE6 = 0x84C6,
	GL_TEXTURE7 = 0x84C7,
	GL_TEXTURE8 = 0x84C8,
	GL_TEXTURE9 = 0x84C9,
	GL_TEXTURE_2D = 0x0DE1,
	GL_TEXTURE_BINDING_2D = 0x8069,
	GL_TEXTURE_BINDING_CUBE_MAP = 0x8514,
	GL_TEXTURE_CUBE_MAP = 0x8513,
	GL_TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516,
	GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518,
	GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A,
	GL_TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515,
	GL_TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517,
	GL_TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519,
	GL_TEXTURE_MAG_FILTER = 0x2800,
	GL_TEXTURE_MIN_FILTER = 0x2801,
	GL_TEXTURE_WRAP_S = 0x2802,
	GL_TEXTURE_WRAP_T = 0x2803,
	GL_TRIANGLES = 0x0004,
	GL_TRIANGLE_FAN = 0x0006,
	GL_TRIANGLE_STRIP = 0x0005,
	GL_TRUE = 1,
	GL_UNPACK_ALIGNMENT = 0x0CF5,
	GL_UNSIGNED_BYTE = 0x1401,
	GL_UNSIGNED_INT = 0x1405,
	GL_UNSIGNED_SHORT = 0x1403,
	GL_UNSIGNED_SHORT_4_4_4_4 = 0x8033,
	GL_UNSIGNED_SHORT_5_5_5_1 = 0x8034,
	GL_UNSIGNED_SHORT_5_6_5 = 0x8363,
	GL_VALIDATE_STATUS = 0x8B83,
	GL_VENDOR = 0x1F00,
	GL_VERSION = 0x1F02,
	GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F,
	GL_VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622,
	GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A,
	GL_VERTEX_ATTRIB_ARRAY_POINTER = 0x8645,
	GL_VERTEX_ATTRIB_ARRAY_SIZE = 0x8623,
	GL_VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624,
	GL_VERTEX_ATTRIB_ARRAY_TYPE = 0x8625,
	GL_VERTEX_SHADER = 0x8B31,
	GL_VIEWPORT = 0x0BA2,
	GL_ZERO = 0,

	-- GLES 3.0 constants
	GL_ACTIVE_UNIFORM_BLOCKS = 0x8A36,
	GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 0x8A35,
	GL_ALREADY_SIGNALED = 0x911A,
	GL_ANY_SAMPLES_PASSED = 0x8C2F,
	GL_ANY_SAMPLES_PASSED_CONSERVATIVE = 0x8D6A,
	GL_BLUE = 0x1905,
	GL_BUFFER_ACCESS_FLAGS = 0x911F,
	GL_BUFFER_MAPPED = 0x88BC,
	GL_BUFFER_MAP_LENGTH = 0x9120,
	GL_BUFFER_MAP_OFFSET = 0x9121,
	GL_BUFFER_MAP_POINTER = 0x88BD,
	GL_COLOR = 0x1800,
	GL_COLOR_ATTACHMENT1 = 0x8CE1,
	GL_COLOR_ATTACHMENT10 = 0x8CEA,
	GL_COLOR_ATTACHMENT11 = 0x8CEB,
	GL_COLOR_ATTACHMENT12 = 0x8CEC,
	GL_COLOR_ATTACHMENT13 = 0x8CED,
	GL_COLOR_ATTACHMENT14 = 0x8CEE,
	GL_COLOR_ATTACHMENT15 = 0x8CEF,
	GL_COLOR_ATTACHMENT16 = 0x8CF0,
	GL_COLOR_ATTACHMENT17 = 0x8CF1,
	GL_COLOR_ATTACHMENT18 = 0x8CF2,
	GL_COLOR_ATTACHMENT19 = 0x8CF3,
	GL_COLOR_ATTACHMENT2 = 0x8CE2,
	GL_COLOR_ATTACHMENT20 = 0x8CF4,
	GL_COLOR_ATTACHMENT21 = 0x8CF5,
	GL_COLOR_ATTACHMENT22 = 0x8CF6,
	GL_COLOR_ATTACHMENT23 = 0x8CF7,
	GL_COLOR_ATTACHMENT24 = 0x8CF8,
	GL_COLOR_ATTACHMENT25 = 0x8CF9,
	GL_COLOR_ATTACHMENT26 = 0x8CFA,
	GL_COLOR_ATTACHMENT27 = 0x8CFB,
	GL_COLOR_ATTACHMENT28 = 0x8CFC,
	GL_COLOR_ATTACHMENT29 = 0x8CFD,
	GL_COLOR_ATTACHMENT3 = 0x8CE3,
	GL_COLOR_ATTACHMENT30 = 0x8CFE,
	GL_COLOR_ATTACHMENT31 = 0x8CFF,
	GL_COLOR_ATTACHMENT4 = 0x8CE4,
	GL_COLOR_ATTACHMENT5 = 0x8CE5,
	GL_COLOR_ATTACHMENT6 = 0x8CE6,
	GL_COLOR_ATTACHMENT7 = 0x8CE7,
	GL_COLOR_ATTACHMENT8 = 0x8CE8,
	GL_COLOR_ATTACHMENT9 = 0x8CE9,
	GL_COMPARE_REF_TO_TEXTURE = 0x884E,
	GL_COMPRESSED_R11_EAC = 0x9270,
	GL_COMPRESSED_RG11_EAC = 0x9272,
	GL_COMPRESSED_RGB8_ETC2 = 0x9274,
	GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9276,
	GL_COMPRESSED_RGBA8_ETC2_EAC = 0x9278,
	GL_COMPRESSED_SIGNED_R11_EAC = 0x9271,
	GL_COMPRESSED_SIGNED_RG11_EAC = 0x9273,
	GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC = 0x9279,
	GL_COMPRESSED_SRGB8_ETC2 = 0x9275,
	GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9277,
	GL_CONDITION_SATISFIED = 0x911C,
	GL_COPY_READ_BUFFER = 0x8F36,
	GL_COPY_READ_BUFFER_BINDING = 0x8F36,
	GL_COPY_WRITE_BUFFER = 0x8F37,
	GL_COPY_WRITE_BUFFER_BINDING = 0x8F37,
	GL_CURRENT_QUERY = 0x8865,
	GL_DEPTH = 0x1801,
	GL_DEPTH24_STENCIL8 = 0x88F0,
	GL_DEPTH32F_STENCIL8 = 0x8CAD,
	GL_DEPTH_COMPONENT24 = 0x81A6,
	GL_DEPTH_COMPONENT32F = 0x8CAC,
	GL_DEPTH_STENCIL = 0x84F9,
	GL_DEPTH_STENCIL_ATTACHMENT = 0x821A,
	GL_DRAW_BUFFER0 = 0x8825,
	GL_DRAW_BUFFER1 = 0x8826,
	GL_DRAW_BUFFER10 = 0x882F,
	GL_DRAW_BUFFER11 = 0x8830,
	GL_DRAW_BUFFER12 = 0x8831,
	GL_DRAW_BUFFER13 = 0x8832,
	GL_DRAW_BUFFER14 = 0x8833,
	GL_DRAW_BUFFER15 = 0x8834,
	GL_DRAW_BUFFER2 = 0x8827,
	GL_DRAW_BUFFER3 = 0x8828,
	GL_DRAW_BUFFER4 = 0x8829,
	GL_DRAW_BUFFER5 = 0x882A,
	GL_DRAW_BUFFER6 = 0x882B,
	GL_DRAW_BUFFER7 = 0x882C,
	GL_DRAW_BUFFER8 = 0x882D,
	GL_DRAW_BUFFER9 = 0x882E,
	GL_DRAW_FRAMEBUFFER = 0x8CA9,
	GL_DRAW_FRAMEBUFFER_BINDING = 0x8CA6,
	GL_DYNAMIC_COPY = 0x88EA,
	GL_DYNAMIC_READ = 0x88E9,
	GL_FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD,
	GL_FLOAT_MAT2x3 = 0x8B65,
	GL_FLOAT_MAT2x4 = 0x8B66,
	GL_FLOAT_MAT3x2 = 0x8B67,
	GL_FLOAT_MAT3x4 = 0x8B68,
	GL_FLOAT_MAT4x2 = 0x8B69,
	GL_FLOAT_MAT4x3 = 0x8B6A,
	GL_FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B,
	GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215,
	GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214,
	GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210,
	GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211,
	GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216,
	GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213,
	GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212,
	GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217,
	GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4,
	GL_FRAMEBUFFER_DEFAULT = 0x8218,
	GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56,
	GL_FRAMEBUFFER_UNDEFINED = 0x8219,
	GL_GREEN = 0x1904,
	GL_HALF_FLOAT = 0x140B,
	GL_INTERLEAVED_ATTRIBS = 0x8C8C,
	GL_INT_2_10_10_10_REV = 0x8D9F,
	GL_INT_SAMPLER_2D = 0x8DCA,
	GL_INT_SAMPLER_2D_ARRAY = 0x8DCF,
	GL_INT_SAMPLER_3D = 0x8DCB,
	GL_INT_SAMPLER_CUBE = 0x8DCC,
	GL_INVALID_INDEX = 0xFFFFFFFF,
	GL_MAJOR_VERSION = 0x821B,
	GL_MAP_FLUSH_EXPLICIT_BIT = 0x0010,
	GL_MAP_INVALIDATE_BUFFER_BIT = 0x0008,
	GL_MAP_INVALIDATE_RANGE_BIT = 0x0004,
	GL_MAP_READ_BIT = 0x0001,
	GL_MAP_UNSYNCHRONIZED_BIT = 0x0020,
	GL_MAP_WRITE_BIT = 0x0002,
	GL_MAX = 0x8008,
	GL_MAX_3D_TEXTURE_SIZE = 0x8073,
	GL_MAX_ARRAY_TEXTURE_LAYERS = 0x88FF,
	GL_MAX_COLOR_ATTACHMENTS = 0x8CDF,
	GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33,
	GL_MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E,
	GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31,
	GL_MAX_DRAW_BUFFERS = 0x8824,
	GL_MAX_ELEMENTS_INDICES = 0x80E9,
	GL_MAX_ELEMENTS_VERTICES = 0x80E8,
	GL_MAX_ELEMENT_INDEX = 0x8D6B,
	GL_MAX_FRAGMENT_INPUT_COMPONENTS = 0x9125,
	GL_MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D,
	GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49,
	GL_MAX_PROGRAM_TEXEL_OFFSET = 0x8905,
	GL_MAX_SAMPLES = 0x8D57,
	GL_MAX_SERVER_WAIT_TIMEOUT = 0x9111,
	GL_MAX_TEXTURE_LOD_BIAS = 0x84FD,
	GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A,
	GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B,
	GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80,
	GL_MAX_UNIFORM_BLOCK_SIZE = 0x8A30,
	GL_MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F,
	GL_MAX_VARYING_COMPONENTS = 0x8B4B,
	GL_MAX_VERTEX_OUTPUT_COMPONENTS = 0x9122,
	GL_MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B,
	GL_MAX_VERTEX_UNIFORM_COMPONENTS = 0x8B4A,
	GL_MIN = 0x8007,
	GL_MINOR_VERSION = 0x821C,
	GL_MIN_PROGRAM_TEXEL_OFFSET = 0x8904,
	GL_NUM_EXTENSIONS = 0x821D,
	GL_NUM_PROGRAM_BINARY_FORMATS = 0x87FE,
	GL_NUM_SAMPLE_COUNTS = 0x9380,
	GL_OBJECT_TYPE = 0x9112,
	GL_PACK_ROW_LENGTH = 0x0D02,
	GL_PACK_SKIP_PIXELS = 0x0D04,
	GL_PACK_SKIP_ROWS = 0x0D03,
	GL_PIXEL_PACK_BUFFER = 0x88EB,
	GL_PIXEL_PACK_BUFFER_BINDING = 0x88ED,
	GL_PIXEL_UNPACK_BUFFER = 0x88EC,
	GL_PIXEL_UNPACK_BUFFER_BINDING = 0x88EF,
	GL_PRIMITIVE_RESTART_FIXED_INDEX = 0x8D69,
	GL_PROGRAM_BINARY_FORMATS = 0x87FF,
	GL_PROGRAM_BINARY_LENGTH = 0x8741,
	GL_PROGRAM_BINARY_RETRIEVABLE_HINT = 0x8257,
	GL_QUERY_RESULT = 0x8866,
	GL_QUERY_RESULT_AVAILABLE = 0x8867,
	GL_R11F_G11F_B10F = 0x8C3A,
	GL_R16F = 0x822D,
	GL_R16I = 0x8233,
	GL_R16UI = 0x8234,
	GL_R32F = 0x822E,
	GL_R32I = 0x8235,
	GL_R32UI = 0x8236,
	GL_R8 = 0x8229,
	GL_R8I = 0x8231,
	GL_R8UI = 0x8232,
	GL_R8_SNORM = 0x8F94,
	GL_RASTERIZER_DISCARD = 0x8C89,
	GL_READ_BUFFER = 0x0C02,
	GL_READ_FRAMEBUFFER = 0x8CA8,
	GL_READ_FRAMEBUFFER_BINDING = 0x8CAA,
	GL_RED = 0x1903,
	GL_RED_INTEGER = 0x8D94,
	GL_RENDERBUFFER_SAMPLES = 0x8CAB,
	GL_RG = 0x8227,
	GL_RG16F = 0x822F,
	GL_RG16I = 0x8239,
	GL_RG16UI = 0x823A,
	GL_RG32F = 0x8230,
	GL_RG32I = 0x823B,
	GL_RG32UI = 0x823C,
	GL_RG8 = 0x822B,
	GL_RG8I = 0x8237,
	GL_RG8UI = 0x8238,
	GL_RG8_SNORM = 0x8F95,
	GL_RGB10_A2 = 0x8059,
	GL_RGB10_A2UI = 0x906F,
	GL_RGB16F = 0x881B,
	GL_RGB16I = 0x8D89,
	GL_RGB16UI = 0x8D77,
	GL_RGB32F = 0x8815,
	GL_RGB32I = 0x8D83,
	GL_RGB32UI = 0x8D71,
	GL_RGB8 = 0x8051,
	GL_RGB8I = 0x8D8F,
	GL_RGB8UI = 0x8D7D,
	GL_RGB8_SNORM = 0x8F96,
	GL_RGB9_E5 = 0x8C3D,
	GL_RGBA16F = 0x881A,
	GL_RGBA16I = 0x8D88,
	GL_RGBA16UI = 0x8D76,
	GL_RGBA32F = 0x8814,
	GL_RGBA32I = 0x8D82,
	GL_RGBA32UI = 0x8D70,
	GL_RGBA8 = 0x8058,
	GL_RGBA8I = 0x8D8E,
	GL_RGBA8UI = 0x8D7C,
	GL_RGBA8_SNORM = 0x8F97,
	GL_RGBA_INTEGER = 0x8D99,
	GL_RGB_INTEGER = 0x8D98,
	GL_RG_INTEGER = 0x8228,
	GL_SAMPLER_2D_ARRAY = 0x8DC1,
	GL_SAMPLER_2D_ARRAY_SHADOW = 0x8DC4,
	GL_SAMPLER_2D_SHADOW = 0x8B62,
	GL_SAMPLER_3D = 0x8B5F,
	GL_SAMPLER_BINDING = 0x8919,
	GL_SAMPLER_CUBE_SHADOW = 0x8DC5,
	GL_SEPARATE_ATTRIBS = 0x8C8D,
	GL_SIGNALED = 0x9119,
	GL_SIGNED_NORMALIZED = 0x8F9C,
	GL_SRGB = 0x8C40,
	GL_SRGB8 = 0x8C41,
	GL_SRGB8_ALPHA8 = 0x8C43,
	GL_STATIC_COPY = 0x88E6,
	GL_STATIC_READ = 0x88E5,
	GL_STENCIL = 0x1802,
	GL_STREAM_COPY = 0x88E2,
	GL_STREAM_READ = 0x88E1,
	GL_SYNC_CONDITION = 0x9113,
	GL_SYNC_FENCE = 0x9116,
	GL_SYNC_FLAGS = 0x9115,
	GL_SYNC_FLUSH_COMMANDS_BIT = 0x00000001,
	GL_SYNC_GPU_COMMANDS_COMPLETE = 0x9117,
	GL_SYNC_STATUS = 0x9114,
	GL_TEXTURE_2D_ARRAY = 0x8C1A,
	GL_TEXTURE_3D = 0x806F,
	GL_TEXTURE_BASE_LEVEL = 0x813C,
	GL_TEXTURE_BINDING_2D_ARRAY = 0x8C1D,
	GL_TEXTURE_BINDING_3D = 0x806A,
	GL_TEXTURE_COMPARE_FUNC = 0x884D,
	GL_TEXTURE_COMPARE_MODE = 0x884C,
	GL_TEXTURE_IMMUTABLE_FORMAT = 0x912F,
	GL_TEXTURE_IMMUTABLE_LEVELS = 0x82DF,
	GL_TEXTURE_MAX_LEVEL = 0x813D,
	GL_TEXTURE_MAX_LOD = 0x813B,
	GL_TEXTURE_MIN_LOD = 0x813A,
	GL_TEXTURE_SWIZZLE_A = 0x8E45,
	GL_TEXTURE_SWIZZLE_B = 0x8E44,
	GL_TEXTURE_SWIZZLE_G = 0x8E43,
	GL_TEXTURE_SWIZZLE_R = 0x8E42,
	GL_TEXTURE_WRAP_R = 0x8072,
	GL_TIMEOUT_EXPIRED = 0x911B,
	GL_TIMEOUT_IGNORED = 0xFFFFFFFFFFFFFFFF,
	GL_TRANSFORM_FEEDBACK = 0x8E22,
	GL_TRANSFORM_FEEDBACK_ACTIVE = 0x8E24,
	GL_TRANSFORM_FEEDBACK_BINDING = 0x8E25,
	GL_TRANSFORM_FEEDBACK_BUFFER = 0x8C8E,
	GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F,
	GL_TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F,
	GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85,
	GL_TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84,
	GL_TRANSFORM_FEEDBACK_PAUSED = 0x8E23,
	GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88,
	GL_TRANSFORM_FEEDBACK_VARYINGS = 0x8C83,
	GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 0x8C76,
	GL_UNIFORM_ARRAY_STRIDE = 0x8A3C,
	GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42,
	GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43,
	GL_UNIFORM_BLOCK_BINDING = 0x8A3F,
	GL_UNIFORM_BLOCK_DATA_SIZE = 0x8A40,
	GL_UNIFORM_BLOCK_INDEX = 0x8A3A,
	GL_UNIFORM_BLOCK_NAME_LENGTH = 0x8A41,
	GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46,
	GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44,
	GL_UNIFORM_BUFFER = 0x8A11,
	GL_UNIFORM_BUFFER_BINDING = 0x8A28,
	GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34,
	GL_UNIFORM_BUFFER_SIZE = 0x8A2A,
	GL_UNIFORM_BUFFER_START = 0x8A29,
	GL_UNIFORM_IS_ROW_MAJOR = 0x8A3E,
	GL_UNIFORM_MATRIX_STRIDE = 0x8A3D,
	GL_UNIFORM_NAME_LENGTH = 0x8A39,
	GL_UNIFORM_OFFSET = 0x8A3B,
	GL_UNIFORM_SIZE = 0x8A38,
	GL_UNIFORM_TYPE = 0x8A37,
	GL_UNPACK_IMAGE_HEIGHT = 0x806E,
	GL_UNPACK_ROW_LENGTH = 0x0CF2,
	GL_UNPACK_SKIP_IMAGES = 0x806D,
	GL_UNPACK_SKIP_PIXELS = 0x0CF4,
	GL_UNPACK_SKIP_ROWS = 0x0CF3,
	GL_UNSIGNALED = 0x9118,
	GL_UNSIGNED_INT_10F_11F_11F_REV = 0x8C3B,
	GL_UNSIGNED_INT_24_8 = 0x84FA,
	GL_UNSIGNED_INT_2_10_10_10_REV = 0x8368,
	GL_UNSIGNED_INT_5_9_9_9_REV = 0x8C3E,
	GL_UNSIGNED_INT_SAMPLER_2D = 0x8DD2,
	GL_UNSIGNED_INT_SAMPLER_2D_ARRAY = 0x8DD7,
	GL_UNSIGNED_INT_SAMPLER_3D = 0x8DD3,
	GL_UNSIGNED_INT_SAMPLER_CUBE = 0x8DD4,
	GL_UNSIGNED_INT_VEC2 = 0x8DC6,
	GL_UNSIGNED_INT_VEC3 = 0x8DC7,
	GL_UNSIGNED_INT_VEC4 = 0x8DC8,
	GL_UNSIGNED_NORMALIZED = 0x8C17,
	GL_VERTEX_ARRAY_BINDING = 0x85B5,
	GL_VERTEX_ATTRIB_ARRAY_DIVISOR = 0x88FE,
	GL_VERTEX_ATTRIB_ARRAY_INTEGER = 0x88FD,
	GL_WAIT_FAILED = 0x911D,

	-- GLES 2.0 function refs
	glActiveTexture = libgles3.glActiveTexture,
	glAttachShader = libgles3.glAttachShader,
	glBindAttribLocation = libgles3.glBindAttribLocation,
	glBindBuffer = libgles3.glBindBuffer,
	glBindFramebuffer = libgles3.glBindFramebuffer,
	glBindRenderbuffer = libgles3.glBindRenderbuffer,
	glBindTexture = libgles3.glBindTexture,
	glBlendColor = libgles3.glBlendColor,
	glBlendEquation = libgles3.glBlendEquation,
	glBlendEquationSeparate = libgles3.glBlendEquationSeparate,
	glBlendFunc = libgles3.glBlendFunc,
	glBlendFuncSeparate = libgles3.glBlendFuncSeparate,
	glBufferData = libgles3.glBufferData,
	glBufferSubData = libgles3.glBufferSubData,
	glCheckFramebufferStatus = libgles3.glCheckFramebufferStatus,
	glClear = libgles3.glClear,
	glClearColor = libgles3.glClearColor,
	glClearDepthf = libgles3.glClearDepthf,
	glClearStencil = libgles3.glClearStencil,
	glColorMask = libgles3.glColorMask,
	glCompileShader = libgles3.glCompileShader,
	glCompressedTexImage2D = libgles3.glCompressedTexImage2D,
	glCompressedTexSubImage2D = libgles3.glCompressedTexSubImage2D,
	glCopyTexImage2D = libgles3.glCopyTexImage2D,
	glCopyTexSubImage2D = libgles3.glCopyTexSubImage2D,
	glCreateProgram = libgles3.glCreateProgram,
	glCreateShader = libgles3.glCreateShader,
	glCullFace = libgles3.glCullFace,
	glDeleteBuffers = libgles3.glDeleteBuffers,
	glDeleteFramebuffers = libgles3.glDeleteFramebuffers,
	glDeleteProgram = libgles3.glDeleteProgram,
	glDeleteRenderbuffers = libgles3.glDeleteRenderbuffers,
	glDeleteShader = libgles3.glDeleteShader,
	glDeleteTextures = libgles3.glDeleteTextures,
	glDepthFunc = libgles3.glDepthFunc,
	glDepthMask = libgles3.glDepthMask,
	glDepthRangef = libgles3.glDepthRangef,
	glDetachShader = libgles3.glDetachShader,
	glDisable = libgles3.glDisable,
	glDisableVertexAttribArray = libgles3.glDisableVertexAttribArray,
	glDrawArrays = libgles3.glDrawArrays,
	glDrawElements = libgles3.glDrawElements,
	glEnable = libgles3.glEnable,
	glEnableVertexAttribArray = libgles3.glEnableVertexAttribArray,
	glFinish = libgles3.glFinish,
	glFlush = libgles3.glFlush,
	glFramebufferRenderbuffer = libgles3.glFramebufferRenderbuffer,
	glFramebufferTexture2D = libgles3.glFramebufferTexture2D,
	glFrontFace = libgles3.glFrontFace,
	glGenBuffers = libgles3.glGenBuffers,
	glGenerateMipmap = libgles3.glGenerateMipmap,
	glGenFramebuffers = libgles3.glGenFramebuffers,
	glGenRenderbuffers = libgles3.glGenRenderbuffers,
	glGenTextures = libgles3.glGenTextures,
	glGetActiveAttrib = libgles3.glGetActiveAttrib,
	glGetActiveUniform = libgles3.glGetActiveUniform,
	glGetAttachedShaders = libgles3.glGetAttachedShaders,
	glGetAttribLocation = libgles3.glGetAttribLocation,
	glGetBooleanv = libgles3.glGetBooleanv,
	glGetBufferParameteriv = libgles3.glGetBufferParameteriv,
	glGetError = libgles3.glGetError,
	glGetFloatv = libgles3.glGetFloatv,
	glGetFramebufferAttachmentParameteriv = libgles3.glGetFramebufferAttachmentParameteriv,
	glGetIntegerv = libgles3.glGetIntegerv,
	glGetProgramiv = libgles3.glGetProgramiv,
	glGetProgramInfoLog = libgles3.glGetProgramInfoLog,
	glGetRenderbufferParameteriv = libgles3.glGetRenderbufferParameteriv,
	glGetShaderiv = libgles3.glGetShaderiv,
	glGetShaderInfoLog = libgles3.glGetShaderInfoLog,
	glGetShaderPrecisionFormat = libgles3.glGetShaderPrecisionFormat,
	glGetShaderSource = libgles3.glGetShaderSource,
	glGetString = libgles3.glGetString,
	glGetTexParameterfv = libgles3.glGetTexParameterfv,
	glGetTexParameteriv = libgles3.glGetTexParameteriv,
	glGetUniformfv = libgles3.glGetUniformfv,
	glGetUniformiv = libgles3.glGetUniformiv,
	glGetUniformLocation = libgles3.glGetUniformLocation,
	glGetVertexAttribfv = libgles3.glGetVertexAttribfv,
	glGetVertexAttribiv = libgles3.glGetVertexAttribiv,
	glGetVertexAttribPointerv = libgles3.glGetVertexAttribPointerv,
	glHint = libgles3.glHint,
	glIsBuffer = libgles3.glIsBuffer,
	glIsEnabled = libgles3.glIsEnabled,
	glIsFramebuffer = libgles3.glIsFramebuffer,
	glIsProgram = libgles3.glIsProgram,
	glIsRenderbuffer = libgles3.glIsRenderbuffer,
	glIsShader = libgles3.glIsShader,
	glIsTexture = libgles3.glIsTexture,
	glLineWidth = libgles3.glLineWidth,
	glLinkProgram = libgles3.glLinkProgram,
	glPixelStorei = libgles3.glPixelStorei,
	glPolygonOffset = libgles3.glPolygonOffset,
	glReadPixels = libgles3.glReadPixels,
	glReleaseShaderCompiler = libgles3.glReleaseShaderCompiler,
	glRenderbufferStorage = libgles3.glRenderbufferStorage,
	glSampleCoverage = libgles3.glSampleCoverage,
	glScissor = libgles3.glScissor,
	glShaderBinary = libgles3.glShaderBinary,
	glShaderSource = libgles3.glShaderSource,
	glStencilFunc = libgles3.glStencilFunc,
	glStencilFuncSeparate = libgles3.glStencilFuncSeparate,
	glStencilMask = libgles3.glStencilMask,
	glStencilMaskSeparate = libgles3.glStencilMaskSeparate,
	glStencilOp = libgles3.glStencilOp,
	glStencilOpSeparate = libgles3.glStencilOpSeparate,
	glTexImage2D = libgles3.glTexImage2D,
	glTexParameterf = libgles3.glTexParameterf,
	glTexParameterfv = libgles3.glTexParameterfv,
	glTexParameteri = libgles3.glTexParameteri,
	glTexParameteriv = libgles3.glTexParameteriv,
	glTexSubImage2D = libgles3.glTexSubImage2D,
	glUniform1f = libgles3.glUniform1f,
	glUniform1fv = libgles3.glUniform1fv,
	glUniform1i = libgles3.glUniform1i,
	glUniform1iv = libgles3.glUniform1iv,
	glUniform2f = libgles3.glUniform2f,
	glUniform2fv = libgles3.glUniform2fv,
	glUniform2i = libgles3.glUniform2i,
	glUniform2iv = libgles3.glUniform2iv,
	glUniform3f = libgles3.glUniform3f,
	glUniform3fv = libgles3.glUniform3fv,
	glUniform3i = libgles3.glUniform3i,
	glUniform3iv = libgles3.glUniform3iv,
	glUniform4f = libgles3.glUniform4f,
	glUniform4fv = libgles3.glUniform4fv,
	glUniform4i = libgles3.glUniform4i,
	glUniform4iv = libgles3.glUniform4iv,
	glUniformMatrix2fv = libgles3.glUniformMatrix2fv,
	glUniformMatrix3fv = libgles3.glUniformMatrix3fv,
	glUniformMatrix4fv = libgles3.glUniformMatrix4fv,
	glUseProgram = libgles3.glUseProgram,
	glValidateProgram = libgles3.glValidateProgram,
	glVertexAttrib1f = libgles3.glVertexAttrib1f,
	glVertexAttrib1fv = libgles3.glVertexAttrib1fv,
	glVertexAttrib2f = libgles3.glVertexAttrib2f,
	glVertexAttrib2fv = libgles3.glVertexAttrib2fv,
	glVertexAttrib3f = libgles3.glVertexAttrib3f,
	glVertexAttrib3fv = libgles3.glVertexAttrib3fv,
	glVertexAttrib4f = libgles3.glVertexAttrib4f,
	glVertexAttrib4fv = libgles3.glVertexAttrib4fv,
	glVertexAttribPointer = libgles3.glVertexAttribPointer,
	glViewport = libgles3.glViewport,

	-- GLES 3.0 function refs
	glBeginQuery = libgles3.glBeginQuery,
	glBeginTransformFeedback = libgles3.glBeginTransformFeedback,
	glBindBufferBase = libgles3.glBindBufferBase,
	glBindBufferRange = libgles3.glBindBufferRange,
	glBindSampler = libgles3.glBindSampler,
	glBindTransformFeedback = libgles3.glBindTransformFeedback,
	glBindVertexArray = libgles3.glBindVertexArray,
	glBlitFramebuffer = libgles3.glBlitFramebuffer,
	glClearBufferfi = libgles3.glClearBufferfi,
	glClearBufferfv = libgles3.glClearBufferfv,
	glClearBufferiv = libgles3.glClearBufferiv,
	glClearBufferuiv = libgles3.glClearBufferuiv,
	glClientWaitSync = libgles3.glClientWaitSync,
	glCompressedTexImage3D = libgles3.glCompressedTexImage3D,
	glCompressedTexSubImage3D = libgles3.glCompressedTexSubImage3D,
	glCopyBufferSubData = libgles3.glCopyBufferSubData,
	glCopyTexSubImage3D = libgles3.glCopyTexSubImage3D,
	glDeleteQueries = libgles3.glDeleteQueries,
	glDeleteSamplers = libgles3.glDeleteSamplers,
	glDeleteSync = libgles3.glDeleteSync,
	glDeleteTransformFeedbacks = libgles3.glDeleteTransformFeedbacks,
	glDeleteVertexArrays = libgles3.glDeleteVertexArrays,
	glDrawArraysInstanced = libgles3.glDrawArraysInstanced,
	glDrawBuffers = libgles3.glDrawBuffers,
	glDrawElementsInstanced = libgles3.glDrawElementsInstanced,
	glDrawRangeElements = libgles3.glDrawRangeElements,
	glEndQuery = libgles3.glEndQuery,
	glEndTransformFeedback = libgles3.glEndTransformFeedback,
	glFenceSync = libgles3.glFenceSync,
	glFlushMappedBufferRange = libgles3.glFlushMappedBufferRange,
	glFramebufferTextureLayer = libgles3.glFramebufferTextureLayer,
	glGenQueries = libgles3.glGenQueries,
	glGenSamplers = libgles3.glGenSamplers,
	glGenTransformFeedbacks = libgles3.glGenTransformFeedbacks,
	glGenVertexArrays = libgles3.glGenVertexArrays,
	glGetActiveUniformBlockName = libgles3.glGetActiveUniformBlockName,
	glGetActiveUniformBlockiv = libgles3.glGetActiveUniformBlockiv,
	glGetActiveUniformsiv = libgles3.glGetActiveUniformsiv,
	glGetBufferParameteri64v = libgles3.glGetBufferParameteri64v,
	glGetBufferPointerv = libgles3.glGetBufferPointerv,
	glGetFragDataLocation = libgles3.glGetFragDataLocation,
	glGetInteger64i_v = libgles3.glGetInteger64i_v,
	glGetInteger64v = libgles3.glGetInteger64v,
	glGetIntegeri_v = libgles3.glGetIntegeri_v,
	glGetInternalformativ = libgles3.glGetInternalformativ,
	glGetProgramBinary = libgles3.glGetProgramBinary,
	glGetQueryObjectuiv = libgles3.glGetQueryObjectuiv,
	glGetQueryiv = libgles3.glGetQueryiv,
	glGetSamplerParameterfv = libgles3.glGetSamplerParameterfv,
	glGetSamplerParameteriv = libgles3.glGetSamplerParameteriv,
	glGetStringi = libgles3.glGetStringi,
	glGetSynciv = libgles3.glGetSynciv,
	glGetTransformFeedbackVarying = libgles3.glGetTransformFeedbackVarying,
	glGetUniformBlockIndex = libgles3.glGetUniformBlockIndex,
	glGetUniformIndices = libgles3.glGetUniformIndices,
	glGetUniformuiv = libgles3.glGetUniformuiv,
	glGetVertexAttribIiv = libgles3.glGetVertexAttribIiv,
	glGetVertexAttribIuiv = libgles3.glGetVertexAttribIuiv,
	glInvalidateFramebuffer = libgles3.glInvalidateFramebuffer,
	glInvalidateSubFramebuffer = libgles3.glInvalidateSubFramebuffer,
	glIsQuery = libgles3.glIsQuery,
	glIsSampler = libgles3.glIsSampler,
	glIsSync = libgles3.glIsSync,
	glIsTransformFeedback = libgles3.glIsTransformFeedback,
	glIsVertexArray = libgles3.glIsVertexArray,
	glMapBufferRange = libgles3.glMapBufferRange,
	glPauseTransformFeedback = libgles3.glPauseTransformFeedback,
	glProgramBinary = libgles3.glProgramBinary,
	glProgramParameteri = libgles3.glProgramParameteri,
	glReadBuffer = libgles3.glReadBuffer,
	glRenderbufferStorageMultisample = libgles3.glRenderbufferStorageMultisample,
	glResumeTransformFeedback = libgles3.glResumeTransformFeedback,
	glSamplerParameterf = libgles3.glSamplerParameterf,
	glSamplerParameterfv = libgles3.glSamplerParameterfv,
	glSamplerParameteri = libgles3.glSamplerParameteri,
	glSamplerParameteriv = libgles3.glSamplerParameteriv,
	glTexImage3D = libgles3.glTexImage3D,
	glTexStorage2D = libgles3.glTexStorage2D,
	glTexStorage3D = libgles3.glTexStorage3D,
	glTexSubImage3D = libgles3.glTexSubImage3D,
	glTransformFeedbackVaryings = libgles3.glTransformFeedbackVaryings,
	glUniform1ui = libgles3.glUniform1ui,
	glUniform1uiv = libgles3.glUniform1uiv,
	glUniform2ui = libgles3.glUniform2ui,
	glUniform2uiv = libgles3.glUniform2uiv,
	glUniform3ui = libgles3.glUniform3ui,
	glUniform3uiv = libgles3.glUniform3uiv,
	glUniform4ui = libgles3.glUniform4ui,
	glUniform4uiv = libgles3.glUniform4uiv,
	glUniformBlockBinding = libgles3.glUniformBlockBinding,
	glUniformMatrix2x3fv = libgles3.glUniformMatrix2x3fv,
	glUniformMatrix2x4fv = libgles3.glUniformMatrix2x4fv,
	glUniformMatrix3x2fv = libgles3.glUniformMatrix3x2fv,
	glUniformMatrix3x4fv = libgles3.glUniformMatrix3x4fv,
	glUniformMatrix4x2fv = libgles3.glUniformMatrix4x2fv,
	glUniformMatrix4x3fv = libgles3.glUniformMatrix4x3fv,
	glUnmapBuffer = libgles3.glUnmapBuffer,
	glVertexAttribDivisor = libgles3.glVertexAttribDivisor,
	glVertexAttribI4i = libgles3.glVertexAttribI4i,
	glVertexAttribI4iv = libgles3.glVertexAttribI4iv,
	glVertexAttribI4ui = libgles3.glVertexAttribI4ui,
	glVertexAttribI4uiv = libgles3.glVertexAttribI4uiv,
	glVertexAttribIPointer = libgles3.glVertexAttribIPointer,
	glWaitSync = libgles3.glWaitSync,
}

return gl
