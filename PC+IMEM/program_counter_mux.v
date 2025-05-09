module pc_mux(
    input  [31:0] pc_in,
    input  [31:0] pc_branch,
    input         pc_select,
    output [31:0] pc_out
);

    assign pc_out = (pc_select == 1'b0) ? pc_in : pc_branch;

endmodule
