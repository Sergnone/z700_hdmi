# 2025-12-22T20:04:36.326685163
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisTPG")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "freertos",cpu = "ps7_cortexa9_0",domain_name = "freertos_ps7_cortexa9_0")

vitis.dispose()

