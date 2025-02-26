module DecodeAddress1Bit(

    output [1:0] Decoded,

    input [1:0] DigitSupply,

    input Enable,

    input  ToDecode

    );

    wire [1:0] Decoded;

    tri [1:0] DigitSupply;

    tri Enable;

    tri ToDecode;

    

    tri ORed;

    tri ANDed;

    tri Compared;

    

    or_nB_to_A MakeORed(ORed, DigitSupply, DigitSupply[0], DigitSupply[0]);

    and_nB_to_A MakeANDed(ANDed, DigitSupply, ORed, DigitSupply[0]);

 

    and_B_to_A MakeCompared(Compared, DigitSupply, ANDed, Enable);

   

    and_ nB_to_A MakeFrom0(Decoded[0], DigitSupply, Compared, ToDecode);

    and_ B_to_A MakeFrom1(Decoded[1], DigitSupply, Compared, ToDecode);

    

endmodule
