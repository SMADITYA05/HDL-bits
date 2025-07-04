module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    assign heater = (too_cold&&mode)?1:0;
    assign aircon = (too_hot&&(~mode))?1:0;
    assign fan = (heater||aircon||fan_on)?1:0;
endmodule
