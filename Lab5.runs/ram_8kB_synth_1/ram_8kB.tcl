# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/fu6315ma-s/eitf35-lab4/Lab4.cache/wt [current_project]
set_property parent.project_path C:/Users/fu6315ma-s/eitf35-lab4/Lab4.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:nexys4:part0:1.1 [current_project]
read_ip -quiet C:/Users/fu6315ma-s/eitf35-lab4/Lab4.srcs/sources_1/ip/ram_8kB/ram_8kB.xci
set_property is_locked true [get_files C:/Users/fu6315ma-s/eitf35-lab4/Lab4.srcs/sources_1/ip/ram_8kB/ram_8kB.xci]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top ram_8kB -part xc7a100tcsg324-1 -mode out_of_context

rename_ref -prefix_all ram_8kB_

write_checkpoint -force -noxdef ram_8kB.dcp

catch { report_utilization -file ram_8kB_utilization_synth.rpt -pb ram_8kB_utilization_synth.pb }

if { [catch {
  file copy -force C:/Users/fu6315ma-s/eitf35-lab4/Lab4.runs/ram_8kB_synth_1/ram_8kB.dcp C:/Users/fu6315ma-s/eitf35-lab4/Lab4.srcs/sources_1/ip/ram_8kB/ram_8kB.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub C:/Users/fu6315ma-s/eitf35-lab4/Lab4.srcs/sources_1/ip/ram_8kB/ram_8kB_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub C:/Users/fu6315ma-s/eitf35-lab4/Lab4.srcs/sources_1/ip/ram_8kB/ram_8kB_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim C:/Users/fu6315ma-s/eitf35-lab4/Lab4.srcs/sources_1/ip/ram_8kB/ram_8kB_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim C:/Users/fu6315ma-s/eitf35-lab4/Lab4.srcs/sources_1/ip/ram_8kB/ram_8kB_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir C:/Users/fu6315ma-s/eitf35-lab4/Lab4.ip_user_files/ip/ram_8kB]} {
  catch { 
    file copy -force C:/Users/fu6315ma-s/eitf35-lab4/Lab4.srcs/sources_1/ip/ram_8kB/ram_8kB_stub.v C:/Users/fu6315ma-s/eitf35-lab4/Lab4.ip_user_files/ip/ram_8kB
  }
}

if {[file isdir C:/Users/fu6315ma-s/eitf35-lab4/Lab4.ip_user_files/ip/ram_8kB]} {
  catch { 
    file copy -force C:/Users/fu6315ma-s/eitf35-lab4/Lab4.srcs/sources_1/ip/ram_8kB/ram_8kB_stub.vhdl C:/Users/fu6315ma-s/eitf35-lab4/Lab4.ip_user_files/ip/ram_8kB
  }
}