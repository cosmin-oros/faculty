module rom #(parameter aw=10, dw=32, file="rom_file.txt")(
  input clk,rst_b,
  input [aw-1:0] addr,
  output reg [dw-1:0] data
);
  reg [dw-1:0] mem[0:2**aw-1];
  initial
    $readmemh(file,mem,0,2**aw-1);
  always @ (posedge clk, negedge rst_b)
    if (rst_b == 0)   data<=0;
    else              data<=mem[addr];
endmodule