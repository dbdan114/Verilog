`include "DigitSupply.vh"

 

module DDR_SRAM #(

parameter ADDR_WIDTH = 1

parameter DATA_WIDTH = 1

)(

    inout [DATA_WIDTH - 1 : 0] inoutData,

    input [ADDR_WIDTH - 1 : 0] Address,

    input Clock,

    input Enable,

    input Read,

    input Write,

    input nClock

);

    reg [DATA_WIDTH - 1 : 0] inoutData;

    tri [ADDR_WIDTH - 1 : 0] Address;

    tri Clock;

    tri Enable;

    tri Read;

    tri Write;

    tri nClock;

 

    tri [1:0] ChargedPullDigit;

    tri [1:0] ChargedSupplyDigit;

 

    tri PosEdgeClock;

    tri NegEdgeClock;

    tri DualEdgeClock;

 

 

    tri BufferedEnable

    tri AndedOfEdgeClock_Enable;

 

    tri [$pow(2,ADDR_WIDTH) - 1:0] DecodedEnable;

    tri [$pow(2,ADDR_WIDTH) - 1:0] DecodedRead;

    tri [$pow(2,ADDR_WIDTH) - 1:0] DecodedWrite;

 

    genvar perDecoded;

    genvar perData;

   

    _pmos ChargeFor0(ChargedPullDigit[0], PullDigit[0],1`b0);

    _nmos ChargeFor1(ChargedPullDigit[1], PullDigit[1],1`b1);

 

    _pmos ChargeFor_rVss(ChargedSupplyDigit[0], SupplyDigit[0], ChargedPullDigit[0]);

    _nmos ChargeFor_rVdd(ChargedSupplyDigit[1], SupplyDigit[1], ChargedPullDigit[0] );

 

    PosEdge MakePosEdge(PosEdgeClock, 2`b10, Clock);

    PosEdge  MakeNegEdge(NegEdgeClock, 2`b10, nClock);

    or_B_to_A MakeDualEdge(DualEdgeClock,ChargedSupplyDigit, NegEdgeClock, PosEdgeClock);

 

    and_B_to_A(BufferedEnable,ChargedSupplyDigit,ChargedSupplyDigit[1], Enable);

    and_B_to_A(AndedOfEdgeClock_Enable,ChargedSupplyDigit,BufferedEnable, DualEdgeClock );

    

    DecodeAddress #(.ADDR_WIDTH( ADDR_WIDTH)) DecodeEnable(DecodedEnable,ChargedSupplyDigit,AndedOfEdgeClock_Enable, Address);

 

    generate

        for(perDecoded=0; perDecoded < $pow(2,ADDR_WIDTH);perDecoded = perDecoded + 1)

        begin:Check_ DecodedRead

            and_B_to_A DecodeRead(DecodedRead[perDecoded],ChargedSupplyDigit, DecodedEnable[perDecoded], Read);

        end

    endgenerate

    

generate

        for(perDecoded=0; perDecoded < $pow(2,ADDR_WIDTH);perDecoded = perDecoded + 1)

        begin:Check_ DecodedWrite

            and_B_to_A DecodeWrite(DecodedWrite[perDecoded],ChargedSupplyDigit,DecodedEnable[perDecoded], Write);

        end

    endgenerate

    

  generate

        for(perDecoded=0; perDecoded < $pow(2,ADDR_WIDTH);perDecoded = perDecoded + 1)

        begin:Check_perDecoded

        generate

            for(perData=0; perData< DATA_WIDTH; perData = perData + 1)

            begin:Check_perData

                D_Latch MakeSRAM(inoutData[perData],DecodedRead[perDecoded], inoutData[perData],DecodedWrite[perDecoded]);

            end

        endgenerate

        end

    endgenerate

 

endmodule
