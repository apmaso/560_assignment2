set_fml_appmode AEP
set_app_var match_severity_for_builtins true
read_file -top execution_unit -format sverilog -aep all -sva \
    -vcs {-f ../RTL/filelist +define+INLINE_SVA}

create_clock clk -period 100 
create_reset rst_b -sense low

sim_run -stable
sim_save_reset

