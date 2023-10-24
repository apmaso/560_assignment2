set_fml_appmode FPV 

read_file -top execution_unit -format sverilog -sva -vcs {-f ../RTL/filelist +define+INLINE_SVA}

create_clock clk -period 100
create_reset rst_b -sense low

sim_run -stable
sim_save_reset

# Added one assumption for each possible value of req_id
# Suggestion was from the Professor
fvassume -expr {@(posedge clk) disable iff (!rst_b)
	((input_req.req)&&(input_req.req_id==0)) 
	|=> (!(input_req.req&&(input_req.req_id==0)) 
	until_with output_rsp.rsp&&(output_rsp.rsp_id==0))};

fvassume -expr {@(posedge clk) disable iff (!rst_b)
	((input_req.req)&&(input_req.req_id==1)) 
	|=> (!(input_req.req&&(input_req.req_id==1)) 
	until_with output_rsp.rsp&&(output_rsp.rsp_id==1))};

fvassume -expr {@(posedge clk) disable iff (!rst_b)
	((input_req.req)&&(input_req.req_id==2)) 
	|=> (!(input_req.req&&(input_req.req_id==2)) 
	until_with output_rsp.rsp&&(output_rsp.rsp_id==2))};

fvassume -expr {@(posedge clk) disable iff (!rst_b)
	((input_req.req)&&(input_req.req_id==3)) 
	|=> (!(input_req.req&&(input_req.req_id==3)) 
	until_with output_rsp.rsp&&(output_rsp.rsp_id==3))};

fvassume -expr {@(posedge clk) disable iff (!rst_b)
	((input_req.req)&&(input_req.req_id==4)) 
	|=> (!(input_req.req&&(input_req.req_id==4)) 
	until_with output_rsp.rsp&&(output_rsp.rsp_id==4))};

fvassume -expr {@(posedge clk) disable iff (!rst_b)
	((input_req.req)&&(input_req.req_id==5)) 
	|=> (!(input_req.req&&(input_req.req_id==5)) 
	until_with output_rsp.rsp&&(output_rsp.rsp_id==5))};

fvassume -expr {@(posedge clk) disable iff (!rst_b)
	((input_req.req)&&(input_req.req_id==6)) 
	|=> (!(input_req.req&&(input_req.req_id==6)) 
	until_with output_rsp.rsp&&(output_rsp.rsp_id==6))};

fvassume -expr {@(posedge clk) disable iff (!rst_b)
	((input_req.req)&&(input_req.req_id==7)) 
	|=> (!(input_req.req&&(input_req.req_id==7)) 
	until_with output_rsp.rsp&&(output_rsp.rsp_id==7))};
	
#fvassume -expr {@(posedge input_req.req) 
#	input_req.req_id |=> ((input_req.req_id!=$sampled(input_req.req_id))
#	until (output_rsp.rsp_id==$sampled(input_req.req_id)))};
