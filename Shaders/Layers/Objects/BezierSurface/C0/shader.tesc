#version 450

layout (vertices = 16) out;

layout (set = 1, binding = 0) uniform TESS {
    int u;
    int v;
} tess;

void main()
{
    // Pass through control points
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

    // Inner tessellation levels
    gl_TessLevelInner[0] = tess.u;
    gl_TessLevelInner[1] = tess.v;

    // Outer tessellation levels
    gl_TessLevelOuter[0] = tess.v;
    gl_TessLevelOuter[1] = tess.u;
    gl_TessLevelOuter[2] = tess.v;
    gl_TessLevelOuter[3] = tess.u;
}