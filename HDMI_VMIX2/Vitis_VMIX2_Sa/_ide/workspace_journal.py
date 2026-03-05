# 2026-03-05T21:19:49.792898354
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_VMIX2_Sa")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.create_app_component(name="app_component",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0")

comp = client.get_component(name="app_component")
comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VMIX2/Vitis_VMIX2_Sa/app_component/src/ddynclk"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VMIX2/Vitis_VMIX2_Sa/app_component/src/ddynclk/ddynclk.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VMIX2/Vitis_VMIX2_Sa/app_component/src/ddynclk/ddynclk_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VMIX2/Vitis_VMIX2_Sa/app_component/src/ddynclk/ddynclk_selftest.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VMIX2/Vitis_VMIX2_Sa/app_component/src/ddynclk/ddynclk_sinit.c"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

