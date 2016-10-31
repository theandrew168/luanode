#include "gfx_window.h"

unsigned m_width, m_height;
SDL_Window *m_window;
SDL_GLContext *m_context;
SDL_Event m_event;

bool gfx_init() {
	if (SDL_Init(SDL_INIT_VIDEO) != 0) {
		printf("SDL_Init error: %s\n", SDL_GetError());
		return false;
	}

	return true;
}

void gfx_quit() {
	SDL_GL_DeleteContext(m_context);
	SDL_DestroyWindow(m_window);
	SDL_Quit();
}

void gfx_createWindow(unsigned width, unsigned height) {
	m_width = width;
	m_height = height;

	m_window = SDL_CreateWindow("luanode", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
			m_width, m_height, SDL_WINDOW_OPENGL);

	if (!m_window) {
		printf("Failed to create window!\n");
		SDL_Quit();
		return;
	}

	// Set context attribs
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 3);
	SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
	//SDL_GL_SetSwapInterval(1); // vsync

	m_context = SDL_GL_CreateContext(m_window);

	if (!m_context) {
		printf("Failed to create context!\n");
		SDL_DestroyWindow(m_window);
		SDL_Quit();
		return;
	}

	if (!gladLoadGLLoader(SDL_GL_GetProcAddress)) {
		printf("Unable to initialize GLAD!\n");
		gfx_quit();
		return;
	} else {
		printf("OpenGL: %s\n", glGetString(GL_VERSION));
	}
}

bool gfx_closeRequested() {
	if (m_event.type == SDL_QUIT) {
		return true;
	}

	return false;
}

void gfx_clearColor(float r, float g, float b, float a) {
	glClearColor(r, g, b, a);
}

void gfx_update() {
	SDL_PollEvent(&m_event);
}

void gfx_clear() {
	glClear(GL_COLOR_BUFFER_BIT);
}

void gfx_draw() {
	SDL_GL_SwapWindow(m_window);
}
