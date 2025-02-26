`include "DigitSupply.vh"

module D_Latch(
    output outputData,
    input ReadEdge,
    input inputData,
    input WriteEdge
    );
    tri outputData;
    tri ReadEdge;
    tri inputData;
    tri WriteEdge;
    

    tri ChangedWriteEdge0;

    tri ChangedWriteEdge1;

    

    tri ChangedReadEdge0;

    tri ChangedReadEdge1;


    tri DataWest;
    tri DataNorth;
    tri DataSouth;
    tri DataEast;
    
    _buf ToWest(DataWest,SupplyDigit,inputData);

    or_B_to_A MakeChangedWriteEdge0(ChangedWriteEdge0, SupplyDigit, WriteEdge, SupplyDigit[0]);

    and_nB_to_A MakeChangedWriteEdge1(ChangedWriteEdge1, SupplyDigit, ChangedWriteEdge1, SupplyDigit[0]);
    _nmos WestToNorth(DataNorth,DataWest, ChangedWriteEdge1);//SupplyDigit[1]);
    _nmos WestToSouth(DataSouth,DataWest, ChangedWriteEdge1);//SupplyDigit[1]);
    _buf NorthToSouth(DataSouth,PullDigit,DataNorth);
    _buf SouthToNorth(DataNorth,PullDigit,DataSouth);

    and_B_to_A(ChangedReadEdge0, SupplyDigit, ReadEdge, PullDigit[1]);

    and_nB_to_A( ChangedReadEdge1, 2'b10, ChangedReadEdge0, PullDigit[0]);
    _nmos NorthToEast(DataEast,DataNorth, ChangedReadEdge1);//SupplyDigit[1]);
    _nmos SouthToEast(DataEast,DataSouth, ChangedReadEdge1);//SupplyDigit[1]);
    _buf ToEast(outputData,2'b10,DataEast);
endmodule
