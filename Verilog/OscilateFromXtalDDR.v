`include "DigitSupply.vh"

module OscilateFromXtalDDR(
    input Xtal1,
    input Xtal2,
    output ClockP,
    output ClockN
);
    tri Xtal1;
    tri Xtal2;
  
    tri North;
    tri South;

    tri NorthToSouth1;
    tri SouthToNorth1;

    trireg NorthToSouth2;
    trireg SouthToNorth2;
    
    assign North=Xtal1;
    assign South=Xtal2;

    reg ClockP;
    reg ClockN;
  
    _nmos ChargeNorth(NorthToSouth1, North, Vdd);

    _nmos ChargeSouth(SouthToNorth1, South, Vdd);

    assign NorthToSouth2=NorthToSouth1;

    assign SouthToNorth2=SouthToNorth1;

    assign South=NorthToSouth2;
    
    assign North=SouthToNorth2;
    
    _buf(ClockP,PullDigit,North);
    _buf(ClockN,PullDigit,South);
endmodule
