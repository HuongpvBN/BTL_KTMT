`timescale 1ns / 1ps

module tb_Instruction_Memory;

    // Inputs
    reg clk;
    reg rst;
    reg [31:0] read_address;

    // Output
    wire [31:0] instruction_out;

    // Instantiate the Unit Under Test (UUT)
    Instruction_Memory uut (
        .rst(rst),
        .clk(clk),
        .read_address(read_address),
        .instruction_out(instruction_out)
    );

    // Clock generation: Toggle every 5 ns
    always #5 clk = ~clk;

    initial begin
        $display("===== Starting Instruction Memory Simulation =====");

        // Initialize signals
        clk = 0;
        rst = 1;
        read_address = 0;

        // Reset the instruction memory
        #10;
        rst = 0;

        // Test: Read various instruction addresses
        #10;
        read_address = 4;
        #10;
        $display("Instruction at address 4: %b", instruction_out);

        read_address = 8;
        #10;
        $display("Instruction at address 8: %b", instruction_out);

        read_address = 12;
        #10;
        $display("Instruction at address 12: %b", instruction_out);

        read_address = 40;
        #10;
        $display("Instruction at address 40: %b", instruction_out);

        read_address = 72;
        #10;
        $display("Instruction at address 72: %b", instruction_out);

        read_address = 84;
        #10;
        $display("Instruction at address 84: %b", instruction_out);

        read_address = 94;
        #10;
        $display("Instruction at address 94: %b", instruction_out);

        read_address = 102;
        #10;
        $display("Instruction at address 102: %b", instruction_out);

        read_address = 110;
        #10;
        $display("Instruction at address 110: %b", instruction_out);

        $display("===== End of Simulation =====");
        $finish;
    end

endmodule
