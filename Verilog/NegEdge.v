module NegEdge(
    output Edge,

    input [1:0] DigitSupply,
    input Clock
    );

    reg Edge;
    tri Clock;

    tri nClock;

   

    _not InvertClock(nClock, DigitSupply, Clock);

 

    PosEdge MakeResult(Edge, DigitSupply, nClock);

 

endmodule
