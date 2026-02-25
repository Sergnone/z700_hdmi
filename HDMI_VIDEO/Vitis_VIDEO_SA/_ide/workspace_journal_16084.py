# 2026-02-24T20:13:42.357070907
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_VIDEO_SA")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/include"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/include", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_dynclk"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/include", "drivers/xl_dynclk", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_tpg"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/include", "drivers/xl_dynclk", "drivers/xl_tpg", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vidc"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/include", "drivers/xl_dynclk", "drivers/xl_tpg", "drivers/xl_vidc", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vtc"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["main.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_dynclk/xl_dynclk.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_dynclk/xl_dynclk_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_dynclk/xl_dynclk_selftest.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_dynclk/xl_dynclk_sinit.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["main.c", "drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_tpg/xl_tpg.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_tpg/xl_tpg_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_tpg/xl_tpg_sinit.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["main.c", "drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "drivers/xl_tpg/xl_tpg.c", "drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vidc/xl_vidc.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vidc/xl_vidc_timing_table.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["main.c", "drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "drivers/xl_tpg/xl_tpg.c", "drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vtc/xl_vtc.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vtc/xl_vtc_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vtc/xl_vtc_sinit.c"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/include", "drivers/xl_dynclk", "drivers/xl_tpg", "drivers/xl_vidc", "drivers/xl_vtc"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/include", "drivers/xl_dynclk", "drivers/xl_tpg", "drivers/xl_vidc", "drivers/xl_vtc", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_gpio"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_gpio/xl_gpios.c", "main.c", "drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "drivers/xl_tpg/xl_tpg.c", "drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "drivers/xl_vtc/xl_vtc.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_vtc/xl_vtc_sinit.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_gpio/xl_gpios.c"])

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_gpio/xl_gpios.c", "main.c", "drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "drivers/xl_tpg/xl_tpg.c", "drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "drivers/xl_vtc/xl_vtc.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_vtc/xl_vtc_sinit.c"])

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_gpio/xl_gpios.c", "main.c", "drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "drivers/xl_tpg/xl_tpg.c", "drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "drivers/xl_vtc/xl_vtc.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_vtc/xl_vtc_sinit.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_gpio/xl_gpios.c", "main.c", "drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "drivers/xl_tpg/xl_tpg.c", "drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "drivers/xl_vtc/xl_vtc.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_vtc/xl_vtc_sinit.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_gpio/xl_gpios.c", "main.c", "drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "drivers/xl_tpg/xl_tpg.c", "drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "drivers/xl_vtc/xl_vtc.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_vtc/xl_vtc_sinit.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_gpio/xl_gpios.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_gpio/xl_gpios.c", "main.c", "drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "drivers/xl_tpg/xl_tpg.c", "drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "drivers/xl_vtc/xl_vtc.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_vtc/xl_vtc_sinit.c"])

status = platform.build()

comp.build()

client.delete_component(name="app_component")

comp = client.create_app_component(name="app_component",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0")

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_dynclk"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/xl_dynclk", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_gpio"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/xl_dynclk", "drivers/xl_gpio", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_tpg"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/xl_dynclk", "drivers/xl_gpio", "drivers/xl_tpg", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vtc"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/xl_dynclk", "drivers/xl_gpio", "drivers/xl_tpg", "drivers/xl_vtc", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vidc"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/xl_dynclk", "drivers/xl_gpio", "drivers/xl_tpg", "drivers/xl_vtc", "drivers/xl_vidc", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/include"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_dynclk/xl_dynclk.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_dynclk/xl_dynclk_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_dynclk/xl_dynclk_selftest.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_dynclk/xl_dynclk_sinit.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_gpio/xl_gpios.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "drivers/xl_gpio/xl_gpios.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_tpg/xl_tpg.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_tpg/xl_tpg_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_tpg/xl_tpg_sinit.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "drivers/xl_gpio/xl_gpios.c", "drivers/xl_tpg/xl_tpg.c", "drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vtc/xl_vtc.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vtc/xl_vtc_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vtc/xl_vtc_sinit.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "drivers/xl_gpio/xl_gpios.c", "drivers/xl_tpg/xl_tpg.c", "drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vtc/xl_vtc.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_vtc/xl_vtc_sinit.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vidc/xl_vidc.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_vidc/xl_vidc_timing_table.c"])

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

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/xl_dynclk", "drivers/xl_gpio", "drivers/xl_tpg", "drivers/xl_vtc", "drivers/xl_vidc", "drivers/include", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_interrupts"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_dynclk/xl_dynclk.c", "drivers/xl_dynclk/xl_dynclk_g.c", "drivers/xl_dynclk/xl_dynclk_selftest.c", "drivers/xl_dynclk/xl_dynclk_sinit.c", "drivers/xl_gpio/xl_gpios.c", "drivers/xl_tpg/xl_tpg.c", "drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vtc/xl_vtc.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_vtc/xl_vtc_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_VIDEO/Vitis_VIDEO_SA/app_component/src/drivers/xl_interrupts/xl_interrupt_wrap.c"])

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

vitis.dispose()

