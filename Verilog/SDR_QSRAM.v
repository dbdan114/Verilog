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

    
    reg [DATA_WIDTH - 1 : 0] inoutData;

    tri [ADDR_WIDTH - 1 : 0] Address;

    tri Clock;

    tri Enable;

    tri Read;

    tri Write;

    tri Refresh;

    
    tri PosEdgeClock;

    tri BufferedEnable

    tri AndedOfEdgeClock_Enable;

 

    tri [$pow(2,ADDR_WIDTH) - 1:0] DecodedEnable;

    tri [$pow(2,ADDR_WIDTH) - 1:0] DecodedRead;

    tri [$pow(2,ADDR_WIDTH) - 1:0] DecodedWrite;

 

    genvar perDecoded;

    genvar perData;

    PosEdge MakePosEdge(PosEdgeClock, SupplyDigit, Clock);
endmodule
