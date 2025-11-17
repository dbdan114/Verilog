`include "DigitSupply.vh"

module LinkPowerNoPLC
(
  input Crystal50Mhz1,
  input Crystal50Mhz2
);
  tri Crystal50Mhz1;
  tri Crystal50Mhz2;
  
  tri Clock100MhzP;
  tri Clock100MhzN;
  
  tri VplusForSplitRadio;
  tri VminusForSplitRadio;

  tri ToSplitRadio;
 
  OscilateFromXtalDDR MakeClock100Mhz
  (
    Crystal50Mhz1,
    Crystal50Mhz2,
    Clock100MhzP,
    Clock100MhzN
  );
  MakeVoltPN GetV_pnForPowerLNA
  (
    VplusForPowerLNA,
    VminusForPowerLNA
  );
  PowerLNA GetRawPower
  (
    ToSplitRadio,
    1'b1,
    ToSplitRadio,
    1'b1
  );
  module SplitRadio
(
  input V_Plus,
  input Receive,
  output ReceivedRadio,
  output ReceivedWire,
  input V_Minus
);
endmodule
