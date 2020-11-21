module accumulator(input clk,enable,reset, input [3:0]A_in, output [3:0]A_out); //instanciar el modulo

  wire clk,enable,reset;        // instanciar variables internas, entrada y salidas.
  wire [3:0]A_in;
  reg [3:0]A_out=0;

  always @ (posedge clk)        //funciona cada vez que recibe clk o reset
    begin
      if(reset)                // si es reset reiniciara todo el contador
        begin
          A_out <= 0;
        end
      else if (enable==1)     // si esta habilitado
        begin                   // cambia el valor del contador si esta habilitado, de lo contrario mantiene el mismo valor
          A_out <= A_in;
        end
    end

endmodule
