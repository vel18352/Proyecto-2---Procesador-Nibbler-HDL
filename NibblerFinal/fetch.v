module fetch(input clk,enable,reset, input [7:0]D_in, output [7:0]D_out); //instanciar modulo

  wire clk,enable,reset; // instanciar variables a utilizar
  wire [7:0]D_in;
  reg [7:0]D_out=0;

  always @ (posedge clk or posedge reset)
    begin
      if(reset) 
        begin           // si recibe reset reinicia el fetch
          D_out <= 0;
        end
      else if (enable) 
        begin    //de lo contrario al recibir el enable devuelve la data
          D_out <= D_in;
        end
    end

endmodule
