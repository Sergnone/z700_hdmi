# 2026-03-05T12:54:27.060452245
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_AVIDEO_Sa")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

