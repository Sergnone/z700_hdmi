# 2026-02-02T18:53:06.240349565
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisVDMA")

platform = client.get_component(name="platform")
status = platform.build()

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../dynclk", "../display_ctrl"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

