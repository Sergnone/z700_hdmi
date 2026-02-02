# 2026-02-02T19:17:53.354206844
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisFBR")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

platform = client.get_component(name="platform")
status = platform.build()

status = platform.build()

comp = client.get_component(name="xv_frmbufrd_example")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_FBR/VitisFBR/xv_frmbufrd_example/display_ctrl/display_ctrl.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["../display_ctrl/display_ctrl.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_FBR/VitisFBR/xv_frmbufrd_example/dynclk/dynclk.c"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_FBR/VitisFBR/xv_frmbufrd_example/display_ctrl"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../display_ctrl"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../display_ctrl", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_FBR/VitisFBR/xv_frmbufrd_example/dynclk"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

