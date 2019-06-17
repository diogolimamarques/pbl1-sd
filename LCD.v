module lcd(
	
	input [31:0] instruction, // dados para ação
	input [31:0] data, // sados escrever LCD
	input clk,
	input en,
          
	output     rw,
	output reg rs,
	output reg enable,
	output reg [7:0] display // saída o LCD, dados
);
	
	assign rw    = 1'b0;         // pino rw para escrita
	reg    state = 1'b0;
	always @(posedge clk)
		 if(en) begin
			 enable    <= 1'b0;
			 state <= 1'b1; 
		 end else if(state) begin
			 enable    <= 1'b1;
			 rs    <= instruction[0];
			 display[7:0] <= data[7:0];
			 state <= 1'b0;
		 end
endmodule 