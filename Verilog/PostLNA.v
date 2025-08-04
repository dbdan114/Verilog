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
  
  DifferentialQBit FetchVss(Vss, OuterReceive);
  DifferentialQBit FetchOuterReceive(OuterReceive, InnerReceive);
  DifferentialQBit FetchInnerReceive(InnerReceive, InnerTransmit);
  DifferentialQBit FetchInnerTransmit(InnerTransmit, OuterTransmit);
  DifferentialQBit FetchOuterTransmit(OuterTransmit, Vdd);
  
endmodule    
