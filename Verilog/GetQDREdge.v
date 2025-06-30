module GetQDREdge
(
  output QDREdge,
  input ClockP,
  input ClockN
);
  tri QDREdge;
  tri ClockP;
  tri ClockN;

  DiffenentialQbit ClockPtoEdge(ClockP,QDREdge);
  DiffenentialQbit ClockNtoEdge(ClockN,QDREdge);
  
endmodule
