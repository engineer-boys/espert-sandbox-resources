#version 450

layout (location = 0) out vec4 outColor;

layout (location = 0) flat in int control_line;

layout (set = 0, binding = 2) uniform SPLINE_COLOR_UBO {
    vec3 control_line_color;
    vec3 spline_color;
} scu;

void main()
{
    if(control_line == 1)
    {
        outColor = vec4(scu.control_line_color, 1.0);
    }
    else
    {
        outColor = vec4(scu.spline_color, 1.0);
    }
}