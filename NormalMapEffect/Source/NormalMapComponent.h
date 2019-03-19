#pragma once
#include "graphics/RenderComponent.h"

class CNormalMapComponent : public hiveRenderEngine::IRenderComponent
{
public:
	CNormalMapComponent();
	virtual ~CNormalMapComponent();

private:
	virtual void __updateShaderUniformsV() override;

	bool m_CheckBoxTag;
};

