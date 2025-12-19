# 2025-12-17T19:03:40.011300339
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis")

platform = client.create_platform_component(name = "hdmi_platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

platform = client.get_component(name="hdmi_platform")
status = platform.build()

comp = client.create_app_component(name="hdmi_tpg",platform = "$COMPONENT_LOCATION/../hdmi_platform/export/hdmi_platform/hdmi_platform.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

status = platform.build()

comp = client.get_component(name="hdmi_tpg")
comp.build()

