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

  tri TIA_568B12;
  tri TIA_568B36;
  tri TIA_568B12To36;
  
  tri TIA_568B54;
  tri TIA_568B78;
  tri TIA_568B54To78;

  tri VplusFor1236;
  tri VminusFor1236;

  tri VplusFor5478;
  tri VminusFor5478;
  
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
  PostLNA Check12and36
  (
    TIA_568B1236,
    TIA_568B12,
    TIA_568B36,
    TIA_568B1236
  );
  PostLNA Check54and78
  (
    TIA_568B5478,
    TIA_568B54,
    TIA_568B78,
    TIA_568B5478
  );
  MakeVoltPN GetV_pnForOpAmpSEO1236
  (
    VplusFor1236,
    VminusFor1236
  );
  MakeVoltPN GetV_pnForOpAmpSEO5478
  (
    VplusFor5478,
    VminusFor5478
  );
  OpAmpSEO Make12To36
  (
    VplusFor1236,
    Clock100MhzP,
    TIA_568B12To36,
    TIA_568B12,
    VminusFor1236
  );
  OpAmpSEO Redirect12To36
  (
    VplusFor1236,
    TIA_568B12To36,
    TIA_568B36,
    Clock100MhzP,
    VminusFor1236
  );
  OpAmpSEO Make54To78
  (
    VplusFor5478,
    TIA_568B54,
    TIA_568B54To78,
    Clock100MhzP,
    VminusFor5478
  );
  OpAmpSEO Redirect54To78
  (
    VplusFor5478,
    Clock100MhzP,
    TIA_568B78,
    TIA_568B54To78,
    VminusFor5478
  );
  DifferentialQBit Correct54To78
  (
    Vss,
    TIA_568B54To78
  );
  DifferentialQBit Correct12To36
  (
    Vss,
    TIA_568B12To36
  );
endmodule
