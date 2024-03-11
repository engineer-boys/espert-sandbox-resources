#version 450

layout (set = 0, binding = 0) uniform CursorParamsUBO {
    float cursor_size;
    vec3 cursor_color;
    float aspect_ratio;
} cpUbo;

layout (set = 1, binding = 0) uniform MousePosUBO {
    vec2 mouse_pos;
} mpUbo;

void main()
{
    gl_Position = vec4(mpUbo.mouse_pos, 0.0, 1.0);
}
