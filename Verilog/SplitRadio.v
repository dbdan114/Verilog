`include "DigitSupply.vh"

module SplitRadio
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
  tri output_Plus;
  tri output_Minus;
  tri Temp_Minus3;
  tri Temp_Minus2;
  tri Temp_Minus1;
  tri Trash;
  tri V_Minus;

  DifferentialQBit FetchV_Plus(V_Plus,input_Plus);
  DifferentialQBit FetchV_Minus(Trash,V_Minus);
  DifferentialQBit Fetchinput_Plus(input_Plus,Temp_Plus1);
  DifferentialQBit FetchTrash(Temp_Minus1,Trash);
  DifferentialQBit FetchTemp_Plus1(Temp_Plus1,Temp_Plus2);
  DifferentialQBit FetchTemp_Minus1(Temp_Minus2,Temp_Minus1);
  DifferentialQBit FetchTemp_Plus2(Temp_Plus2,Temp_Plus3);
  DifferentialQBit FetchTemp_Minus2(Temp_Minus3,Temp_Minus2);
  DifferentialQBit FetchTemp_Plus3(Temp_Plus3,output_Plus);
  DifferentialQBit FetchTemp_Minus3(output_Minus,Temp_Minus3);
  
endmodule
