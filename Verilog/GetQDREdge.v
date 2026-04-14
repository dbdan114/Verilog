module GetQDREdge
(
  output QDREdge,
  input ClockP,
  input ClockN
);
  tri QDREdge;
  tri ClockP;
  tri ClockN;

  DifferentialQBit ClockPtoEdge(ClockP,QDREdge);
  DifferentialQBit ClockNtoEdge(ClockN,QDREdge);
  
endmodule
