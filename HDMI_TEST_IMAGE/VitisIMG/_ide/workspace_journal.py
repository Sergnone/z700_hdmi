# 2026-02-03T15:33:57.473021078
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisIMG")

client.delete_component(name="xv_frmbufwr_example_1")

client.delete_component(name="xv_frmbufwr_example_1")

client.delete_component(name="xv_frmbufwr_example")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="xv_frmbufwr_example")
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

