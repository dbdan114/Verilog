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

  tri TIA_568B1236;
  tri TIA_568B5478;
  
  OscilateFromXtalDDR MakeClock100Mhz
  (
    Crystal50Mhz1,
    Crystal50Mhz2,
    Clock100MhzP,
    Clock100MhzN
  );
  MakeVoltPN GetV_pnForSplitRadio
  (
    VplusForSplitRadio,
    VminusForSplitRadio
  );
  PowerLNA GetRawPower
  (
    ToSplitRadio,
    1'b1,
    ToSplitRadio,
    1'b1
  );
  SplitRadio MakeTwoSignal
  (
    VplusForSplitRadio,
    ToSplitRadio,
    TIA_568B1236,
    TIA_568B5478,
    VminusForSplitRadio
  );
  IC_SDR_QSRAM.v
endmodule
