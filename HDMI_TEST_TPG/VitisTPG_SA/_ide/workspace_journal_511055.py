# 2025-12-22T20:49:41.432984942
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisTPG_SA")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

comp = client.create_app_component(name="hello_world",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/display_ctrl"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../display_ctrl", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/dynclk"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/display_ctrl/display_ctrl.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../display_ctrl/display_ctrl.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/dynclk/ddynclk.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/dynclk/ddynclk_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/dynclk/ddynclk_selftest.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/dynclk/ddynclk_sinit.c"])

platform = client.get_component(name="platform")
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

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../display_ctrl"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = [""])

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

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../display_ctrl"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = [""])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../display_ctrl/display_ctrl.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../display_ctrl/display_ctrl.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../display_ctrl/display_ctrl.c", "../dynclk/ddynclk.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../display_ctrl/display_ctrl.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

