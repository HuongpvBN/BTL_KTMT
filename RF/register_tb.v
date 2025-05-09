`timescale 1ns / 1ps

module tb_Register_File;

    // Signal declarations
    reg clk;
    reg rst;
    reg RegWrite;
    reg [4:0] Rs1, Rs2, Rd;
    reg [31:0] Write_data;
    wire [31:0] read_data1, read_data2;

    // Instantiate the Register_File module
    Register_File uut (
        .clk(clk),
        .rst(rst),
        .RegWrite(RegWrite),
        .Rs1(Rs1),
        .Rs2(Rs2),
        .Rd(Rd),
        .Write_data(Write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        $display("===== Start Simulation =====");

        // Initial values
        clk = 0;
        rst = 0;
        RegWrite = 0;
        Rs1 = 5'd1; // Read register 1
        Rs2 = 5'd2; // Read register 2
        Rd = 5'd3;  // Destination register to write
        Write_data = 32'hA5A5A5A5;

        // Test 1: Read initial data
        #10;
        $display("Initial Read: read_data1 = %d, read_data2 = %d", read_data1, read_data2);

        // Test 2: Write to register 3
        RegWrite = 1;
        #10;
        RegWrite = 0;
        Rs1 = 5'd3; // Read the written value
        Rs2 = 5'd4;
        #10;
        $display("After Write: read_data1 (R3) = %h, read_data2 (R4) = %d", read_data1, read_data2);

        // Test 3: Reset all registers
        rst = 1;
        #10;
        rst = 0;
        #10;
        Rs1 = 5'd3;
        Rs2 = 5'd4;
        $display("After Reset: read_data1 (R3) = %d, read_data2 (R4) = %d", read_data1, read_data2);

 	// Test 4: wire to x0 (Rd = 0)
        Rd = 5'd0;        
        Write_data = 32'hDEADBEEF;
        RegWrite = 1;
        #10;
        RegWrite = 0;
        Rs1 = 5'd0;         // read value x0
        #10;
        $display("Test x0: write DEADBEEF to x0, read_data1 (x0) = %h", read_data1);

        $display("===== End Simulation =====");
        $finish;
    end

endmodule
