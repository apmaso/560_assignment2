
module add (
    input logic clk,
	input logic rst_b,
    input logic add_req,
	input logic [2:0] add_req_id,
	input logic [63:0] add_data1,
	input logic [63:0] add_data2,
	input logic grant,
	
	output logic add_rsp,
	output logic [2:0] add_rsp_id,
	output logic [63:0] add_rsp_data,
	output logic add_free
	
);

//flop the input req
logic add_req_q;
logic [2:0] add_req_id_q;
logic [63:0] add_data1_q, add_data2_q;

logic add_rsp_prev;
logic [2:0] add_rsp_id_prev;
logic [64:0] add_rsp_data_prev;

always_ff @(posedge clk or negedge rst_b) begin
    if(!rst_b) begin
	    add_free <= 1'b1;
		add_rsp <= '0;
		add_rsp_id <= '0;
		add_rsp_data <= '0;
		add_rsp_prev <= '0;
		add_req_q <= '0;
	end else 
	begin
	    if(add_req) add_free <= 1'b0;
	    
	    add_req_q <= add_req;
		add_req_id_q <= add_req_id;
		add_data1_q <= add_data1;
		add_data2_q <= add_data2;
		
		add_rsp_prev <= add_req_q;
		add_rsp_id_prev <= add_req_id_q;
		add_rsp_data_prev <= (add_data1_q + add_data2_q);
		
		if(grant) begin
		    add_free <= 1'b1;
			add_rsp <= 0;
			add_rsp_id <= '0;
			add_rsp_data <= '0;
		end else begin
			if(add_rsp_prev) begin
				add_rsp <= 1'b1;
				add_rsp_id <= add_rsp_id_prev;
				add_rsp_data <= add_rsp_data_prev[63:0];
			end
		end	
    end
end



endmodule
