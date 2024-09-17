#version 450

const vec2 origin = vec2(0, 0);
const float blend_factor = 0.1;

layout (location = 0) in vec3 position;
layout (location = 1) in vec3 color;

layout (location = 0) out vec4 frag_color;

layout (set = 0, binding = 0) uniform UBO {
    mat4 projection;
} ubo;

void main()
{
    gl_Position = ubo.projection * vec4(position, 1.0);

    float dist = distance(origin, vec2(position.x, position.z));
    float alpha = exp(-dist * blend_factor);

    frag_color = vec4(color, alpha);
}
