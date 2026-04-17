
`include "DigitSupply.vh"

module PowerLNA
(
  output Receive,
  input EnaleReceive,   // Approximately 2.1 V
  input Transmit,
  input EnableTransmit // Approximately 2.1 V
);

  tri Receive;
  tri EnaleReceive;
  tri Transmit;
  tri EnableTransmit;

  tri TempJunction;
  
  PowerAntenna GetInOutSignal(TempJunction);

  

  LNA CheckSignal(Receive, EnaleReceive, Transmit, EnableTransmit, TempJunction); 
  
endmodule  
