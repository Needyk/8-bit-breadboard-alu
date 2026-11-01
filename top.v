`default_nettype none
module top(
    input wire clk,
    input wire [7:0] sw_a,
    input wire [7:0] sw_b,
    input wire [2:0] sw_op,
    output wire [7:0] led_pins,
    output wire [3:0] digit_pins,
    output wire led_zero, led_carry, led_neg
);


    wire [8:0] alu_result;
    
    alu mod1(
        .a(~sw_a),
        .b(~sw_b),
        .op(~sw_op),
        .result(alu_result),
        .flag_zero(led_zero),
        .flag_carry(led_carry),
        .flag_neg(led_neg)
        );

    display mod2(
        .clk(clk),
        .num(alu_result),
        .led_pins(led_pins),
        .digit_pins(digit_pins)
        );








endmodule
`default_nettype wire