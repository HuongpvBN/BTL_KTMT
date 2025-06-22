`timescale 1ns / 1ps

module immediate_generator_tb;

  // Inputs
  reg [31:0] instruction;

  // Output
  wire [31:0] imm_out;

  // Instantiate the Unit Under Test (UUT)
  immediate_generator uut (
    .instruction(instruction),
    .imm_out(imm_out)
  );

  initial begin
    $display("Time | Instruction            | imm_out (decimal) | imm_out (hex)");
    $monitor("%4dns | %b | %0d | 0x%h", 
             $time, instruction, imm_out, imm_out);

    // I-type (addi x1, x2, 10)
    instruction = 32'b000000000010_00010_000_00001_0010011; #10;

    // Load-type (lw x1, 4(x2))
    instruction = 32'b000000000100_00010_010_00001_0000011; #10;

    // Store-type (sw x1, 8(x2))
    instruction = 32'b0000000_00001_00010_010_01000_0100011; #10;

    // B-type (beq x1, x2, -4)
    instruction = 32'b1111111_00010_00001_000_11110_1100011; #10;

    // U-type (lui x1, 0x12345)
    instruction = 32'b00010010001101000101_00001_0110111; #10;

    // U-type (auipc x1, 0x12345)
    instruction = 32'b00010010001101000101_00001_0010111; #10;

    // J-type (jal x1, 0x100)
    instruction = 32'b000000000001_0_0000000001_00001_1101111; #10;

    // Default/Unknown type
    instruction = 32'b11111111111111111111111111111111; #10;

    $finish;
  end

endmodule
