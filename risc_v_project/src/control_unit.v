/*
    Control Unit
    - Decodes instructions into control signals to manage the flow of data throught the datapath
    - Inputs and Outputs
        - Funct7: Bits of funct7 found in the instruction 
        - Funct3: Bits of funct3 found in the instruction 
        - Opcode: Operation code found in the instruction
        - rd: Address of Register that should be written to
        - alu_ctrl: ALU's operation code
        - we: Allows register file to write data into a register
*/
module control_unit(
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
    input [4:0] rd,
    output reg [2:0] alu_ctrl,
    output reg we
);
    always @(*) begin
        case(opcode) 
            // R-type
            7'b0110011: begin
                we = 1;
                case(funct3) 
                    3'h0: alu_ctrl = (funct7 == 0) ? 3'b000 : 3'b001; // ADD else SUB
                    3'h6: alu_ctrl = 3'b010; // OR
                    3'h7: alu_ctrl = 3'b011; // AND
                    3'h1: alu_ctrl = 3'b100; // SLL (Shift Logical Left)
                    3'h5: alu_ctrl = 3'b101; // SLR (Shift Logical Right)
                    3'h4: alu_ctrl = 3'b110; // XOR
                    3'h2: alu_ctrl = 3'b111; // SLT (Set Less Than)
                endcase
            end
            // I-type // TO BE IMPLEMENTED
            //7'b0010011: begin
            //    0x0: 
            default: we = 0;
        endcase
    end
endmodule
                    