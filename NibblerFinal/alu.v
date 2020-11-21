module alu(input [2:0]S, input [3:0]A,B, output C,Zeta, output [3:0]Y_out);     //instanciar modulo

  wire [2:0]S;                      // instanciar variables internas, entrada y salidas.
  wire [3:0]A,B;
  reg [3:0]Y_out;
  reg C=0;
  reg Zeta=0;

  always @ (*)            //casos del selector 
    begin                 // caso que reciba 000 dara como salida A
      if(S==0) 
        begin            
          Y_out<=A;
          C<=0;
          Zeta= (Y_out == 0);
        end
      else if (S==2) 
        begin                // en caso que reciba 001 dara B como salida
          Y_out<=B;
          C<=0;
          Zeta= (Y_out == 0);
        end
      else if (S==3) 
        begin               // en caso reciba 010 sumara A y B
          Y_out<=(A+B);
          Zeta= (Y_out == 0);
              if((A+B)>15)    //Agregara 1 al carry si hay overflow en la suma
              begin
                C<=1;
              end
            else          // de lo contrario mantiene el carry en 0
              begin
                C<=0;
              end
        end
      else if (S==1) 
        begin             // en caso de recibir 011 comparara entre A y B
          Y_out<=(A-B);
          if (A==B) 
            begin
              Zeta = (Y_out == 0);        // si A y B son iguales Carry = 0, si A es mayor C = 0 de lo contrario devolvera 1 
              C<=0;
            end
          else if (A>B) 
            begin
              Zeta= (Y_out == 0);
              C<=0;
            end
          else 
            begin
              C<=1;
              Zeta= (Y_out == 0);
            end
        end
      else if (S==4)          //en caso de recibir 100 hara un NAND entre A y B
        begin
          Y_out<=(~(A&B));    
          C<=0;
          Zeta= (Y_out == 0);
        end
      else 
        begin
          Y_out<=Y_out;     // de lo contrario de recibir algo mas en el selector devolvera Y 
          C<=0;
          Zeta= (Y_out == 0);
        end
    end

endmodule
