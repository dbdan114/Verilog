`include "DigitSupply.vh"

module PostLNA
(
  input OuterReceive,
  output InnerReceive,
  input InnerTransmit,
  output OuterTransmit
);

  tri OuterReceive;
  tri InnerReceive;
  tri InnerTransmit;
  tri OuterTransmit;

  tri TempVss;
  
  DifferentialQBit CorrectTempVss(Vss, TempVss);
  DifferentialQBit FetchVss(TempVss, OuterReceive);
  DifferentialQBit FetchOuterReceive(OuterReceive, InnerReceive);
  DifferentialQBit FetchInnerReceive(InnerReceive, InnerTransmit);
  DifferentialQBit FetchInnerTransmit(InnerTransmit, OuterTransmit);
  DifferentialQBit FetchOuterTransmit(OuterTransmit, Vdd);
  
endmodule    
