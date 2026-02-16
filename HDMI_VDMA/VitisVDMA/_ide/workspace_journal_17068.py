# 2026-02-14T19:12:22.771667300
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisVDMA")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

vitis.dispose()

