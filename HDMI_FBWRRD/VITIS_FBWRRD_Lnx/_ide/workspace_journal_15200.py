# 2026-02-15T11:06:48.318590100
import vitis

client = vitis.create_client()
client.set_workspace(path="VITIS_FBWRRD_Lnx")

platform = client.get_component(name="platform")
status = platform.build()

vitis.dispose()

