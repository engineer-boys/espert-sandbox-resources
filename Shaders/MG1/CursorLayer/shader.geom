#version 450

layout (points) in;
layout (line_strip, max_vertices = 5) out;

//layout (location = 0) in vec3 geom_color[];

//layout (location = 0) out vec3 frag_color;

void main()
{
    // Emit original vertex
    gl_Position = gl_in[0].gl_Position;
//    frag_color = geom_color[0];
    EmitVertex();

    // Emit vertices forming a cross
    float size = 0.1; // Adjust size of cross as needed
    vec2 offsets[4] = vec2[4](vec2(-size, 0.0), vec2(size, 0.0), vec2(0.0, -size), vec2(0.0, size));
    for (int i = 0; i < 4; ++i) {
        gl_Position = gl_in[0].gl_Position + vec4(offsets[i], 0.0, 0.0);
//        frag_color = geom_color[0];
        EmitVertex();
    }

    EndPrimitive();
}