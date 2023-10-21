set_fml_appmode FPV 
set design execution_unit 

read_file -top execution_unit -format sverilog -sva -vcs {-f ../RTL/filelist}

create_clock clk -period 100
create_reset rst_b -sense low

sim_run -stable
sim_save_reset
