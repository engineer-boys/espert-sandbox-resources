#version 450

layout (location = 0) out vec4 out_color;

layout (set = 0, binding = 0) uniform CursorParamsUBO {
    float cursor_size;
    vec3 cursor_color;
    float aspect_ratio;
} cpUbo;

void main()
{
    out_color = vec4(cpUbo.cursor_color, 1.0);
}