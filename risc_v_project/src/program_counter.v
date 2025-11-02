/*
    Program Counter
    - Register that holds the memory address for the next instruction
    - Inputs and Outputs
        - Clock: 0->1 changes the pc counter to the next instruction
        - Reset: Resets program counter to zero
        - PC : The address of the next instruction
*/
module program_counter(
    input clk,
    input reset,
    output reg [31:0] pc
);
    always @(posedge clk) begin
        if (reset) begin
            pc <= 32'h0;
        end else begin
            pc <= pc + 4;
        end
    end
endmodule 