# 2026-02-14T21:16:23.680100300
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisVDMA")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

comp = client.get_component(name="hello_world")
comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "../dynclk_orig/dynclk.c", "../display_ctrl/display_ctrl.c", "v_vtc.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../dynclk/ddynclk.c", "../dynclk/ddynclk_g.c", "../dynclk/ddynclk_selftest.c", "../dynclk/ddynclk_sinit.c", "../dynclk_orig/dynclk.c", "../display_ctrl/display_ctrl.c"])

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

