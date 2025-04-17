`timescale 1ns / 1ps

module main_control_unit_tb;

  // Inputs
  reg [6:0] opcode;

  // Outputs
  wire RegWrite;
  wire MemRead;
  wire MemWrite;
  wire MemToReg;
  wire ALUSrc;
  wire Branch;
  wire [1:0] ALUOp;

  // Instantiate the Unit Under Test (UUT)
  main_control_unit uut (
    .opcode(opcode),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .MemToReg(MemToReg),
    .ALUSrc(ALUSrc),
    .Branch(Branch),
    .ALUOp(ALUOp)
  );

  // Procedure to test each opcode
  initial begin
    $display("Time | Opcode   | ALUSrc MemToReg RegWrite MemRead MemWrite Branch ALUOp");
    $monitor("%4dns | %b |   %b       %b        %b        %b       %b      %b     %b", 
             $time, opcode, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);

    // R-type
    opcode = 7'b0110011; #10;

    // I-type
    opcode = 7'b0010011; #10;

    // Load
    opcode = 7'b0000011; #10;

    // Store
    opcode = 7'b0100011; #10;

    // Branch
    opcode = 7'b1100011; #10;

    // Jump
    opcode = 7'b1101111; #10;

    // LUI
    opcode = 7'b0110111; #10;

    // Default (unknown)
    opcode = 7'b1111111; #10;

    $finish;
  end

endmodule
