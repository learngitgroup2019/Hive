#include "NormalMapComponent.h"
#include "common/ProductFactory.h"
#include "graphics/RenderPass.h"
#include "graphics/RenderEngineInterface.h"

hiveOO::CProductFactory<CNormalMapComponent> theCreator("NORMAL_MAP_COMPONET");

CNormalMapComponent::CNormalMapComponent() : m_CheckBoxTag(true)
{
}

CNormalMapComponent::~CNormalMapComponent()
{
}

//************************************************************************
//Function:
void CNormalMapComponent::__updateShaderUniformsV()
{
	hiveRenderEngine::IRenderPass *pPass = _findRenderPass("perpixel_shading");
	_ASSERTE(pPass);
	hiveRenderEngine::hiveDumpWidgetBoolValue("GUI.xml|widget_set|checkbox_1", &m_CheckBoxTag);
	pPass->updateShaderUniform("uUseNormalMap", m_CheckBoxTag);
}