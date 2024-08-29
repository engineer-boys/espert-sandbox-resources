#version 450

#define SEGMENTS 30
#define BERNSTEIN_BASE mat4(1, 0, 0, 0, -3, 3, 0, 0, 3, -6, 3, 0, -1, 3, -3, 1)

layout(lines_adjacency) in;
layout(line_strip, max_vertices = 124) out;

layout (set = 0, binding = 1) uniform SPLINE_UBO
{
    int control_line;
} su;

layout (location = 0) out int control_line;

void emitVertex(vec4 position, int display_control_line);
vec4 toBezier(float d, int i, vec4 p0, vec4 p1, vec4 p2, vec4 p3);

void main()
{
    // 4 control points
    vec4 P[4];
    P[0] = gl_in[0].gl_Position;
    P[1] = gl_in[1].gl_Position;
    P[2] = gl_in[2].gl_Position;
    P[3] = gl_in[3].gl_Position;

    float d = 1.0 / float(SEGMENTS);
    for (int i = 0; i <= SEGMENTS - 1; i++)
    {
        emitVertex(toBezier(d, i, P[0], P[1], P[2], P[3]), 0);
        emitVertex(toBezier(d, i + 1, P[0], P[1], P[2], P[3]), 0);
        EndPrimitive();
    }

    if(su.control_line == 1)
    {
        emitVertex(gl_in[0].gl_Position, 1);
        emitVertex(gl_in[1].gl_Position, 1);
        EndPrimitive();
        emitVertex(gl_in[1].gl_Position, 1);
        emitVertex(gl_in[2].gl_Position, 1);
        EndPrimitive();
        emitVertex(gl_in[2].gl_Position, 1);
        emitVertex(gl_in[3].gl_Position, 1);
        EndPrimitive();
    }
}

void emitVertex(vec4 position, int display_control_line)
{
    gl_Position = position;
    control_line = display_control_line;
    EmitVertex();
}

vec4 toBezier(float d, int i, vec4 p0, vec4 p1, vec4 p2, vec4 p3)
{
    float t = d * float(i);
    float t2 = t * t;
    float t3 = t2 * t;

    return mat4(p0, p1, p2, p3) * BERNSTEIN_BASE * vec4(1, t, t2, t3);

}