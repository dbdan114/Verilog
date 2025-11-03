`include "DigitSupply.vh"

module CellOfQSRAM
(
  output outputData,
  input ReadEdge,
  input inputData,
  input WriteEdge,
    
  input RefreshEdge
    
);
  tri outputData;
  tri ReadEdge;
  tri inputData;
  tri WriteEdge;
  tri RefreshEdge;

  tri PreDataToWrite;
  tri DataToWrite;
  
  _buf MakeInputToSupplyStrength(PreDataToWrite,SupplyDigit,inputData);

  _nmos InsertWriting(DataToWrite, PreDataToWrite, WriteEdge);
endmodule
