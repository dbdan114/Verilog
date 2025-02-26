module _not(

    output outputData,
    input [1:0] DigitSupply,
    input inputData
    
    );
    wire outputData;
    tri [1:0] DigitSupply;
    tri inputData;
    
    _pmos For0(outputData,DigitSupply[1],inputData);
    _nmos For1(outputData,DigitSupply[0],inputData);
    
endmodule
