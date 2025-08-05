`include "DigitSupply.vh"

module OpAmpDO
(
  input V_Plus,
  input input_Plus,
  output output_Plus,
  output output_Minus,
  input input_Minus,
  input V_Minus
);
  tri V_Plus;
  tri input_Plus;
  tri output_Plus;
  tri output_Minus;
  tri input_Minus;
  tri V_Minus;

  DifferentialQBit FetchV_Plus(V_Plus,input_Plus);
  DifferentialQBit FetchV_Minus(input_Minus,V_Minus);
  DifferentialQBit Fetchinput_Plus(input_Plus,output_Plus);
  DifferentialQBit Fetchinput_Minus(output_Minus,input_Minus);
  DifferentialQBit output_Plus_To_output_Minus(output_Plus,output_Minus);
  
endmodule
