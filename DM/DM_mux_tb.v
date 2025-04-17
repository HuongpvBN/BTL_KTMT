`timescale 1ns / 1ps

module tb_MUX2to1_DataMemory;

    // Inputs
    reg [31:0] input0;
    reg [31:0] input1;
    reg select;

    // Output
    wire [31:0] out;

    // Instantiate the Unit Under Test (UUT)
    MUX2to1_DataMemory uut (
        .input0(input0),
        .input1(input1),
        .select(select),
        .out(out)
    );

    initial begin
        $display("===== Starting MUX2to1_DataMemory Simulation =====");

        // Test case 1: select = 0 → output should be input0
        input0 = 32'd100;
        input1 = 32'd200;
        select = 0;
        #10;
        $display("Select = 0 | input0 = %d, input1 = %d, out = %d (Expected: 100)", input0, input1, out);

        // Test case 2: select = 1 → output should be input1
        select = 1;
        #10;
        $display("Select = 1 | input0 = %d, input1 = %d, out = %d (Expected: 200)", input0, input1, out);

        // Test case 3: change input values
        input0 = 32'd999;
        input1 = 32'd888;
        select = 0;
        #10;
        $display("Select = 0 | input0 = %d, input1 = %d, out = %d (Expected: 999)", input0, input1, out);

        select = 1;
        #10;
        $display("Select = 1 | input0 = %d, input1 = %d, out = %d (Expected: 888)", input0, input1, out);

        $display("===== End of Simulation =====");
        $finish;
    end

endmodule
