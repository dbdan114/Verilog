
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

  DifferentialQBit MakeSupplySignal0(SupplyDigit[1], SupplyDigit[1]);
  DifferentialQBit MakeSupplySignal1(SupplyDigit[1], SupplyDigit[0]);
  
  
endmodule  
