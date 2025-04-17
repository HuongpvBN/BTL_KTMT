`timescale 1ns / 1ps

module tb_Data_Memory;

    // Inputs
    reg clk;
    reg rst;
    reg MemRead;
    reg MemWrite;
    reg [31:0] address;
    reg [31:0] write_data;

    // Output
    wire [31:0] read_data;

    // Instantiate the Unit Under Test (UUT)
    Data_Memory uut (
        .clk(clk),
        .rst(rst),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .address(address),
        .write_data(write_data),
        .read_data(read_data)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("===== Starting Data Memory Simulation =====");
        // Initialize inputs
        clk = 0;
        rst = 1;
        MemRead = 0;
        MemWrite = 0;
        address = 0;
        write_data = 0;

        // Hold reset for a short time
        #10;
        rst = 0;

        // Check preset values at address 15 and 17
        #10;
        MemRead = 1;
        address = 15;
        #10;
        $display("Read address 15 (should be 65): %d", read_data);

        address = 17;
        #10;
        $display("Read address 17 (should be 56): %d", read_data);

        // Write value 99 to address 10
        MemRead = 0;
        MemWrite = 1;
        address = 10;
        write_data = 99;
        #10;

        // Read back the written value at address 10
        MemWrite = 0;
        MemRead = 1;
        #10;
        $display("Read address 10 (should be 99): %d", read_data);

        // Read from address 20 (should be 0 due to reset)
        address = 20;
        #10;
        $display("Read address 20 (should be 0): %d", read_data);

        $display("===== End of Simulation =====");
        $finish;
    end

endmodule
