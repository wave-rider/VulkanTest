
CC=gcc
CFLAGS=-lglfw -lstdc++ -lvulkan


all:		numberextensions listextensions pickphysicaldevice triangle


numberextensions:		
		$(CC) $(CFLAGS) -o numberextensions numberextensions.cpp


listextensions:		
		$(CC) $(CFLAGS) -o listextensions listextensions.cpp


pickphysicaldevice:		
		$(CC) $(CFLAGS) -o pickphysicaldevice pickphysicaldevice.cpp


triangle:		triangleshader triangleprogram


triangleshader:		
		glslangValidator -V -o shaders/vert.spv shaders/shader.vert
		glslangValidator -V -o shaders/frag.spv shaders/shader.frag


triangleprogram:		
		$(CC) $(CFLAGS) -o draw_triangle draw_triangle.cpp
