`timescale 100 ns / 10 ps
module tb_convolutionUnit ();
reg clk, reset;
reg [3*3*3*16-1:0] image, filter; // we test with a filter whose size is 3*3*3 
wire [15:0] result;
localparam PERIOD = 100;
always
	#(PERIOD/2) clk = ~clk;
initial begin
	#0
	clk = 1'b0;
	reset = 1;
	// We test with an image part and a filter whose values are all 4 
	// The expected result is 432 generated after 25£¿ clock cycles
	image =  432'h440044004400440044004400440044004400440044004400440044004400440044004400440044004400440044004400440044004400440044004400440044004400;
	filter = 432'h440044004400440044004400440044004400440044004400440044004400440044004400440044004400440044004400440044004400440044004400440044004400;
	#PERIOD
	reset = 0;
	#(30*PERIOD)
	$displayh(result);
	$stop;
end
convolutionUnit 
#(
	.DATA_WIDTH(16),
	.D(3),
	.F(3)
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
