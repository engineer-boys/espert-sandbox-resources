#version 450

#define CONTROL_LINE_COLOR vec4(0.0, 0.0, 1.0, 1.0)

layout (location = 0) out vec4 outColor;

layout (location = 0) flat in int control_line;


layout (set = 0, binding = 2) uniform UBO {
    vec3 color;
} ubo;

void main()
{
    if(control_line == 1)
    {
        outColor = CONTROL_LINE_COLOR;
    }
    else
    {
        outColor = vec4(ubo.color, 1.0);
    }
}