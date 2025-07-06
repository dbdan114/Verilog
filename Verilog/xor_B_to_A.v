module xor_B_to_A(
    output outputData,
    input [1:0] DigitSupply,
    input A,
    input B
    );
    tri outputData;
    tri [1:0] DigitSupply;
    tri A;
    tri B;
    
    tri TempNor;
    tri TempAnd;
    
    _nor #(.INPUT_WIDTH(2)) GetNor(TempNor,DigitSupply,{B,A});
    _and #(.INPUT_WIDTH(2)) GetAnd(TempAnd,DigitSupply,{B,A});
    
    _nor #(.INPUT_WIDTH(2)) GetXor(outputData,DigitSupply,{TempNor,TempAnd});
        
endmodule
