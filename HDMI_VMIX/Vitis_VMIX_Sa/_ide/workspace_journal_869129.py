# 2026-02-28T18:28:04.122600815
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_VMIX_Sa")

comp = client.create_app_component(name="app_component",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

client.delete_component(name="app_component")

comp = client.create_app_component(name="app_component",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0")

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["/home/serg/Documents/Xilinx/z7000_hdmi/HDMI_VMIX/Vitis_VMIX_Sa/app_component/src/ddynclk"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["/home/serg/Documents/Xilinx/z7000_hdmi/HDMI_VMIX/Vitis_VMIX_Sa/app_component/src/ddynclk/ddynclk.c", "/home/serg/Documents/Xilinx/z7000_hdmi/HDMI_VMIX/Vitis_VMIX_Sa/app_component/src/ddynclk/ddynclk_g.c", "/home/serg/Documents/Xilinx/z7000_hdmi/HDMI_VMIX/Vitis_VMIX_Sa/app_component/src/ddynclk/ddynclk_selftest.c", "/home/serg/Documents/Xilinx/z7000_hdmi/HDMI_VMIX/Vitis_VMIX_Sa/app_component/src/ddynclk/ddynclk_sinit.c"])

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

vitis.dispose()

