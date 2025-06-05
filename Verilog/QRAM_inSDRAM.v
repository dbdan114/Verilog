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

    DifferentialQBit ShakeAddressQBit(EastForAddressQBit, WestForDataQBit);
    DifferentialQBit IndexDataQBit(EastForDataQBit, WestForAddressQBit);
    
    assign outputQBit = EastForDataQBit;
    
endmodule
