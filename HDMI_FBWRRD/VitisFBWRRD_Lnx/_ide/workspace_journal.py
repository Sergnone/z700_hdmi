# 2026-02-13T14:38:12.755207879
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisFBWRRD_Lnx")

platform = client.get_component(name="platform")
status = platform.build()

