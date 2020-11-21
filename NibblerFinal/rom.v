module rom(input wire [11:0] address, output wire [7:0] dat); //instanciar modulo

  reg [7:0] rom [0:4095];     // estableceer variables a utilizar y asignar datos
  assign dat = rom[address];

  initial begin                       // aca abre el prog_rom.list que son las instrucciones y las envia
    $readmemh("memory.list", rom);  // al decoder a travez de dat luego de leer el address
  end

endmodule
