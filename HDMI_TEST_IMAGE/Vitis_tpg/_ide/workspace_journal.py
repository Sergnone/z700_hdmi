# 2026-02-03T18:11:43.883963072
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_tpg")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_tpg")
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

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

