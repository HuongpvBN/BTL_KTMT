`timescale 1ns / 1ps

module tb_MUX2to1;

    // Signal test
    reg [31:0] input0;
    reg [31:0] input1;
    reg select;
    wire [31:0] out;

    // Call module test
    MUX2to1 uut (
        .input0(input0),
        .input1(input1),
        .select(select),
        .out(out)
    );

    initial begin
        // Test case 1: select = 0, expect out = input0
        input0 = 32'hAAAAAAAA;
        input1 = 32'h55555555;
        select = 0;
        #1;
        $display("select = %b | out = %h (expect %h)", select, out, input0);

        // Test case 2: select = 1, expect out = input1
        select = 1;
        #1;
        $display("select = %b | out = %h (expect %h)", select, out, input1);

        // Test case 3: cả hai input giống nhau
        input0 = 32'hDEADBEEF;
        input1 = 32'hDEADBEEF;
        select = 0;
        #1;
        $display("select = %b | out = %h (expect %h)", select, out, input0);

        select = 1;
        #1;
        $display("select = %b | out = %h (expect %h)", select, out, input1);

        $finish;
    end

endmodule
