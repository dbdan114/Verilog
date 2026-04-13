module GetQDREdge
(
  output QDREdge,
  input ClockP,
  input ClockN
);
  tri QDREdge;
  tri ClockP;
  tri ClockN;

  DiffenentialQBit ClockPtoEdge(ClockP,QDREdge);
  DiffenentialQBit ClockNtoEdge(ClockN,QDREdge);
  
endmodule
