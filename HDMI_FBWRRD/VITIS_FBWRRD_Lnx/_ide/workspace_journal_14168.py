# 2026-02-15T10:57:16.753436100
import vitis

client = vitis.create_client()
client.set_workspace(path="VITIS_FBWRRD_Lnx")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

vitis.dispose()

