# 2026-02-20T16:18:34.756993422
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_VIDEO_Lnx")

comp = client.create_library_component(name="library_component",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "linux_ps7_cortexa9")

platform = client.get_component(name="platform")
status = platform.build()

status = platform.build()

vitis.dispose()

