set_fml_appmode FPV 

read_file -top execution_unit -format sverilog -sva -vcs {-f ../RTL/filelist +define+INLINE_SVA}

create_clock clk -period 100
create_reset rst_b -sense low

sim_run -stable
sim_save_reset



fvassume -expr {@(posedge execution_unit.clk)&&(input_req.req) let a=input_req.req_id 
		|=> (!input_req.req)||(input_req.req_id!=a)) until (output_rsp.rsp_id==a)}
