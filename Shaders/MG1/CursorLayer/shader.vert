#version 450

layout (location = 0) out mat4 perspective_mat;

layout (set = 0, binding = 0) uniform UBO {
    vec2 mouse_pos;
} ubo;

layout (push_constant) uniform Push {
    mat4 perspective_mat;
} push;

void main()
{
    gl_Position = vec4(ubo.mouse_pos, 0.0, 1.0);

    perspective_mat = push.perspective_mat;
}
