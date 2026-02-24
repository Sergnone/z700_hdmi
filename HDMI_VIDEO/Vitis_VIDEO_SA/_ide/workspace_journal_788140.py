# 2026-02-20T16:27:21.040365727
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_VIDEO_SA")

platform = client.get_component(name="platform")
status = platform.build()

vitis.dispose()

