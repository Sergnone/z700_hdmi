# 2026-02-18T17:02:49.759918244
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_PR_LNX")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

platform = client.get_component(name="platform")
status = platform.build()

vitis.dispose()

