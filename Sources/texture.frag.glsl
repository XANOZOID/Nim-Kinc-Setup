#version 450

uniform sampler2D texsampler;
in vec2 texcoord;
out vec4 FragColor;

void main() {
	//vec4 color = texture(texsampler, texcoord);
	FragColor = texture(texsampler, texcoord);// vec4(color.r, color.g, color.b, color.a);
}
