
module inp_fifo #(parameter DEPTH = 4, PTR_WIDTH = $clog2(DEPTH))
(
   input  logic   clk,
   input  logic   rst_b,

   input logic    write_in, 
   input logic    read, 
   input req_pkt_type input_req, //data to be put in fifo

   output req_pkt_type output_req,  
   output logic fifo_full   
);

logic fifo_empty;
req_pkt_type fifo_mem[DEPTH-1:0];
logic [PTR_WIDTH-1 : 0] rd_ptr;
logic [PTR_WIDTH-1 : 0] wr_ptr;
logic [PTR_WIDTH : 0] count;
   
// Synchronous write and pointer update behavior   
always_ff @(posedge clk or negedge rst_b)
begin
   // Asynchronous reset
   if(~rst_b) begin
      wr_ptr     <= '0;      // Reset all the pointers and count values to 0
      rd_ptr     <= '0;      
      count <= '0;
      for(int i = 0; i < DEPTH; i++) begin
         fifo_mem[i].req <= 'b0; 
		 fifo_mem[i].req_type <= '0;
		 fifo_mem[i].req_id <= '0;
		 fifo_mem[i].req_data1 <= '0;
		 fifo_mem[i].req_data2 <= '0;
      end  
   end else begin
   if(read) begin
         rd_ptr <= rd_ptr + 1'b1;                         // Also increment the rd pointer
   end  
   if(write_in) begin
         fifo_mem[wr_ptr] <= input_req;             // If we receive a write command, store the input packet to the slot pointed to by write pointer
         wr_ptr <= wr_ptr + 1'b1;          // Also increment the write pointer
   end
   
   if(read && !write_in) begin
	  count <= count - 1;
   end   
   if(write_in && !read) begin
	  count <= count + 1;
   end   
   end
end   

assign output_req = !fifo_empty ? fifo_mem[rd_ptr] : '0;

assign fifo_empty = (count == 0) ? 1'b1 : 1'b0;                            
assign fifo_full = (count == DEPTH) ? 1'b1 : 1'b0;


// Inline SVA Assertions
`ifdef INLINE_SVA

    output_req_valid_if_not_empty: assert property (@(posedge clk) disable iff (!rst_b)
        !fifo_empty |-> output_req==fifo_mem[rd_ptr]);

    input_req_valid_if_write_in: assert property (@(posedge clk) disable iff (!rst_b)
        write_in |=> fifo_mem[$past(wr_ptr)]==$past(input_req));


`endif
endmodule
