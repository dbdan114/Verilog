`include "DigitSupply.vh"

module CellOfZSRAM //Cell Of Zero Second RAM
(
  output outputData,
  input ReadEdge,
  input inputData,
  input WriteEdge,
  input Crystal50Mhz1,
  input Crystal50Mhz2
);
);
  tri outputData;
  tri ReadEdge;
  tri inputData;
  tri WriteEdge;
  tri Crystal50Mhz1;
  tri Crystal50Mhz2;

  tri FromInputData1;
  tri FromInputData2;

  tri DataWest;
  tri DataNorth;
  tri DataSouth;
  tri DataEast;

  LinkPowerNoPLC LinkLEOS
  (
    Crystal50Mhz1,
    Crystal50Mhz2
  );
  
  _nmos FetchInputData
  (
    FromInputData1,
    inputData,
    WriteEdge
  );

  _buf AmplifyFromInputData1
  (
    FromInputData2,
    SupplyDigit,
    FromInputData1
  );
  
  DifferentialQBit LinkFromInputData
  (
    FromInputData2,
    DataWest
  );
  _nmos WestToNorth
  (
    DataNorth,
    DataWest,
    Vdd
  );
  _nmos WestToSouth
  (
    DataSouth,
    DataWest,
    Vdd
  );
  _buf NorthToSouth
  (
    DataSouth,
    PullDigit,
    DataNorth
  );
  _buf SouthToNorth
  (
    DataNorth,
    PullDigit,
    DataSouth
  );
  
endmodule 
