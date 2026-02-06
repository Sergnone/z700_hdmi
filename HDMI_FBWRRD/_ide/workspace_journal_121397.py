# 2026-02-05T12:12:12.346798508
import vitis

client = vitis.create_client()
client.set_workspace(path="HDMI_FBWRRD")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

client.delete_component(name="app_component")

client.delete_component(name="platform")

vitis.dispose()

