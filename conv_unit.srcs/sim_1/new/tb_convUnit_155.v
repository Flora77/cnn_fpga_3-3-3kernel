`timescale 100 ns / 10 ps
module tb_convUnit_155 ();
reg clk, reset;
reg [1*5*5*16-1:0] image, filter; // we test with a filter whose size is 1*5*5
wire [15:0] result;
localparam PERIOD = 100;
always
	#(PERIOD/2) clk = ~clk;
initial begin
	#0
	clk = 1'b0;
	reset = 1;
	image =  400'h4400440044004400440044004400440044004400440044004400440044004400440044004400440044004400440044004400;
	filter = 400'h4400440044004400440044004400440044004400440044004400440044004400440044004400440044004400440044004400;	
	#PERIOD
	reset = 0;
	#(27*PERIOD)
	$displayh(result);
	$stop;
end
convolutionUnit 
#(
	.DATA_WIDTH(16),
	.D(1),
	.F(5)
)
UUT
(
	.clk(clk),
	.reset(reset),
	.image(image),
	.filter(filter),
	.result(result)
);
endmodule
