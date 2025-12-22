# 2025-12-22T20:04:02.282347919
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisTPG")

client.delete_component(name="componentName")

vitis.dispose()

