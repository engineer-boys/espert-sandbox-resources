#version 450

layout (location = 0) in vec2 position;
layout (location = 1) in vec3 color;

layout (location = 0) out vec3 frag_color;

layout (set = 0, binding = 0) uniform UBO {
    mat4 projection;
} ubo;

void main()
{
    gl_Position = ubo.projection * vec4(position.x, 0.0, position.y, 1.0);
    frag_color = color;
}
