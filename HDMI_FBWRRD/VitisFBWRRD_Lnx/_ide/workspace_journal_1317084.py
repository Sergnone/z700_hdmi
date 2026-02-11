# 2026-02-11T11:45:40.557047664
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisFBWRRD_Lnx")

client.delete_component(name="platform")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper_02.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

platform = client.get_component(name="platform")
status = platform.build()

vitis.dispose()

