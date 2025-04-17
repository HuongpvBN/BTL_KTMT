`timescale 1ns / 1ps

module tb_program_counter;

    reg clk;
    reg rst;
    reg [31:0] pc_in;
    wire [31:0] pc_out;

    // call module test
    program_counter uut (
        .clk(clk),
        .rst(rst),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    // Creat Clock
    always #5 clk = ~clk;

    initial begin
        // initialize
        clk = 0;
        rst = 1;
        pc_in = 32'h00000000;

        // Reset module
        #10;
        rst = 0;

        // Test case 1: pc_in = 0x00000004
        pc_in = 32'h00000004;
        #10;
        $display("PC = %h", pc_out); // expected: 0x00000004

        // Test case 2: pc_in = 0x00000008
        pc_in = 32'h00000008;
        #10;
        $display("PC = %h", pc_out); // expected: 0x00000008

        // Test case 3: reset again
        rst = 1;
        #10;
        $display("PC reset = %h", pc_out); // expected: 0x00000000

        // end simulator
        $finish;
    end

endmodule
