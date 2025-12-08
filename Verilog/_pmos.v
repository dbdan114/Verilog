module _pmos
(
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
      outputData=1'bz;
    else if(Control == 1'b0)
      outputData=inputData;
    else
      outputData= 1'bx;
  end
endmodule
