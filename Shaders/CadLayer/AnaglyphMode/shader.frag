#version 450

layout (binding = 0) uniform sampler2D texSampler;
layout (binding = 1) uniform sampler2D texFrustumSampler;


layout (location = 0) in vec2 fragTexCoord;
layout (location = 0) out vec4 outColor;

void main()
{
    float r = texture(texSampler, fragTexCoord).r;
    float g = texture(texFrustumSampler, fragTexCoord).g;
    float b = texture(texFrustumSampler, fragTexCoord).b;

    outColor = vec4(r, g, b, 1.0);
}