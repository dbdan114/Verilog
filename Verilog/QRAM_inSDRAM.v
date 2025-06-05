`include "DigitSupply.vh"

module QRAM_inSDRAM (
    output outputQBit,
    input Read,
    input inputQBit,
    input Write,
    input AddressQBit,
    input DDRClockP,
    input DDRClockN
);

    tri PosEdgeClockForAddressQbit;
    tri NegEdgeClockForAddressQbit;
    tri DualEdgeClockForAddressQbit;

    tri PosEdgeClockForDataQBit;
    tri NegEdgeClockForDataQBit;
    tri DualEdgeClockForDataQBit;

    tri DualEdgeClockReadForDataQBit;
    tri DualEdgeClockWriteForDataQBit;
    
    tri WestForAddressQBit;
    tri EastForAddressQBit;

    tri WestForDataQBit;
    tri EastForDataQBit;

    PosEdge PosEdgeClockForAddress(PosEdgeClockForAddressQbit, PullDigit, DDRClockN);
    PosEdge PosEdgeClockForData(PosEdgeClockForDataQBit, PullDigit, DDRClockP);

    NegEdge NegEdgeClockForAddress(NegEdgeClockForAddressQbit, PullDigit, DDRClockN);
    NegEdge NegEdgeClockForData(NegEdgeClockForDataQBit, PullDigit, DDRClockP);
    
    or_B_to_A MakeDualEdgeClockForAddress(DualEdgeClockForAddressQbit, SupplyDigit, PosEdgeClockForAddressQbit, NegEdgeClockAddressQbit);
    or_B_to_A MakeDualEdgeClockForData(DualEdgeClockForDataQbit, SupplyDigit, PosEdgeClockForDataQBit, NegEdgeClockForDataQBit);
    
endmodule

module CellOfQRAM(
    output outputData,
    input ReadEdge,
    input inputData,
    input WriteEdge
);
    tri outputData;
    tri ReadEdge;
    tri inputData;
    tri WriteEdge;

    tri West;
    
    tri North;
    tri South;

    tri East;

    _nmos Write(West, inputData, WriteEdge);
    
    assign North=West;

    assign South=West;

    DifferentialQBit UseQBit(North,South);
    
    assign East=North;

    assign East=South;

    _nmos Read(outputData, East, ReadEdge);
endmodule
