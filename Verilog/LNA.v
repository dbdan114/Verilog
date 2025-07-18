module _nmos(
    output outputData,
    input inputData,
    input Control
    );


module LNA
(
  output Receive,
  input EnaleReceive,   // Approximately 2.1 V
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
  DifferentialQbit TransmitTemp(TempTranmit, Antenna);
  DifferentialQbit ReceiveTemp(Antenna, TempReceive);
  _nmos ChargeReceive(Receive, TempReceive, EnableTransmit);
endmodule
  
