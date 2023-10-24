
module execution_unit (
input logic clk,
input logic rst_b,
input req_pkt_type input_req,

output fifo_full,
output rsp_pkt_type output_rsp );

//fifo signals
logic write_in, read;
req_pkt_type output_req;

//alu unit signals
logic mul_req, mul_rsp, mul_grant, mul_free;
logic [2:0] mul_req_id, mul_rsp_id;
logic [63:0] mul_rsp_data;
logic add_req, add_rsp, add_grant, add_free;
logic [2:0] add_req_id, add_rsp_id;
logic [63:0] add_rsp_data;

//rr arbiter signals
logic [1:0] rr_req;
logic [1:0] rr_grant;
assign write_in = input_req.req;
inp_fifo i_inp_fifo(.clk(clk), .rst_b(rst_b), .write_in(write_in), .read(read), .input_req(input_req), .output_req(output_req), .fifo_full(fifo_full));
assign read = output_req.req && (mul_req || add_req);

assign mul_req = output_req.req && (output_req.req_type == 1'b1) && mul_free;
mul i_mul (
.clk(clk), .rst_b(rst_b), 
.mul_req(mul_req),
.mul_req_id(output_req.req_id),
.mul_data1(output_req.req_data1),
.mul_data2(output_req.req_data2),
.grant(mul_grant),
.mul_rsp(mul_rsp),
.mul_rsp_id(mul_rsp_id),
.mul_rsp_data(mul_rsp_data),
.mul_free(mul_free)
);

assign add_req = output_req.req && (output_req.req_type == 1'b0) && add_free;
add i_add (
.clk(clk), .rst_b(rst_b), 
.add_req(add_req),
.add_req_id(output_req.req_id),
.add_data1(output_req.req_data1),
.add_data2(output_req.req_data2),
.grant(add_grant),
.add_rsp(add_rsp),
.add_rsp_id(add_rsp_id),
.add_rsp_data(add_rsp_data),
.add_free(add_free)
);

assign rr_req = {mul_rsp, add_rsp};
assign mul_grant = rr_grant[1];
assign add_grant = rr_grant[0];
round_robin_arbiter #(.NUM_OF_INPS(2)) i_rr_arb(.clk(clk), .rst_b(rst_b), .request(rr_req), .grant(rr_grant));

assign output_rsp.rsp = |rr_grant;
assign output_rsp.rsp_id = rr_grant[1] ? mul_rsp_id : rr_grant[0] ? add_rsp_id : '0;
assign output_rsp.rsp_data = rr_grant[1] ? mul_rsp_data : rr_grant[0] ? add_rsp_data : '0;

// Inline SVA Assertions
`ifdef INLINE_SVA

// assumptions
fifo_full_no_req: assume property(
	@(posedge clk) disable iff (!rst_b)
	(fifo_full) |-> (input_req==0));

toggle_reset: assume property(
	@(1) clk |-> (rst_b==0 ##[1:$] rst_b==1));
	
// assertions	
input_id_output_id: assert property(
	@(posedge clk) disable iff (!rst_b)
	((input_req.req) && (input_req.req_id)) |-> s_eventually (output_rsp.rsp_id==$sampled(input_req.req_id)));

req_to_write_in: assert property(
	@(posedge clk) disable iff (!rst_b)
	(!input_req.req) |-> (!write_in));

output_req_to_add: assert property(
	@(posedge clk) disable iff (!rst_b)
	 (output_req.req && (output_req.req_type == 1'b0) && add_free)|-> (read));

output_req_to_mul: assert property(
	@(posedge clk) disable iff (!rst_b)
	 (output_req.req && (output_req.req_type == 1'b1) && mul_free)|-> (read));

`endif


endmodule
