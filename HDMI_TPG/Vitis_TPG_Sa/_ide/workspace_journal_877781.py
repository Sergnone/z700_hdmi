# 2026-02-24T18:15:13.246574153
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_TPG_Sa")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/include", "drivers", "drivers/xl_vidc", "drivers/xl_tpg", "drivers/xl_vtc", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vidc"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "drivers/xl_vtc/xl_vtc_g.c"])

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

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "drivers/xl_vtc/xl_vtc_g.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "drivers/xl_vtc/xl_vtc_g.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_vidc/xl_vidc_timing_table.c", "drivers/xl_vtc/xl_vtc_g.c"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers", "drivers/xl_vidc", "drivers/xl_tpg", "drivers/xl_vtc", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vidc"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/xl_vidc", "drivers/xl_tpg", "drivers/xl_vtc"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/xl_tpg", "drivers/xl_vtc"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/xl_vtc"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = [""])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/include"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/include", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_tpg"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/include", "drivers/xl_tpg", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vidc"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers/include", "drivers/xl_tpg", "drivers/xl_vidc", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vtc"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_vtc/xl_vtc_g.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = [""])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_tpg/xl_tpg_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_tpg/xl_tpg_sinit.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vidc/xl_vidc.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vidc/xl_vidc_timing_table.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vtc/xl_vtc.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vtc/xl_vtc_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vtc/xl_vtc_sinit.c"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "drivers/xl_vtc/xl_vtc.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_vtc/xl_vtc_sinit.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_tpg/xl_tpg.c"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

