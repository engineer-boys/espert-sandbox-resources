#version 450

layout (vertices = 4) out;  // TODO: 16 (?)

void main()
{
    // Pass through control points
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

    // Inner tessellation levels
    gl_TessLevelInner[0] = 3.0;
    gl_TessLevelInner[1] = 3.0;

    // Outer tessellation levels
    gl_TessLevelOuter[0] = 1.0;
    gl_TessLevelOuter[1] = 1.0;
    gl_TessLevelOuter[2] = 1.0;
    gl_TessLevelOuter[3] = 1.0;
}