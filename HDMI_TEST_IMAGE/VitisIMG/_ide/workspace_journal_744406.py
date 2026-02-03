# 2026-02-03T15:33:12.984750109
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisIMG")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="xv_frmbufwr_example_1")
comp.build()

vitis.dispose()

