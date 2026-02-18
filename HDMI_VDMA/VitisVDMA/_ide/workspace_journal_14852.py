# 2026-02-14T23:12:41.208078
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisVDMA")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="hello_world")
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

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform1",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

client.delete_component(name="platform1")

client.delete_component(name="platform1")

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../dynclk", "../display_ctrl"])

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["v_dynclk.c", "helloworld.c", "platform.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "../display_ctrl/display_ctrl.c", "v_vdma.c", "v_vtc.c"])

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../display_ctrl"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../display_ctrl", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/dynclk"])

status = platform.build()

comp = client.get_component(name="hello_world")
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

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["v_ddynclk.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/dynclk/ddynclk.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/dynclk/ddynclk_g.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/dynclk/ddynclk_selftest.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/dynclk/ddynclk_sinit.c"])

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["v_ddynclk.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/display_ctrl/display_ctrl.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["v_ddynclk.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "../display_ctrl/display_ctrl.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/src/helloworld.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/src/platform.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/src/v_vdma.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/src/v_vtc.c"])

status = platform.build()

comp = client.get_component(name="hello_world")
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

vitis.dispose()

