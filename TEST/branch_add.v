module Branch_Adder(
    input [31:0] PC,                     // Program counter
    input [31:0] offset,                 // Offset được tính từ lệnh nhánh
    output reg [31:0] branch_target     // Địa chỉ nhánh được tính toán
);

    always @(*) begin
        branch_target = PC + offset;  // Sử dụng blocking assignment
    end

endmodule
