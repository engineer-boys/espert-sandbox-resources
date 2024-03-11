#version 450

//layout (location = 0) in vec2 position;
//layout (location = 1) in vec3 color;

//layout (location = 0) out vec3 geom_color;

layout (push_constant) uniform Push {
    vec2 mouse_pos;
} push;

void main()
{
    gl_Position = vec4(push.mouse_pos, 0.0, 1.0);

//    geom_color = color;
}
