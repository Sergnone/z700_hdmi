# 2026-02-05T12:07:45.947523729
import vitis

client = vitis.create_client()
client.set_workspace(path="HDMI_FBWRRD")

client.delete_component(name="xv_frmbufrd_example")

platform = client.get_component(name="platform")
status = platform.build()

status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

status = platform.build()

comp.build()

vitis.dispose()

