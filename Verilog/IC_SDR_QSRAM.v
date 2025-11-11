`include "DigitSupply.vh"

module IC_SDR_QSRAM #(

parameter ADDR_WIDTH = 33

parameter DATA_WIDTH = 9

)(

    inout [DATA_WIDTH - 1 : 0] inoutData,

    input [ADDR_WIDTH - 1 : 0] Address,

    input Clock,

    input Enable,

    input Read,

    input Write,

    input Refresh,

    input Crystal50Mhz1,

    input Crystal50Mhz2

);
    
    reg [DATA_WIDTH - 1 : 0] inoutData;

    tri [ADDR_WIDTH - 1 : 0] Address;

    tri Clock;

    tri Enable;

    tri Read;

    tri Write;

    tri Refresh;

    tri Crystal50Mhz1;

    tri Crystal50Mhz2;

    
    
    tri Clock100MhzP;

    tri Clock100MhzN;

    
    
    OscilateFromXtalDDR MakeClock100Mhz
    (
        Crystal50Mhz1,
        Crystal50Mhz2,
        Clock100MhzP,
        Clock100MhzN
    );
endmodule 
