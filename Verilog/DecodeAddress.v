module DecodeAddress #(

parameter ADDR_WIDTH = 1

)(

    output  [$pow(2,ADDR_WIDTH) - 1:0] Decoded,

    input [1:0] DigitSupply,

    input Enable,

    input [ADDR_WIDTH-1:0] ToDecode

);

    wire [$pow(2,ADDR_WIDTH)-1:0] Decoded;

    tri [1:0] DigitSupply;

    tri  Enable;

    tri [ADDR_WIDTH-1:0] ToDecode;

 

    tri [$pow(2, ADDR_WIDTH+1)-1:1] Buffer;

    assign Buffer[1] = Enable;

 

    genvar IndexToDecode;

    genvar IndexBuffer;

    generate

        for(IndexToDecode=0; IndexToDecode < ADDR_WIDTH; IndexToDecode = IndexToDecode + 1)

        begin:Check_ADDR_WIDTH

        generate

            for(IndexBuffer =0; IndexBuffer < $pow(2, IndexToDecode+1); IndexBuffer = IndexBuffer + 1)

            begin:Place_ DecodeAddress1Bit  //{1}  {2,3}  {4,5 6,7}  {8,9 10,11 12,13 14,15} ...

                DecodeAddress1Bit Paste(Buffer[$pow(2, IndexToDecode+1)+ IndexBuffer*2+1: $pow(2, IndexToDecode+1)+ IndexBuffer*2], DigitSupply, Buffer[$pow(2, IndexToDecode)+ IndexBuffer], ToDecode[(ADDR_WIDTH-1)-IndexToDecode]);

            end

        endgenerate

        end

    endgenerate

   

    generate

        for(IndexBuffer =0; IndexBuffer < $pow(2, ADDR_WIDTH); IndexBuffer = IndexBuffer + 1)

        begin:FillDecoded

              assign Decoded[IndexBuffer] = Buffer[$pow(2,ADDR_WIDTH)+ IndexBuffer];

        end

    endgenerate

endmodule
