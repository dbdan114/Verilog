`include "DigitSupply.vh"

module OpAmpSEO
(
  input V_Plus,
  input input_Plus,
  output output_Neutral,
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
  DifferentialQBit Fetchinput_Plus(output_Neutral,output_Plus);
  DifferentialQBit Fetchinput_Minus(output_Neutral,input_Minus);
  
endmodule
