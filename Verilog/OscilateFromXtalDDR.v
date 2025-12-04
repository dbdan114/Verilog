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

    assign North=Xtal1;
    assign South=Xtal2;

    reg ClockP;
    reg ClockN;

    tri Vplus;
    tri Vminus;
    MakeVoltPN ForOpAmpDo
    (
      Vplus,
      Vminus
    );
    DifferentialQBit Rectify(North,South);
    
    _buf(ClockP,PullDigit,North);
    _buf(ClockN,PullDigit,South);
endmodule
