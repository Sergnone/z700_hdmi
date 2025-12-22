# 2025-12-22T19:24:41.986955404
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisTPG")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.create_app_component(name="hello_world",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/hello_world/dynclk"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/hello_world/dynclk/ddynclk.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/hello_world/dynclk/ddynclk_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/hello_world/dynclk/ddynclk_selftest.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/hello_world/dynclk/ddynclk_sinit.c"])

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

comp = client.get_component(name="vtc_selftest_example")
comp.build()

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../dynclk", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/hello_world/display_ctrl"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG/hello_world/display_ctrl/display_ctrl.c"])

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

