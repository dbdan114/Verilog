`include "DigitSupply.vh"

module CellOfZSRAM //Cell Of Zero Second RAM
(
  output outputData,
  input ReadEdge,
  input inputData,
  input WriteEdge
);
  tri outputData;
  tri ReadEdge;
  tri inputData;
  tri WriteEdge;

  tri FromInputData1;
  tri FromInputData2;

  tri DataWest;
  tri DataNorth;
  tri DataSouth;
  tri DataEast;

  tri DataEast1;
  tri DataEast2;

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
  
  DifferentialQBit LinkFromInputData2
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
  _nmos NorthToEast
  (
    DataEast,
    DataNorth,
    Vdd
  );
  _nmos SouthToEast
  (
    DataEast,
    DataSouth,
    Vdd
  );
  _buf AmplifyDataEast
  (
    DataEast1,
    SupplyDigit,
    DataEast
  );
  DifferentialQBit LinkDataEast1
  (
    DataEast1,
    DataEast2
  );
  _nmos PutDataEast2
  (
    outputData,
    DataEast2,
    ReadEdge
  );
endmodule 
