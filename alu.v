    `default_nettype none
module alu(
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire [2:0] op,
    output  reg [8:0] result,
    output  reg [0:0] flag_zero, flag_carry, flag_neg
);

    reg [8:0] sum_ext;

    always @(*) begin
        
        flag_zero = 1'b0;
        sum_ext = 9'd0;
        result = 8'b0;
        flag_carry = sum_ext[8];

        //ISA so far
//        000 addition
//        001 subtraction
//        010 bitwise and
//        011 bitwise or
//        100 bitwise not
//        101 bitshift left STRONGLY CONSIDERING CHANGING THIS TO LOAD REGISTER
//        110 bitshift right STRONGLY CONSIDERING CHANGING THIS TO READ REGISTER
//        111 bitwise XOR



        case (op)
            3'b000: begin
                sum_ext = a + b;
                result = sum_ext[8:0];
                flag_carry = sum_ext[8];

            end

            3'b001: begin
                sum_ext = a - b;
                result = sum_ext[8:0];
                flag_carry = sum_ext[8];


            end
            
            3'b010: result = a & b;
            3'b011: result = a | b;
            3'b100: result = ~a;
            3'b101: result = a << 1;
            3'b110: result = a >> 1;
            3'b111: result = a ^ b;
            default: result = 8'b0;
        endcase

        if(result == 8'b0) begin
            flag_zero = 1;
        end

        flag_neg = result[7];
        // in 2s complement the msb is 1 if its negative

    end

    









endmodule
`default_nettype wire