module ram(input [11:0]address, input weRam,csRam, inout [3:0]salida); // instancia modulo

    wire [11:0]address;     //asigna variables que se utilizaran
    wire weRam,csRam;
    reg [3:0] ram [0:4095];
    reg [3:0] data_out;

    assign salida = (csRam&&!weRam) ? data_out : 4'bzzzz;

    always @ (address or salida or csRam or weRam) //Csram se encarga de activar la ram o desactivarla, si esta en 0 esta en alta impedancia
    begin                                          //Weram se encarga de habilitarlo como si fuera lectura o escritura, 1 para escritura y 0 para lectura
      if ((csRam==1) && (weRam==1))               // salida es el puerto bidireccional de la ram
        begin
          ram[address]<=salida;
        end
      else if ((csRam==1)&&(weRam==0)) 
        begin
          data_out<=ram[address];
        end
    end


endmodule
