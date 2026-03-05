# 2026-03-02T11:30:59.146543228
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_VMIX_Sa")

client.delete_component(name="xv_mix_example")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

