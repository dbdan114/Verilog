⁶
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
  
  PowerAntenna GetInOutSignal
  (
    TempJunction
  );

  DifferentialQBit BufferTempJunction1
  (
    TempJunction,
    TempJunction1
  );

  DifferentialQBit BufferTempJunction2
  (
    TempJunction1,
    TempJunction2
  );

  LNA CheckSignal
  (
    Receive, 
    EnaleReceive, 
    Transmit, 
    EnableTransmit, 
    TempJunction2
  ); 
  
endmodule  
