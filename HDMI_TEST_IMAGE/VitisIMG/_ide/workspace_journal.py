# 2026-02-03T13:13:58.246761863
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisIMG")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.create_app_component(name="app",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0")

status = platform.build()

comp = client.get_component(name="app")
comp.build()

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

status = platform.build()

comp = client.get_component(name="app")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper1.xsa")

status = platform.build()

status = platform.build()

comp = client.get_component(name="xv_frmbufrd_example")
comp.build()

status = platform.build()

comp = client.get_component(name="app")
comp.build()

client.delete_component(name="platform")

client.delete_component(name="xv_frmbufrd_example")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper1.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

status = platform.build()

status = platform.build()

comp = client.get_component(name="xv_frmbufwr_example")
comp.build()

status = platform.build()

comp = client.get_component(name="app")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp = client.get_component(name="xv_frmbufwr_example")
comp.build()

status = platform.build()

comp = client.get_component(name="app")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp = client.get_component(name="xv_frmbufwr_example")
comp.build()

status = platform.build()

comp = client.get_component(name="app")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp = client.get_component(name="xv_frmbufwr_example")
comp.build()

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

status = platform.build()

comp.build()

status = platform.build()

comp.build()

