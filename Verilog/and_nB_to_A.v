module and_nB_to_A(

    output outputData,
    input [1:0] DigitSupply,
    input A,

    input nB
    );
    wire outputData;
    tri [1:0] DigitSupply;
    tri A;

    tri nB;
   

    _pmos For0(outputData,A, nB);
    _nmos For1(outputData,DigitSupply[0], nB);
    
endmodule
