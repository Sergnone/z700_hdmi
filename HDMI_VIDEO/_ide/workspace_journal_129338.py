# 2026-02-25T12:09:33.752549424
import vitis

client = vitis.create_client()
client.set_workspace(path="HDMI_VIDEO")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

