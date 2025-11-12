
module LinkPowerNoPLC
(
  input Clock100MhzP,
  input Clock100MhzN
);
  tri Clock100MhzP;
  tri Clock100MhzN;
  
  tri VplusForPowerLNA;
  tri VminusForPowerLNA;
 
  OscilateFromXtalDDR MakeClock100Mhz
  (
    Crystal50Mhz1,
    Crystal50Mhz2,
    Clock100MhzP,
    Clock100MhzN
  );
  MakeVoltPN GetVpnForPowerLNA
  (
    VplusForPowerLNA,
    VminusForPowerLNA
  );
