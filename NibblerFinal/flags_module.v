module flags_module(input clk,enable,reset,C,Zeta, output C_out,Z_out); // instanciar modulo

  wire clk,enable,reset,C,Zeta;     // instanciar variables a utilizar y asignar valores
  reg C_out=0;
  reg Z_out=0;

  always @ (posedge clk)
    begin
      if(reset) 
        begin         //si recibe reset reinicia las variables Z y C
          C_out <= 0;
          Z_out <= 0;
        end
      else if (enable==1) 
        begin       // si esta habilitado almacena los datos de las banderas
          C_out <=  C;
          Z_out <=  Zeta;
        end
    end

endmodule
