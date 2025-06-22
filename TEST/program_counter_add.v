module pc_adder(
    input  [31:0] pc_in,
    output [31:0] pc_next
);

    assign pc_next = pc_in + 4;

endmodule
