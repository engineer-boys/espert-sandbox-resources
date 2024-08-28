#version 450

layout (location = 0) in vec3 position;
layout (location = 1) in vec3 color;

layout (location = 0) out vec3 frag_color;

layout (set = 0, binding = 0) uniform MVP {
    mat4 mat;
} mvp;

void main()
{
    gl_Position = mvp.mat * vec4(position, 1.0);

    frag_color = color;
}
