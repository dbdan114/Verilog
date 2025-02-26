module _xor#(
parameter INPUT_WIDTH = 1
)(
    output outputData,
    input [INPUT_WIDTH-1:0] inputData
    );
    tri outputData;
    tri [INPUT_WIDTH-1:0] inputData;
    
    tri  [INPUT_WIDTH:0] Temp;
    assign Temp[0]=1'b0;
    genvar Index;
    generate
        for(Index=0; Index < INPUT_WIDTH; Index = Index + 1)
        begin:Place_ xor_B_to_A
            xor_B_to_A Paste(Temp[Index+1],Temp[Index],inputData[Index]);
        end
    endgenerate
    assign outputData=Temp[INPUT_WIDTH];
endmodule
