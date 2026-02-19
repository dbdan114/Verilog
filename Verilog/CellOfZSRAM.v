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

  tri FromInputData;

  tri LinkedFromInputData;

  _nmos FetchInputData
  (
    FromInputData,
    inputData,
    WriteEdge
  );

  DifferentialQBit LinkFromInputData
  (
    FromInputData,
    LinkedFromInputData
  );
endmodule 
