# 2026-02-20T12:12:15.898758981
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_VIDEO_Lnx")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

platform = client.get_component(name="platform")
status = platform.build()

status = platform.build()

comp = client.create_app_component(name="linux_hello_world",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "linux_ps7_cortexa9",template = "linux_hello_world")

comp = client.get_component("linux_hello_world")

status = comp.set_sysroot(sysroot="/home/serg/Documents/Xilinx/pLinux/sdk/linsdk/sysroots/cortexa9t2hf-neon-amd-linux-gnueabi")

status = platform.build()

comp = client.get_component(name="linux_hello_world")
comp.build()

client.delete_component(name="linux_hello_world")

comp = client.create_app_component(name="app_component",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "linux_ps7_cortexa9")

comp = client.get_component("app_component")

status = comp.set_sysroot(sysroot="/home/serg/Documents/Xilinx/pLinux/sdk/linsdk/sysroots/cortexa9t2hf-neon-amd-linux-gnueabi")

status = platform.build()

client.delete_component(name="app_component")

status = platform.build()

client.delete_component(name="platform")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

