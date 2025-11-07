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
  tri LatchOfQSRAM;
  tri DataToRead;
  tri DataToRefresh;
  
  _buf MakeInputToSupplyStrength(PreDataToWrite,SupplyDigit,inputData);

  _nmos InsertRefreshing(DataToWrite, DataToRefresh, RefreshEdge);
  _nmos InsertWriting(DataToWrite, PreDataToWrite, WriteEdge);

  DifferentialQBit SaveToLatch(DataToWrite,LatchOfQSRAM);

  _buf ToRefresh(DataToRefresh, PullDigit, LatchOfQSRAM);
  _buf ToRead(DataToRead, 2'b10, LatchOfQSRAM);

  _nmos InsertReading(outputData, DataToRead , CReadEdge);
endmodule
