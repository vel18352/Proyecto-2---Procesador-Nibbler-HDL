module decoder(input phase,C,Zeta, input [3:0]i, output [12:0]out); //instanciar modulo

  wire phase,C,Zeta;        //instanciar variables a utilizar y asignar valores de salida
  wire [3:0]i;
  reg [12:0]carry=0;
  assign out = carry;     

  always @ (phase or C or Zeta or i)  //inician las instrucciones
  begin    
    if (phase==0) 
      begin                               //ANY
        carry  = 13'b1000000001000;          
      end
    else 
      begin
        if (i==4'b0000 && C==1) 
          begin
            carry  <= 13'b0100000001000;    //JC CARRY 1
          end
        else if (i==4'b0000 && C==0) 
          begin
            carry  = 13'b1000000001000;     //JC CARRY 0
          end
        else if (i==4'b0001 && C==1) 
          begin
            carry  = 13'b1000000001000;     //JNC  CARRY 1
          end
        else if (i==4'b0001 && C==0) 
          begin
            carry  = 13'b0100000001000;     //JNC  CARRY 0
          end
        else if (i==4'b0010) 
          begin
            carry  = 13'b0001001000010;     // CMPI
          end
        else if (i==4'b0011) 
          begin
            carry  = 13'b1001001100000;   // CMPM
          end
        else if (i==4'b0100) 
          begin
            carry  = 13'b0011010000010;   // LIT
          end
        else if (i==4'b0101) 
          begin
            carry  = 13'b0011010000100;   // IN
          end
        else if (i==4'b0110) 
          begin
            carry  = 13'b1011010100000;   // LD
          end
        else if (i==4'b0111) 
          begin
            carry  = 13'b1000000111000;   //ST
          end
        else if (i==4'b1000 && Zeta==1) 
          begin
            carry  = 13'b0100000001000;   //JZ Z=1
          end
        else if (i==4'b1000 && Zeta==0) 
          begin
            carry  = 13'b1000000001000;   //JZ Z=0
          end
        else if (i==4'b1001 && Zeta==1) 
          begin
            carry  = 13'b1000000001000;   // JNZ Z=1
          end
        else if (i==4'b1001 && Zeta==0) 
          begin
            carry  = 13'b0100000001000;   // JNZ Z=0
          end
        else if (i==4'b1010) 
          begin
            carry  = 13'b0011011000010;   // ADDI
          end
        else if (i==4'b1011) 
          begin
            carry  = 13'b1011011100000;   // ADDM
          end
        else if (i==4'b1100) 
          begin
            carry  = 13'b0100000001000;   // JMP
          end
        else if (i==4'b1101) 
          begin
            carry  = 13'b0000000001001;   //OUT
          end
        else if (i==4'b1110) 
          begin
            carry  = 13'b0011100000010;   //NANDI
          end
        else if (i==4'b1111) 
          begin
            carry  = 13'b1011100100000;   //NANDM
          end
      end
  end

endmodule
