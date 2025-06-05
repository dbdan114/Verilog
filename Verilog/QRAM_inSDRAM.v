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

    assign WestForAddressQBit = AddressQBit;
    assign WestForDataQBit = inputQBit;
    
    PosEdge MakePosEdgeClockForAddress(PosEdgeClockForAddressQbit, PullDigit, DDRClockN);
    PosEdge MakePosEdgeClockForData(PosEdgeClockForDataQBit, PullDigit, DDRClockP);

    NegEdge MakeNegEdgeClockForAddress(NegEdgeClockForAddressQbit, PullDigit, DDRClockN);
    NegEdge MakeNegEdgeClockForData(NegEdgeClockForDataQBit, PullDigit, DDRClockP);
    
    or_B_to_A MakeDualEdgeClockForAddress(DualEdgeClockForAddressQbit, SupplyDigit, PosEdgeClockForAddressQbit, NegEdgeClockAddressQbit);
    or_B_to_A MakeDualEdgeClockForData(DualEdgeClockForDataQbit, SupplyDigit, PosEdgeClockForDataQBit, NegEdgeClockForDataQBit);

    and_B_to_A MakeDualEdgeClockReadForDataQBit(DualEdgeClockReadForDataQBit, PullDigit, DualEdgeClockForDataQBit, Read);
    and_B_to_A MakeDualEdgeClockWriteForDataQBit(DualEdgeClockWriteForDataQBit, PullDigit, DualEdgeClockForDataQBit, Write);

    CellOfQRAM ForAddressQBit(EastForAddressQBit, DualEdgeClockForAddressQbit, WestForAddressQBit, DualEdgeClockForAddressQbit);
    CellOfQRAM ForDataQBit(EastForDataQBit, DualEdgeClockReadForDataQBit, WestForDataQBit, DualEdgeClockWriteForDataQBit);
    
endmodule

module and_B_to_A(

    output outputData,
    input [1:0] DigitSupply,
    input A,

    input B
    );
    wire outputData;
    tri [1:0] DigitSupply;
    tri A;

    tri B;

   

    _pmos For0(outputData,DigitSupply[0], B);
    _nmos For1(outputData,A, B);
    
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
