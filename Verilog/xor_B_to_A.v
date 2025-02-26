module xor_B_to_A(
    output outputData,
    input A,
    input B
    );
    tri TempNor;
    tri TempAnd;
    
    _nor #(.INPUT_WIDTH(2)) GetNor(TempNor,{B,A});
    _and #(.INPUT_WIDTH(2)) GetAnd(TempAnd,{B,A});
    
    _nor #(.INPUT_WIDTH(2)) GetXor(outputData, {TempNor,TempAnd});
        
endmodule
