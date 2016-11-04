#!/bin/bash

echo
echo '--- VERSION ---'
glxinfo | grep -E 'OpenGL.*version'

echo
echo '--- LIBRARIES (abridged) ---'
find /usr/lib -name 'libGL.so'
find /usr/lib -name 'libGLESv2.so'
find /usr/lib -name 'libEGL.so'
find /usr/lib32 -name 'libGL.so'
find /usr/lib32 -name 'libGLESv2.so'
find /usr/lib32 -name 'libEGL.so'

echo
echo '--- LIBRARIES (64bit) ---'
find /usr/lib -name 'libGL\.*'
echo
find /usr/lib -name 'libGLES*'
echo
find /usr/lib -name 'libEGL*'

echo
echo '--- LIBRARIES (32bit) ---'
find /usr/lib32 -name 'libGL\.*'
echo
find /usr/lib32 -name 'libGLES*'
echo
find /usr/lib32 -name 'libEGL*'
