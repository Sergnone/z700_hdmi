# 2026-02-10T13:34:05.521399122
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisFBWRRD_Lnx")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper_01.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

platform = client.get_component(name="platform")
status = platform.build()

