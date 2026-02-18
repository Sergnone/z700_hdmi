# 2026-02-16T16:21:16.561151360
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisFBWRRD")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

