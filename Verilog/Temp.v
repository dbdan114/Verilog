`include "DigitSupply.vh"

module OpAmpDO
(
  input V_Plus,
  input Receive,
  output output_Plus,
  output output_Minus,
  input V_Minus
);
  tri V_Plus;
  tri input_Plus;
  tri Temp_Plus1;
  tri Temp_Plus2;
  tri Temp_Plus3;
  tri Temp_Plus4;
  tri output_Plus;
  tri output_Minus;
  tri Trash;
  tri V_Minus;

  DifferentialQBit FetchV_Plus(V_Plus,input_Plus);
  DifferentialQBit FetchV_Minus(Trash,V_Minus);
  DifferentialQBit Fetchinput_Plus(input_Plus,output_Plus);
  DifferentialQBit Fetchinput_Minus(output_Minus,Trash);
  DifferentialQBit output_Plus_To_output_Minus(output_Plus,output_Minus);
  
endmodule
