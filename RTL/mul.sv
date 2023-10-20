
module mul (
    input logic clk,
	input logic rst_b,
    input logic mul_req,
	input logic [2:0] mul_req_id,
	input logic [63:0] mul_data1,
	input logic [63:0] mul_data2,
	input logic grant,
	
	output logic mul_rsp,
	output logic [2:0] mul_rsp_id,
	output logic [63:0] mul_rsp_data,
	output logic mul_free
	
);

//flop the input req twice
logic mul_req_q;
logic [2:0] mul_req_id_q;
logic [63:0] mul_data1_q, mul_data2_q;
logic mul_req_q2;
logic [2:0] mul_req_id_q2;
logic [63:0] mul_data1_q2, mul_data2_q2;

logic mul_rsp_prev;
logic [2:0] mul_rsp_id_prev;
logic [128:0] mul_rsp_data_prev;

always_ff @(posedge clk or negedge rst_b) begin
    if(!rst_b) begin
	    mul_free <= 1'b1;
		mul_req_q <= '0;
		mul_req_q2 <= '0;
		mul_rsp <= '0;
		mul_rsp_id <= '0;
		mul_rsp_data <= '0;
		mul_rsp_prev <= '0;
	end else begin
	    if(mul_req) mul_free <= 1'b0;
	    
	    mul_req_q <= mul_req;
		mul_req_id_q <= mul_req_id;
		mul_data1_q <= mul_data1;
		mul_data2_q <= mul_data2;
		
		mul_req_q2 <= mul_req_q;
		mul_req_id_q2 <= mul_req_id_q;
		mul_data1_q2 <= mul_data1_q;
		mul_data2_q2 <= mul_data2_q;

		mul_rsp_prev <= mul_req_q2;
		mul_rsp_id_prev <= mul_req_id_q2;
		mul_rsp_data_prev <= (mul_data1_q2 * mul_data2_q2);
		
		if(grant) begin
		    mul_free <= 1'b1;
			mul_rsp <= 0;
			mul_rsp_id <= '0;
			mul_rsp_data <= '0;
		end else begin
			if(mul_rsp_prev) begin
				mul_rsp <= 1'b1;
				mul_rsp_id <= mul_rsp_id_prev;
				mul_rsp_data <= mul_rsp_data_prev[63:0];
			end
		end	
    end
end


endmodule
