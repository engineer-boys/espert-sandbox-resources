#version 450

layout (points) in;
layout (line_strip, max_vertices = 6) out;

layout (set = 0, binding = 0) uniform CursorParamsUBO {
    float cursor_size;
    vec3 cursor_color;
    float aspect_ratio;
} cpUbo;

//const float aspect_ratio = 1.77777779;
//const float size_x = 0.025;
//const float size_y = size_x * aspect_ratio;

void main()
{
    const float aspect_ratio = cpUbo.aspect_ratio;
    const float size_x = cpUbo.cursor_size;
    const float size_y = size_x * aspect_ratio;

    // Emit original vertex
    gl_Position = gl_in[0].gl_Position;
    EmitVertex();

    // Left - right strip
    vec2 offset_left = vec2(-size_x, 0.0);
    vec2 offset_right = vec2(size_x, 0.0);
    gl_Position = gl_in[0].gl_Position + vec4(offset_left, 0.0, 0.0);
    EmitVertex();
    gl_Position = gl_in[0].gl_Position + vec4(offset_right, 0.0, 0.0);
    EmitVertex();

    // Top - bottom strip
    gl_Position = gl_in[0].gl_Position;
    EmitVertex();
    vec2 offset_top = vec2(0.0, size_y);
    vec2 offset_bottom = vec2(0.0, -size_y);
    gl_Position = gl_in[0].gl_Position + vec4(offset_top, 0.0, 0.0);
    EmitVertex();
    gl_Position = gl_in[0].gl_Position + vec4(offset_bottom, 0.0, 0.0);
    EmitVertex();

    EndPrimitive();
}