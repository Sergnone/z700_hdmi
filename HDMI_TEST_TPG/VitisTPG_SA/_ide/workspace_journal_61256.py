# 2025-12-24T11:18:48.825400284
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisTPG_SA")

client.delete_component(name="platform")

vitis.dispose()

