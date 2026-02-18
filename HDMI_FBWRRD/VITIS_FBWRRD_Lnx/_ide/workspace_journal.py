# 2026-02-16T13:08:07.399417347
import vitis

client = vitis.create_client()
client.set_workspace(path="VITIS_FBWRRD_Lnx")

component = client.get_component(name="platform")

lscript = component.get_ld_script(path="/home/serg/Documents/Xilinx/z700_hdmi/HDMI_FBWRRD/VITIS_FBWRRD_Lnx/platform/zynq_fsbl/lscript.ld")

lscript.update_memory_region("ps7_ram_0_S_AXI_BASEADDR", "0x00000000", "0x00040000")

platform = client.get_component(name="platform")
status = platform.build()

client.delete_component(name="platform")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "linux",cpu = "ps7_cortexa9",domain_name = "linux_ps7_cortexa9",advanced_options = advanced_options)

lscript.update_memory_region("ps7_ram_0_S_AXI_BASEADDR", "0x00000000", "0x00040000")

status = platform.build()

status = platform.build()

