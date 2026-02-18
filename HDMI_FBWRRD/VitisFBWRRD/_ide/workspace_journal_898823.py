# 2026-02-17T11:44:33.632994187
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

vitis.dispose()

