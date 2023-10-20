set_fml_appmode FXP 

read_file -top execution_unit -format sverilog -vcs {-f ../RTL/filelist}

set_fml_var fxp_compute_rootcause_auto true

create_clock clk -period 100 
create_reset rst_b -sense low

sim_run -stable
sim_save_reset

fxp_generate

