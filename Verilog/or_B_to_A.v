module or_B_to_A(

    output outputData,
    input [1:0] DigitSupply,
    input A,
    input B
    );
    wire outputData;
    tri [1:0] DigitSupply;
    tri A;
    
    tri B;
    
    _pmos For0(outputData,A,B);
    _nmos For1(outputData,DigitSupply[1],B);
    
endmodule
