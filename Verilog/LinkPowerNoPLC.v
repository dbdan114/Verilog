
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
  OpAmpSEO Rediect54To78
  (
    VplusFor5478,
    Clock100MhzP,
    TIA_568B78,
    TIA_568B54To78,
    VminusFor5478
  );
  DifferentialQbit Correct54To78
  (
    Vss,
    TIA_568B54To78
  );
endmodule
