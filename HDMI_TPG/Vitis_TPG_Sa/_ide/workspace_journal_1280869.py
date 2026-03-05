# 2026-02-26T21:16:09.381117131
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_TPG_Sa")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

vitis.dispose()

