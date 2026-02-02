# 2026-02-02T14:51:15.210264808
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisTPG_SA2")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="xv_frmbufrd_example")
comp.build()

client.delete_component(name="main")

client.delete_component(name="xv_frmbufwr_example")

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

