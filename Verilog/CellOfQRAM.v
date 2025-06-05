`include "DigitSupply.vh"

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
