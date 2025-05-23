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

    tri NorthToSouth1;
    tri SouthToNorth1;

    trireg NorthToSouth2;
    trireg SouthToNorth2;
    
    _nmos Read(West, inputData, ReadEdge);
    
    assign North=West;

    assign South=West;

    _nmos ChargeNorth(NorthToSouth1, North, Vdd);

    _nmos ChargeSouth(SouthToNorth1, South, Vdd);

    assign NorthToSouth2=NorthToSouth1;

    assign SouthToNorth2=SouthToNorth1;

    assign South=NorthToSouth2;
    
    assign North=SouthToNorth2;

    assign East=North;

    assign East=South;

    _nmos Write(outputData, East, WriteEdge);
endmodule
