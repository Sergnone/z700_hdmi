# 2026-02-16T04:49:36.571315900
import vitis

client = vitis.create_client()
client.set_workspace(path="VITIS_FBWRRD_Lnx")

component = client.get_component(name="platform")

lscript = component.get_ld_script(path="C:\Users\Sergey\Documents\Xilinx\z7000_hdmi\HDMI_FBWRRD\VITIS_FBWRRD_Lnx\platform\zynq_fsbl\lscript.ld")

lscript.update_memory_region("ps7_ram_0_S_AXI_BASEADDR", "0x00000000", "0x40000000")

platform = client.get_component(name="platform")
status = platform.build()

status = platform.build()

status = platform.build()

lscript.add_memory_region("new_memory_0", "0x0000", "0x8000")

vitis.dispose()

