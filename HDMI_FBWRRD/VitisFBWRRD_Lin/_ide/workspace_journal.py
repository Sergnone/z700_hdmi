# 2026-02-06T18:19:29.866489695
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisFBWRRD_Lin")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

client.delete_component(name="platform")

advanced_options = client.create_advanced_options_dict(board_dtsi=" zc702",dt_overlay="0",dt_zocl="1")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

platform = client.get_component(name="platform")
status = platform.build()

status = platform.build()

client.delete_component(name="platform")

advanced_options = client.create_advanced_options_dict(board_dtsi="zc702",user_dtsi="/home/serg/Documents/Xilinx/z700_hdmi/HDMI_FBWRRD/VitisFBWRRD_Lin/system-user.dtsi",dt_overlay="0")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

status = platform.build()

vitis.dispose()

