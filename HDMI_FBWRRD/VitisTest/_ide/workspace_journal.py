# 2026-02-11T19:01:24.142893296
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisTest")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper_02.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

platform = client.get_component(name="platform")
status = platform.build()

