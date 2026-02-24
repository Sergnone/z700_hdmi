# 2026-02-24T13:59:17.309308986
import vitis

client = vitis.create_client()
client.set_workspace(path="Vitis_TPG_Sa")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

client.delete_component(name="app_component")

comp = client.create_app_component(name="app_component",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0")

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

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers"])

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

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vtc"])

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vtc/xl_vtc_g.c"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers", "drivers/xl_vtc", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_tpg"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_vtc/xl_vtc_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_tpg/xl_tpg_g.c"])

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_vtc/xl_vtc_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_tpg/xl_tpg_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_tpg/xl_tpg_sinit.c"])

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

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers", "drivers/xl_vtc", "drivers/xl_tpg", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vidc"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vidc/xl_vidc.c"])

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

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_vidc/xl_vidc_timing_table.c"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["drivers", "drivers/xl_vtc", "drivers/xl_tpg", "drivers/xl_vidc", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_dynclk"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TPG/Vitis_TPG_Sa/app_component/src/drivers/xl_dynclk/v_dynclk.c"])

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["drivers/xl_tpg/xl_tpg_g.c", "drivers/xl_vtc/xl_vtc_g.c", "drivers/xl_tpg/xl_tpg_sinit.c", "drivers/xl_vidc/xl_vidc.c", "drivers/xl_vidc/xl_vidc_timing_table.c", "drivers/xl_dynclk/xl_dynclk.c"])

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

