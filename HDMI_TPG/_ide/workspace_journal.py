# 2026-02-06T13:05:34.559552440
import vitis

client = vitis.create_client()
client.set_workspace(path="HDMI_TPG")

proj = client.create_sys_project(name="system_project", platform="$COMPONENT_LOCATION/../../HDMI_FBWR/top_design_wrapper.xsa", template="empty_accelerated_application" , build_output_type="xsa")

proj = client.create_sys_project(name="system_project", platform="$COMPONENT_LOCATION/../../HDMI_VDMA/top_design_wrapper.xsa", template="empty_accelerated_application" , build_output_type="xsa")

vitis.dispose()

