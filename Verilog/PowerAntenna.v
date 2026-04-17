`include "DigitSupply.vh"

module PowerAntenna
(
  inout Antenna
);
  DifferentialQBit MakeSupplySignal0
  (
    SupplyDigit[1], 
    SupplyDigit[1]
  );
  DifferentialQBit MakeSupplySignal1
  (
    SupplyDigit[1], 
    SupplyDigit[0])
  ;
  
  DifferentialQBit MakePullSignal1
  (
    SupplyDigit[0], 
    PullDigit[1]
  );
  DifferentialQBit MakePullSignal0
  (
    SupplyDigit[0], 
    PullDigit[0]
  );

  DifferentialQBit GetInOutSignal
  (
    Antenna, 
    SupplyDigit[1]
  );
endmodule
