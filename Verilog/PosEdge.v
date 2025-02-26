module PosEdge(
    output Edge,

    input [1:0] DigitSupply,
    input Clock
    );
    wire Edge;
    tri Clock;
    
    tri LatchedClock;

   

    D_Latch MakeLatch(LatchedClock, DigitSupply[1], Clock, DigitSupply[1]);

    and_nB_to_A MakeEdge(Edge, DigitSupply, Clock, LatchedClock);

 

endmodule
