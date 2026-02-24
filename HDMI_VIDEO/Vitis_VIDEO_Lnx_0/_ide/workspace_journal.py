# 2026-02-20T17:16:13.917519856
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_VIDEO_Lnx_0")

platform = client.get_component(name="platform")
status = platform.build()

vitis.dispose()

