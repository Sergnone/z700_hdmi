# 2026-02-25T12:36:53.509938108
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_VIDEO_SA")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

status = platform.build()

comp.build()

