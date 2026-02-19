# 2026-02-19T13:23:41.311783282
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_VIDEO_SA")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

platform = client.get_component(name="platform")
status = platform.build()

