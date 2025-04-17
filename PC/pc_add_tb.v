`timescale 1ns / 1ps

module tb_pc_adder;

    // Define Signal
    reg [31:0] pc_in;
    wire [31:0] pc_next;

    // Call moduel test
    pc_adder uut (
        .pc_in(pc_in),
        .pc_next(pc_next)
    );

    initial begin
        // Test case 1: pc_in = 0x00000000
        pc_in = 32'h00000000;
        #1;
        $display("Test 1: pc_in = %h, pc_next = %h", pc_in, pc_next); // Expected: 0x00000004

        // Test case 2: pc_in = 0x00000004
        pc_in = 32'h00000004;
        #1;
        $display("Test 2: pc_in = %h, pc_next = %h", pc_in, pc_next); // Expected: 0x00000008

        // Test case 3: pc_in = 0xFFFFFFFC
        pc_in = 32'hFFFFFFFC;
        #1;
        $display("Test 3: pc_in = %h, pc_next = %h", pc_in, pc_next); // Expected: 0x00000000 (overflow)

        // Test case 4: pc_in = 0x1000_0000
        pc_in = 32'h10000000;
        #1;
        $display("Test 4: pc_in = %h, pc_next = %h", pc_in, pc_next); // Expected: 0x10000004

        // Kết thúc mô phỏng
        $finish;
    end

endmodule
