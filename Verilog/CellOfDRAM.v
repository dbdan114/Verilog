`include "DigitSupply.vh"

module CellOfDRAM(
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
    

    tri ChangedWriteEdge0;

    tri ChangedWriteEdge1;

 

    tri ChangedReadEdge0;

    tri ChangedReadEdge1;


    tri PreDataToWrite;
    tri DataToWrite;
    trireg LatchOfDRAM;
    tri DataToRead;
    tri DataToRefresh;
    

    _buf MakeInputToSupplyStrength(PreDataToWrite,SupplyDigit,inputData);
    

    or_B_to_A MakeChangedWriteEdge0(ChangedWriteEdge0, 2'b10, WriteEdge, PullDigit[0]);

    or_nB_to_A MakeChangedWriteEdge1(ChangedWriteEdge1, 2'b10, ChangedWriteEdge0, 1'b1);

    

    _nmos InsertWriting(DataToWrite, PreDataToWrite, ChangedWriteEdge1);

    _nmos InsertRefreshing(DataToWrite, DataToRefresh, RefreshEdge);

    _nmos SendToTriReg(LatchOfDRAM,DataToWrite,1'b1);

    _buf ToRefresh(DataToRefresh, PullDigit, LatchOfDRAM);
    _buf ToRead(DataToRead, 2'b10, LatchOfDRAM);

    

    and_B_to_A MakeChangedReadEdge0(ChangedReadEdge0, 2'b10, ReadEdge, SupplyDigit[1]);

    or_B_to_A MakeChangedReadEdge1(ChangedReadEdge1, 2'b10, ChangedReadEdge0,1'b0);

 

    _nmos InsertReading(outputData, DataToRead , ChangedReadEdge1);

 

endmodule
