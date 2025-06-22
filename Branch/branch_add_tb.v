`timescale 1ns / 1ps

module Branch_Adder_tb;

  // Inputs
  reg [31:0] PC;
  reg [31:0] offset;

  // Output
  wire [31:0] branch_target;

  // Instantiate the Branch_Adder module
  Branch_Adder uut (
    .PC(PC),
    .offset(offset),
    .branch_target(branch_target)
  );

  initial begin
    // Display header
    $display("Time\tPC\t\tOffset\t\tBranch Target");
    $monitor("%0dns\t%h\t%h\t%h", $time, PC, offset, branch_target);

    // Test case 1
    PC = 32'h00000004;
    offset = 32'h00000010;  // +16
    #10;

    // Test case 2
    PC = 32'h00000010;
    offset = 32'hFFFFFFF0;  // -16 (2's complement)
    #10;

    // Test case 3
    PC = 32'h00000020;
    offset = 32'h00000004;  // +4
    #10;

    // Test case 4
    PC = 32'h00000000;
    offset = 32'h00000000;  // zero offset
    #10;

    // Test case 5
    PC = 32'h7FFFFFFF;
    offset = 32'h00000001;  // overflow test
    #10;

    // Finish simulation
    $finish;
  end

endmodule
