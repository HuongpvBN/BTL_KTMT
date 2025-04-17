`timescale 1ns / 1ps

module tb_ALU;

    // Signal test
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] ALUcontrol_In;
    wire [31:0] Result;
    wire Zero;

    // Call module ALU
    ALU uut (
        .A(A),
        .B(B),
        .ALUcontrol_In(ALUcontrol_In),
        .Result(Result),
        .Zero(Zero)
    );

    initial begin
        // --- ADD ---
        A = 32'd10; B = 32'd5; ALUcontrol_In = 4'b0000; #1;
        $display("ADD: %d + %d = %d | Zero = %b", A, B, Result, Zero);  // expect 15, Zero=0

        // --- SUB ---
        A = 32'd10; B = 32'd10; ALUcontrol_In = 4'b0001; #1;
        $display("SUB: %d - %d = %d | Zero = %b", A, B, Result, Zero);  // expect 0, Zero=1

        // --- AND ---
        A = 32'hFF00FF00; B = 32'h0F0F0F0F; ALUcontrol_In = 4'b0010; #1;
        $display("AND: %h & %h = %h", A, B, Result);

        // --- OR ---
        ALUcontrol_In = 4'b0011; #1;
        $display("OR: %h | %h = %h", A, B, Result);

        // --- XOR ---
        ALUcontrol_In = 4'b0100; #1;
        $display("XOR: %h ^ %h = %h", A, B, Result);

        // --- SLL ---
        A = 32'h00000001; B = 32'd4; ALUcontrol_In = 4'b0101; #1;
        $display("SLL: %h << %d = %h", A, B[4:0], Result);  // expect 0x10

        // --- SRL ---
        A = 32'h00000010; B = 32'd1; ALUcontrol_In = 4'b0110; #1;
        $display("SRL: %h >> %d = %h", A, B[4:0], Result);  // expect 0x08

        // --- SRA ---
        A = -32'sd8; B = 32'd1; ALUcontrol_In = 4'b0111; #1;
        $display("SRA: %d >>> %d = %d", A, B[4:0], Result);  // expect -4

        // --- SLT ---
        A = 32'sd3; B = 32'sd5; ALUcontrol_In = 4'b1000; #1;
        $display("SLT: (%d < %d) = %d", A, B, Result);  // expect 1

        A = 32'sd7; B = 32'sd2; ALUcontrol_In = 4'b1000; #1;
        $display("SLT: (%d < %d) = %d", A, B, Result);  // expect 0

        // --- Default (Invalid opcode) ---
        ALUcontrol_In = 4'b1111; #1;
        $display("Default case: Result = %d | Zero = %b", Result, Zero);  // expect 0, Zero=1

        $finish;
    end

endmodule
