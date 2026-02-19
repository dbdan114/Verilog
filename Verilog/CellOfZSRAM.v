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

  tri FromInputData;

  _nmos FetchInputData
  (
    FromInputData,
    inputData,
    WriteEdge
  );
endmodule 
