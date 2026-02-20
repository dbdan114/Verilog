//module CellOfQSRAM
//(
//  output outputData,
//  input ReadEdge,
//  input inputData,
//  input WriteEdge,
//  input RefreshEdge
    
//);
//module D_Latch(
 //   output outputData,
 //   input ReadEdge,
 //   input inputData,
  //  input WriteEdge
  //  );
module PosEdge
(
  output Edge,
  input [1:0] DigitSupply,
  input Clock
);
  wire Edge;
  tri [1:0] DigitSupply;
  tri Clock;
    
  tri LatchedClock;
  
  tri LatchedClock1;

   

    //D_Latch MakeLatch(LatchedClock, DigitSupply[1], Clock, DigitSupply[1]);
    //CellOfQSRAM MakeLatch(LatchedClock, DigitSupply[1], Clock, DigitSupply[1], 1'b1);
  CellOfZSRAM MakeLatch
  (
    LatchedClock,
    Vdd,
    Clock,
    Vdd
  );

  _buf EqualizeLatchedClock
  (
    LatchedClock1,
    DigitSupply,
    LatchedClock
  );
  
  and_nB_to_A MakeEdge
  (
    Edge,
    DigitSupply,
    Clock,
    LatchedClock
  );

endmodule
