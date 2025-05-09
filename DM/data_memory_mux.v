module MUX2to1_DataMemory (
    input [31:0] input0,  // Đầu vào 32 bit 0
    input [31:0] input1,  // Đầu vào 32 bit 1
    input select,         // Tín hiệu điều khiển
    output [31:0] out     // Đầu ra 32 bit
);

    // Tín hiệu đầu ra sẽ được chọn theo select
    assign out = (select) ? input1 : input0; // Nếu select = 1 thì out = input1, nếu select = 0 thì out = input0

endmodule
