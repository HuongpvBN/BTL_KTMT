`timescale 1ns / 1ps

module tb_pc_mux;

    // Define Signal
    reg [31:0] pc_in;
    reg [31:0] pc_branch;
    reg pc_select;
    wire [31:0] pc_out;

    // Call module test
    pc_mux uut (
        .pc_in(pc_in),
        .pc_branch(pc_branch),
        .pc_select(pc_select),
        .pc_out(pc_out)
    );

    initial begin
        // Test case 1: pc_select = 0 => chose pc_in
        pc_in = 32'h00000010;
        pc_branch = 32'h00000080;
        pc_select = 0;
        #1;
        $display("Test 1: pc_select = %b, pc_out = %h (expect %h)", pc_select, pc_out, pc_in);

        // Test case 2: pc_select = 1 => chose pc_branch
        pc_select = 1;
        #1;
        $display("Test 2: pc_select = %b, pc_out = %h (expect %h)", pc_select, pc_out, pc_branch);

        // Test case 3: Check other valuable 
        pc_in = 32'h00400000;
        pc_branch = 32'h00800000;
        pc_select = 0;
        #1;
        $display("Test 3: pc_select = %b, pc_out = %h (expect %h)", pc_select, pc_out, pc_in);

        pc_select = 1;
        #1;
        $display("Test 4: pc_select = %b, pc_out = %h (expect %h)", pc_select, pc_out, pc_branch);

        // End of Simulation
        $finish;
    end

endmodule
