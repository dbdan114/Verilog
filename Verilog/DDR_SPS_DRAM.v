`include "DigitSupply.vh"

 

module DDR_SPS_DRAM #(

parameter ADDR_WIDTH = 1

parameter DATA_WIDTH = 1

)(

    inout [DATA_WIDTH - 1 : 0] inoutData,

    input [ADDR_WIDTH - 1 : 0] Address,

    input Clock,

    input Enable,

    input Read,

    input Write,

    input Refresh,

    input nClock

);

 

    reg [DATA_WIDTH - 1 : 0] inoutData;

    tri [ADDR_WIDTH - 1 : 0] Address;

    tri Clock;

    tri Enable;

    tri Read;

    tri Write;

    tri Refresh;

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

 

    _pmos ChargeForrVss(ChargedPullDigit[0], PullDigit[0],1`b0);

    _nmos ChargeForrVdd(ChargedPullDigit[1], PullDigit[1],1`b1);

 

    _pmos ChargeFor_Vss(ChargedSupplyDigit[0], SupplyDigit[0], 1`b0);

    _nmos ChargeFor_Vdd(ChargedSupplyDigit[1], SupplyDigit[1], 1`b1);

 

    PosEdge MakePosEdge(PosEdgeClock, ChargedSupplyDigit, Clock);

    PosEdge MakeNegEdge(NegEdgeClock, ChargedSupplyDigit, nClock);

    or_B_to_A MakeDualEdge(DualEdgeClock , ChargedSupplyDigit, NegEdgeClock, PosEdgeClock);

 

    and_B_to_A(BufferedEnable, ChargedSupplyDigit, ChargedSupplyDigit[1], Enable);

    and_B_to_A(AndedOfEdgeClock_Enable,ChargedSupplyDigit,BufferedEnable, DualEdgeClock);

 

    DecodeAddress #(.ADDR_WIDTH( ADDR_WIDTH)) DecodeEnable(DecodedEnable, ChargedSupplyDigit, AndedOfEdgeClock_Enable, Address);

 

    generate

        for(perDecoded=0; perDecoded < $pow(2,ADDR_WIDTH);perDecoded = perDecoded + 1)

        begin:Check_ DecodedRead

            and_B_to_A DecodeRead(DecodedRead[perDecoded], ChargedSupplyDigit, DecodedEnable[perDecoded], Read);

        end

    endgenerate

 

    generate

        for(perDecoded=0; perDecoded < $pow(2,ADDR_WIDTH);perDecoded = perDecoded + 1)

        begin:Check_ DecodedWrite

            and_B_to_A DecodeWrite(DecodedWrite[perDecoded], {ChargedSupplyDigit[1], 1`b0} ,DecodedEnable[perDecoded], Write);

        end

    endgenerate

 

    generate

        for(perDecoded=0; perDecoded < $pow(2,ADDR_WIDTH);perDecoded = perDecoded + 1)

        begin:Check_perDecoded

        generate

            for(perData=0; perData< DATA_WIDTH; perData = perData + 1)

            begin:Check_perData

                CellOfDRAM MakeDDR_SPS_DRAM(inoutData[perData], DecodedRead[perDecoded], inoutData[perData], DecodedWrite[perDecoded], Refresh);

            end

        endgenerate

        end

    endgenerate

 

endmodule
