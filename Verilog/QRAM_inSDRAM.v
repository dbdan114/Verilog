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
