module Data_Memory(
    input clk,                // Xung đồng hồ
    input rst,                // Tín hiệu reset
    input MemRead,            // Tín hiệu đọc bộ nhớ
    input MemWrite,           // Tín hiệu ghi bộ nhớ
    input [31:0] address,     // Địa chỉ bộ nhớ
    input [31:0] write_data,  // Dữ liệu ghi vào bộ nhớ
    output [31:0] read_data   // Dữ liệu đọc từ bộ nhớ
);
    reg [31:0] D_Memory [63:0];  // Mảng bộ nhớ 64 vị trí, mỗi ô 32 bit
    integer k;

    // Đọc bộ nhớ khi MemRead được bật
    assign read_data = (MemRead) ? D_Memory[address[5:0]] : 32'b0;  // Đảm bảo dùng 6 bit cuối của address

    // Xử lý việc ghi vào bộ nhớ hoặc reset bộ nhớ
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset bộ nhớ: Gán tất cả các ô bộ nhớ về giá trị 0
            for (k = 0; k < 64; k = k + 1) begin
                D_Memory[k] = 32'b0;
            end
            // Gán giá trị cụ thể vào bộ nhớ sau khi reset
            D_Memory[17] = 32'd56;  // Ví dụ gán D_Memory[17] = 56
            D_Memory[15] = 32'd65;  // Ví dụ gán D_Memory[15] = 65
        end else if (MemWrite) begin
            // Ghi dữ liệu vào bộ nhớ khi MemWrite = 1
            D_Memory[address[5:0]] = write_data;  // Sử dụng 6 bit cuối của address
        end
    end

endmodule
