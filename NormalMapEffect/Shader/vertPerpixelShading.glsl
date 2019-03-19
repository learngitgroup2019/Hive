#version 430 core

uniform mat4 hive_ModelMatrix;
uniform mat4 hive_ViewMatrix;
uniform mat4 hive_ProjectionMatrix;
uniform mat4 hive_NormalMatrix;

layout (location = 0) in vec3 _inVertexPosition;
layout (location = 1) in vec3 _inVertexNormal;
layout (location = 2) in vec2 _inVertexTexCoord;
layout (location = 3) in vec3 _inVertexTangent;
layout (location = 4) in vec3 _inVertexBitangent;

out vec3 _NormalW;
out vec2 _TexCoord;
out mat3 _TBN;

void main()
{
	gl_Position = hive_ProjectionMatrix * hive_ViewMatrix * hive_ModelMatrix * vec4(_inVertexPosition, 1.0);

	_NormalW = normalize(vec3(mat3(hive_NormalMatrix) * _inVertexNormal));
	_TexCoord = _inVertexTexCoord;

	vec3 T = normalize(vec3(hive_ModelMatrix * vec4(_inVertexTangent, 0.0f)));
	vec3 B = normalize(vec3(hive_ModelMatrix * vec4(_inVertexBitangent, 0.0f)));
	vec3 N = normalize(vec3(hive_ModelMatrix * vec4(_inVertexNormal, 0.0f)));
	_TBN = mat3(T, B, N);
}