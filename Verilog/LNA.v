
module LNA
(
  output Receive,
  input EnaleReceive,   // Approximately 2.1 V
  input Transmit,
  input EnableTransmit, // Approximately 2.1 V
  input Antenna
);
  tri Receive;
  tri EnaleReceive;
  tri Transmit;
  tri EnableTransmit;
  tri Antenna;

  tri TempTranmit;

  _nmos
  
