# 2026-02-19T13:25:23.664057169
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_VIDEO_SA")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.create_app_component(name="app_component",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0")

status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

