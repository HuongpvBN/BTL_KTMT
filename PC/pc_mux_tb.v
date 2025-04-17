`timescale 1ns / 1ps

module tb_pc_mux;

    // Khai báo tín hiệu
    reg [31:0] pc_in;
    reg [31:0] pc_branch;
    reg pc_select;
    wire [31:0] pc_out;

    // Gọi module cần test
    pc_mux uut (
        .pc_in(pc_in),
        .pc_branch(pc_branch),
        .pc_select(pc_select),
        .pc_out(pc_out)
    );

    initial begin
        // Test case 1: pc_select = 0 => chọn pc_in
        pc_in = 32'h00000010;
        pc_branch = 32'h00000080;
        pc_select = 0;
        #1;
        $display("Test 1: pc_select = %b, pc_out = %h (expect %h)", pc_select, pc_out, pc_in);

        // Test case 2: pc_select = 1 => chọn pc_branch
        pc_select = 1;
        #1;
        $display("Test 2: pc_select = %b, pc_out = %h (expect %h)", pc_select, pc_out, pc_branch);

        // Test case 3: kiểm tra giá trị khác
        pc_in = 32'h00400000;
        pc_branch = 32'h00800000;
        pc_select = 0;
        #1;
        $display("Test 3: pc_select = %b, pc_out = %h (expect %h)", pc_select, pc_out, pc_in);

        pc_select = 1;
        #1;
        $display("Test 4: pc_select = %b, pc_out = %h (expect %h)", pc_select, pc_out, pc_branch);

        // Kết thúc mô phỏng
        $finish;
    end

endmodule
