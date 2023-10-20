module round_robin_arbiter
#(
	NUM_OF_INPS = 4
	) (
	input logic clk,
	input logic rst_b,
	input logic [NUM_OF_INPS-1 : 0] request,
	//output grant
	output logic [NUM_OF_INPS-1 : 0] grant
	);


logic [NUM_OF_INPS-1 : 0] mask_bits; 
logic [NUM_OF_INPS-1 : 0] next_mask_bits; 
logic [NUM_OF_INPS-1 : 0] next_mask_bits_if_grant;  
logic [NUM_OF_INPS-1 : 0] mask_request;
logic [NUM_OF_INPS-1 : 0] mask_grant;
logic [NUM_OF_INPS-1 : 0] no_mask_grant;
logic any_grant_mask;
logic any_grant; 

always_ff @(posedge clk or negedge rst_b)
begin
	if(!rst_b)
	begin
		mask_bits <= '0;
	end
	else
	begin
		mask_bits <= next_mask_bits;
	end
end

assign next_mask_bits = any_grant ? next_mask_bits_if_grant : mask_bits;
assign next_mask_bits_if_grant[0] = 0;
assign next_mask_bits_if_grant[NUM_OF_INPS-1] = ~(grant[NUM_OF_INPS-1]);

genvar i;
generate 
    for(i=1; i < (NUM_OF_INPS-1); i++)  //i=0 nd i=NUM_OF_INPS-1 calculated above outside the loop
    begin
	assign next_mask_bits_if_grant[i] = |grant[i-1 : 0];
    end
endgenerate

assign mask_request = request & mask_bits;
assign mask_grant[0] = mask_request[0];
generate 
    for(i=1; i < NUM_OF_INPS; i++)
    begin
	assign mask_grant[i] = ~(|mask_request[i-1 : 0]) && mask_request[i];
    end
endgenerate

//SIMPLE PRIORITY for no_mask request
assign no_mask_grant[0] = request[0];
generate 
    for(i=1; i < NUM_OF_INPS; i++)
    begin
	assign no_mask_grant[i] = ~(|request[i-1 : 0]) && request[i];
    end
endgenerate

assign any_grant_mask = |mask_grant[NUM_OF_INPS-1 : 0];

assign grant = any_grant_mask ? mask_grant : no_mask_grant;
assign any_grant = |grant[NUM_OF_INPS-1 : 0];

endmodule 
