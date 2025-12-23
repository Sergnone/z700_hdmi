# 2025-12-23T12:31:39.173925867
import vitis

client = vitis.create_client()
client.set_workspace(path="VitisTPG_SA")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../top_design_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.create_app_component(name="hello_world",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/fbr_read"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../fbr_read", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/fbr_write"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/fbr_read/xv_frmbufrd.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/fbr_read/xv_frmbufrd_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/fbr_read/xv_frmbufrd_l2.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/fbr_read/xv_frmbufrd_l2_intr.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/fbr_read/xv_frmbufrd_sinit.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../fbr_read/xv_frmbufrd.c", "../fbr_read/xv_frmbufrd_g.c", "../fbr_read/xv_frmbufrd_l2.c", "../fbr_read/xv_frmbufrd_l2_intr.c", "../fbr_read/xv_frmbufrd_sinit.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/fbr_write/xv_frmbufwr.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/fbr_write/xv_frmbufwr_g.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/fbr_write/xv_frmbufwr_l2.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/fbr_write/xv_frmbufwr_l2_intr.c", "/home/serg/Documents/Xilinx/z700_hdmi/HDMI_TEST_TPG/VitisTPG_SA/hello_world/fbr_write/xv_frmbufwr_sinit.c"])

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../fbr_read", "../fbr_write"])

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

comp.set_app_config(key = "USER_UNDEFINED_SYMBOLS", values = ["__clang__"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = ["../fbr_read"])

comp.set_app_config(key = "USER_INCLUDE_DIRECTORIES", values = [""])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../fbr_read/xv_frmbufrd.c", "../fbr_read/xv_frmbufrd_g.c", "../fbr_read/xv_frmbufrd_l2.c", "../fbr_read/xv_frmbufrd_l2_intr.c", "../fbr_read/xv_frmbufrd_sinit.c", "../fbr_write/xv_frmbufwr.c", "../fbr_write/xv_frmbufwr_g.c", "../fbr_write/xv_frmbufwr_l2.c", "../fbr_write/xv_frmbufwr_l2_intr.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../fbr_read/xv_frmbufrd.c", "../fbr_read/xv_frmbufrd_g.c", "../fbr_read/xv_frmbufrd_l2.c", "../fbr_read/xv_frmbufrd_l2_intr.c", "../fbr_read/xv_frmbufrd_sinit.c", "../fbr_write/xv_frmbufwr.c", "../fbr_write/xv_frmbufwr_g.c", "../fbr_write/xv_frmbufwr_l2.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../fbr_read/xv_frmbufrd.c", "../fbr_read/xv_frmbufrd_g.c", "../fbr_read/xv_frmbufrd_l2.c", "../fbr_read/xv_frmbufrd_l2_intr.c", "../fbr_read/xv_frmbufrd_sinit.c", "../fbr_write/xv_frmbufwr.c", "../fbr_write/xv_frmbufwr_g.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../fbr_read/xv_frmbufrd.c", "../fbr_read/xv_frmbufrd_g.c", "../fbr_read/xv_frmbufrd_l2.c", "../fbr_read/xv_frmbufrd_l2_intr.c", "../fbr_read/xv_frmbufrd_sinit.c", "../fbr_write/xv_frmbufwr.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../fbr_read/xv_frmbufrd.c", "../fbr_read/xv_frmbufrd_g.c", "../fbr_read/xv_frmbufrd_l2.c", "../fbr_read/xv_frmbufrd_l2_intr.c", "../fbr_read/xv_frmbufrd_sinit.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../fbr_read/xv_frmbufrd.c", "../fbr_read/xv_frmbufrd_g.c", "../fbr_read/xv_frmbufrd_l2.c", "../fbr_read/xv_frmbufrd_l2_intr.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../fbr_read/xv_frmbufrd.c", "../fbr_read/xv_frmbufrd_g.c", "../fbr_read/xv_frmbufrd_l2.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../fbr_read/xv_frmbufrd.c", "../fbr_read/xv_frmbufrd_g.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c", "../fbr_read/xv_frmbufrd.c"])

comp.set_app_config(key = "USER_COMPILE_SOURCES", values = ["helloworld.c", "platform.c"])

status = platform.build()

comp.build()

status = platform.build()

comp = client.get_component(name="xv_frmbufwr_example")
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

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp = client.get_component(name="xv_frmbufwr_example")
comp.build()

status = platform.build()

status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp = client.get_component(name="xv_frmbufwr_example")
comp.build()

status = platform.build()

status = platform.build()

status = platform.build()

status = platform.build()

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

comp = client.get_component(name="hello_world")
comp.build()

client.delete_component(name="xv_frmbufrd_example")

client.delete_component(name="xv_frmbufwr_example")

client.delete_component(name="componentName")

client.delete_component(name="componentName")

status = platform.build()

comp.build()

status = platform.build()

comp.build()

