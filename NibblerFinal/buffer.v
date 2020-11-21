module buffer(input enable, input [3:0]in, output [3:0]out);   //instanciar modulo

  wire enable;                // instanciar variables a usar
  wire [3:0]in;
  reg [3:0]out;

  always @ (*) 
  begin                       //mientras este habilitado,
    if (enable) 
      begin
        out[3:0] <= in[3:0];   // almacenara algo nuevo que entre al buffer y lo guardara
      end
    else 
      begin
        out[3:0] <= 4'bzzzz;   // de lo contrario lo tendra en alta impedancia
      end
  end

endmodule
