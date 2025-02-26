module _nmos(
    output outputData,
    input inputData,
    input Control
    );
    reg outputData;
    tri inputData;
    tri Control;
    always @(*)
    begin
    if(Control == 1'b1)
    outputData=inputData;
    else if(Control ==1'b0)
    outputData=1'bz;
    else
    outputData= 1'bx;
    end
    endmodule
    