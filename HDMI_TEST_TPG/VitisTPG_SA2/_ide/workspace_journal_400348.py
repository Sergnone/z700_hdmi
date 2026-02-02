# 2026-01-29T20:23:30.155252563
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisTPG_SA2")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform2",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

platform = client.get_component(name="platform2")
status = platform.build()

