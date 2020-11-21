module program_counter(input clk,enable,reset,load, input [11:0]in, output [11:0]C); //instanciar modulo

  wire clk,enable,reset,load; // declarar variables a usar y asignar datos
  wire [11:0]in;
  reg [11:0]C=0;

  always @ (posedge clk)    // ejecutar al clk
    begin
      if (load) 
        begin     // en caso se quiera cargar un valor 
          C <= in;
        end
      else if(reset) 
        begin    //en caso que halla reset restablece
          C <= 0;
        end
      else if (enable) 
        begin    // si esta habilitado ira sumando al contador 
          C <= C+1;
        end
    end

endmodule
