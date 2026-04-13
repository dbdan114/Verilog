module LNA
(
  output Receive,
  input EnableReceive,   // Approximately 2.1 V
  input Transmit,
  input EnableTransmit, // Approximately 2.1 V
  inout Antenna
);
  tri Receive;
  tri EnaleReceive;
  tri Transmit;
  tri EnableTransmit;
  tri Antenna;

  tri TempTranmit;
  tri TempReceive;

  _nmos ChargeTransmit(TempTranmit, Transmit, EnableTransmit);
  DifferentialQBit TransmitTemp(TempTranmit, Antenna);
  DifferentialQBit ReceiveTemp(Antenna, TempReceive);
  _nmos ChargeReceive(Receive, TempReceive, EnableTransmit);
endmodule
  
