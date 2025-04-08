`timescale 1ns / 1ps

module ControlUnit (
    input  logic [31:0] instrCode,
    output logic        regFileWe,
    output logic [ 3:0] aluControl
);
    wire [6:0] opcode = instrCode[6:0];
    wire [3:0] operator = {instrCode[30], instrCode[14:12]};


    always_comb begin
        regFileWe = 1'b0;
        case (opcode)
            7'b0110011: regFileWe = 1'b1;  //R-Type
        endcase
    end

    always_comb begin
        case (opcode)
            7'b0110011: begin
                aluControl = 2'bx;
                case (operator)
                    4'b0000: aluControl = 4'b0000;
                    4'b1000: aluControl = 4'b0001;
                    4'b0001: aluControl = 4'b0010;
                    4'b0101: aluControl = 4'b0011;
                    4'b1101: aluControl = 4'b0100;
                    4'b0010: aluControl = 4'b0101;
                    4'b0011: aluControl = 4'b0110;
                    4'b0100: aluControl = 4'b0111;
                    4'b0110: aluControl = 4'b1000;
                    4'b0111: aluControl = 4'b1001;
                endcase
            end
        endcase
    end
endmodule
