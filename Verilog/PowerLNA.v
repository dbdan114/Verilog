
`include "DigitSupply.vh"

module PowerLNA
(
  output Receive,
  input EnaleReceive,   // Approximately 2.1 V
  input Transmit,
  input EnableTransmit, // Approximately 2.1 V
);

  tri Receive;
  tri EnaleReceive;
  tri Transmit;
  tri EnableTransmit;

  tri TempJunction;
  
  DifferentialQBit MakeSupplySignal0(SupplyDigit[1], SupplyDigit[1]);
  DifferentialQBit MakeSupplySignal1(SupplyDigit[1], SupplyDigit[0]);
  
  DifferentialQBit MakePullSignal1(SupplyDigit[0], PullDigit[1]);
  DifferentialQBit MakePullSignal0(SupplyDigit[0], PullDigit[0]);

  DifferentialQBit GetInOutSignal(TempJunction, SupplyDigit[1]);

  LNA CheckSignal(Receive, EnaleReceive, Transmit, EnableTransmit, TempJunction); 
  
endmodule  
