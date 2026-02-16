# 2026-02-14T19:17:06.853944900
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisVDMA")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

comp = client.create_app_component(name="app_component",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0")

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "../dynclk_orig/dynclk.c", "../display_ctrl/display_ctrl.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/src/v_vtc.c"])

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

client.delete_component(name="app_component")

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
comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["v_dma.c", "v_tpg.c", "helloworld.c", "platform.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "../dynclk_orig/dynclk.c", "../display_ctrl/display_ctrl.c", "v_vtc.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/src/v_dma.c"])

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["v_dma.c", "v_tpg.c", "helloworld.c", "platform.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "../dynclk_orig/dynclk.c", "../display_ctrl/display_ctrl.c", "v_vtc.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/src/v_dma.c"])

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["v_dma.c", "v_tpg.c", "helloworld.c", "platform.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "../dynclk_orig/dynclk.c", "../display_ctrl/display_ctrl.c", "v_vtc.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["v_dma.c", "v_tpg.c", "helloworld.c", "platform.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "../dynclk_orig/dynclk.c", "../display_ctrl/display_ctrl.c", "v_vtc.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["v_dma.c", "helloworld.c", "platform.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "../dynclk_orig/dynclk.c", "../display_ctrl/display_ctrl.c", "v_vtc.c"])

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["v_vdma.c", "helloworld.c", "platform.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "../dynclk_orig/dynclk.c", "../display_ctrl/display_ctrl.c", "v_vtc.c"])

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../dynclk", "../dynclk_orig", "../display_ctrl"])

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

vitis.dispose()

