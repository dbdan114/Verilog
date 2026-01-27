`include "DigitSupply.vh"

module IC_LinkEoverLEOS
(
  input Crystal50Mhz1,
  input Crystal50Mhz2,
  inout TIA_568B1,
  inout TIA_568B2,
  inout TIA_568B3,
  inout TIA_568B6,
  inout TIA_568B5,
  inout TIA_568B4,
  inout TIA_568B7,
  inout TIA_568B8
);
  tri Crystal50Mhz1;
  tri Crystal50Mhz2;

  tri TIA_568B1;
  tri TIA_568B2;
  tri TIA_568B3;
  tri TIA_568B6;
  tri TIA_568B5;
  tri TIA_568B4;
  tri TIA_568B7;
  tri TIA_568B8;
  
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

  tri VplusForSEO1236;
  tri VminusForSEO1236;

  tri VplusForSEO5478;
  tri VminusForSEO5478;

  tri VplusForDO1236;
  tri VminusForDO1236;

  tri VplusForDO5478;
  tri VminusForDO5478;
  
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
    VplusForSEO1236,
    VminusForSEO1236
  );
  MakeVoltPN GetV_pnForOpAmpSEO5478
  (
    VplusForSEO5478,
    VminusForSEO5478
  );
  OpAmpSEO Make12To36
  (
    VplusForSEO1236,
    Clock100MhzP,
    TIA_568B12To36,
    TIA_568B12,
    VminusForSEO1236
  );
  OpAmpSEO Redirect12To36
  (
    VplusForSEO1236,
    TIA_568B12To36,
    TIA_568B36,
    Clock100MhzP,
    VminusForSEO1236
  );
  OpAmpSEO Make54To78
  (
    VplusForSEO5478,
    TIA_568B54,
    TIA_568B54To78,
    Clock100MhzP,
    VminusForSEO5478
  );
  OpAmpSEO Redirect54To78
  (
    VplusForSEO5478,
    Clock100MhzP,
    TIA_568B78,
    TIA_568B54To78,
    VminusForSEO5478
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
  MakeVoltPN GetV_pnForOpAmpDO1236
  (
    VplusForDO1236,
    VminusForDO1236
  );
  MakeVoltPN GetV_pnForOpAmpDO5478
  (
    VplusForDO5478,
    VminusForDO5478
  );
  OpAmpDO DecodeDO12
  (
    VplusForDO1236,
    TIA_568B12,
    TIA_568B1,
    TIA_568B2,
    Vss,
    VminusForDO1236
  );
  OpAmpDO DecodeDO36
  (
    VplusForDO1236,
    TIA_568B36,
    TIA_568B3,
    TIA_568B6,
    Vss,
    VminusForDO1236
  );
  OpAmpDO DecodeDO54
  (
    VplusForDO5478,
    TIA_568B54,
    TIA_568B5,
    TIA_568B4,
    Vss,
    VminusForDO5478
  );
  OpAmpDO DecodeDO78
  (
    VplusForDO5478,
    TIA_568B78,
    TIA_568B7,
    TIA_568B8,
    Vss,
    VminusForDO5478
  );
  trireg StablizeSupplyOfBit = rVdd;
endmodule
