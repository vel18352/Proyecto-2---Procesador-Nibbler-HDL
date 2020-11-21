module phase_module(input clk,reset, output out); //instanciar modulo

reg out = 0;      //establece variables a usar y asigna valores

always @ (posedge clk)
  begin
    out <= ~out;      //niega y asigna out
  end

endmodule
