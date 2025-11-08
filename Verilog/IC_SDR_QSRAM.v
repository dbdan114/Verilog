`include "DigitSupply.vh"

module IC_SDR_QSRAM #(

parameter ADDR_WIDTH = 30

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
endmodule 
