# 2025-12-22T20:10:54.773837471
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisTPG")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "freertos",cpu = "ps7_cortexa9_0",domain_name = "freertos_ps7_cortexa9_0")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.create_app_component(name="freertos_hello_world",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "freertos_ps7_cortexa9_0",template = "freertos_hello_world")

status = platform.build()

comp = client.get_component(name="freertos_hello_world")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/freertos_hello_world/display_ctrl"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../display_ctrl", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/freertos_hello_world/dynclk"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["freertos_hello_world.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/freertos_hello_world/display_ctrl/display_ctrl.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["freertos_hello_world.c", "../display_ctrl/display_ctrl.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/freertos_hello_world/dynclk/ddynclk.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/freertos_hello_world/dynclk/ddynclk_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/freertos_hello_world/dynclk/ddynclk_selftest.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/freertos_hello_world/dynclk/ddynclk_sinit.c"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

