# 2026-02-06T12:17:31.336779408
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisFBWRRD")

comp = client.create_app_component(name="linux_hello_world",platform = "$COMPONENT_LOCATION/../platform2/export/platform2/platform2.xpfm",domain = "linux_ps7_cortexa9",template = "linux_hello_world",use_sysroot_toolchain = True)

comp = client.get_component("linux_hello_world")

status = comp.set_sysroot(sysroot="/home/serg/Documents/Xilinx/pLinux/sdk/zynq_linux/linuximg/sysroots/cortexa9t2hf-neon-amd-linux-gnueabi")

platform = client.get_component(name="platform2")
status = platform.build()

comp = client.get_component(name="linux_hello_world")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

platform = client.get_component(name="platform")
status = platform.build()

status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

platform = client.get_component(name="platform2")
status = platform.build()

status = platform.build()

comp = client.get_component(name="linux_hello_world")
comp.build()

vitis.dispose()

