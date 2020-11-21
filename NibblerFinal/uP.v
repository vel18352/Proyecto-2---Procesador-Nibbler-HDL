module uP(
  input clock,reset, 
  input [3:0]pushbuttons, 
  output phase,c_flag,z_flag, 
  output [3:0] instr,oprnd,data_bus,FF_out,accu, 
  output [7:0] program_byte, 
  output [11:0] PC, address_RAM);

  wire [12:0]d_out;
  wire incPC,loadPC,loadA,loadFlags,csRAM,weRAM,oeALU,oeIN,oeOprnd,loadOut,C,Zeta;
  wire [2:0]S;
  wire [3:0]ALU_out;
  wire [7:0]fetch_out;
  assign address_RAM[11:8] = oprnd;
  assign address_RAM[7:0] = program_byte;
  assign instr = fetch_out[7:4];
  assign oprnd = fetch_out[3:0];
  assign incPC = d_out[12];
  assign loadPC = d_out[11];
  assign loadA = d_out[10];
  assign loadFlags = d_out[9];
  assign S = d_out[8:6];
  assign csRAM = d_out[5];
  assign weRAM = d_out[4];
  assign oeALU = d_out[3];
  assign oeIN = d_out[2];
  assign oeOprnd = d_out[1];
  assign loadOut = d_out[0];

  phase_module     phase_module (clock,reset,phase);
  decoder          decoder (phase,c_flag,z_flag,instr,d_out);
  fetch            fetch  (clock,~phase,reset,program_byte,fetch_out);
  accumulator      accumulator (clock,loadA,reset,ALU_out,accu);
  alu              alu (S,accu,data_bus,C,Zeta,ALU_out);
  program_counter  program_counter (clock,incPC,reset,loadPC,address_RAM,PC);
  ram              ram (address_RAM,weRAM,csRAM,data_bus);
  rom              rom (PC,program_byte);
  buffer           buffer_alu (oeALU,ALU_out,data_bus);
  buffer           buffer_fetch (oeOprnd,oprnd,data_bus);
  buffer           buffer_in (oeIN,pushbuttons,data_bus);
  accumulator      ffout (clock,loadOut,reset,data_bus,FF_out);
  flags_module     flags_module (clock,loadFlags,reset,C,Zeta,c_flag,z_flag);

endmodule
