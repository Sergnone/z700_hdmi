# 2026-02-14T22:23:22.145604100
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisVDMA")

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "../dynclk_orig/dynclk.c", "../display_ctrl/display_ctrl.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/src/v_vdma.c", "C:/Users/Sergey/Documents/Xilinx/z7000_hdmi/HDMI_VDMA/VitisVDMA/hello_world/src/v_vtc.c"])

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

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

