`include "DigitSupply.vh"

module MakeVoltPN
(
  output V_Plus,
  output V_Minus
);

  tri [1:0] TempSupplyDigit = SupplyDigit;
  DifferentialQBit LinkVddVss(TempSupplyDigit[1],TempSupplyDigit[0]);
  DifferentialQBit MakeV_Minus(TempSupplyDigit[0],V_Minus);
  DifferentialQBit MakeV_Plus(V_Plus,TempSupplyDigit[1]);
endmodule
