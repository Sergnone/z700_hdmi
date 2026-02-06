# 2026-02-06T13:22:57.773185315
import vitis

client = vitis.create_client()
client.set_workspace(path="HDMI_FBWRRD")

status = client.set_preference(level = "WORKSPACE", device = "zynq", key = "sysroot", value = "/home/serg/Documents/Xilinx/pLinux/sdk/zynq_linux/linuximg/sysroots/cortexa9t2hf-neon-amd-linux-gnueabi")

vitis.dispose()

