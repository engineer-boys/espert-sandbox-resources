#version 450

layout (location = 0) in vec3 position;
layout (location = 1) in vec3 color;

layout (location = 0) out vec3 frag_color;

layout (set = 0, binding = 0) uniform MousePosUBO {
    vec3 mouse_pos;
} mpUbo;

layout (set = 0, binding = 1) uniform VP {
    mat4 mat;
} vp;

void main()
{
    vec3 world_pos = position + mpUbo.mouse_pos;
    gl_Position = vp.mat * vec4(world_pos, 1.0);

    frag_color = color;
}
