#version 430 core

uniform sampler2D uTextureDiffuse0;
uniform sampler2D uTextureNormal0;
uniform sampler2D uTextureSpecular0;

uniform vec3 uLightDirectionW = vec3(0.0f, 0.0f, 1.0f);
uniform vec3 uLightAmbient = vec3(0.6f, 0.6f, 0.6f);
uniform vec3 uLightDiffuse = vec3(0.9f, 0.9f, 0.9f);

uniform float uUseNormalMap = 1.0;

in vec3 _NormalW;
in vec2 _TexCoord;
in mat3 _TBN;

out vec4 _outFragColor;

void main()
{
	vec3 MaterialDiffuse = texture(uTextureDiffuse0, _TexCoord).rgb;
	vec3 AmbientColor = uLightAmbient * MaterialDiffuse;
	_outFragColor = vec4(AmbientColor, 1.0f);

	vec3 Normal;
	if (uUseNormalMap > 0.5f)
	{
		Normal = texture(uTextureNormal0, _TexCoord).xyz;
		Normal = normalize(Normal * 2.0f - 1.0f);
		Normal = normalize(_TBN * Normal);
	}
	else
	{
		Normal = _NormalW;
	}

	float t = max(dot(normalize(uLightDirectionW), Normal), 0);
	vec3 DiffuseColor = uLightDiffuse * MaterialDiffuse * t;
	_outFragColor.xyz += DiffuseColor;

	if (gl_FragCoord.x < 512)
	{
		_outFragColor.xyz = Normal;
	}
}


test test test