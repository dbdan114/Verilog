`include "DigitSupply.vh"

module SDR_QSRAM #(

parameter ADDR_WIDTH = 1

parameter DATA_WIDTH = 1

)(

    inout [DATA_WIDTH - 1 : 0] inoutData,

    input [ADDR_WIDTH - 1 : 0] Address,

    input Clock,

    input Enable,

    input Read,

    input Write,

    input Refresh

);

endmodule
