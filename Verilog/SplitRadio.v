`include "DigitSupply.vh"

module SplitRadio
(
  input V_Plus,
  inout Receive,
  inout ReceivedRadio,
  inout ReceivedWire,
  input V_Minus
);
  tri V_Plus;
  tri Receive;
  tri Temp_Plus1;
  tri Temp_Plus2;
  tri Temp_Plus3;
  tri ReceivedRadio;
  tri ReceivedWire;
  tri Temp_Minus3;
  tri Temp_Minus2;
  tri Temp_Minus1;
  tri NoConnect;
  tri V_Minus;

  DifferentialQBit FetchV_Plus(V_Plus,Receive);
  DifferentialQBit FetchV_Minus(NoConnect,V_Minus);
  DifferentialQBit FetchReceive(Receive,Temp_Plus1);
  DifferentialQBit FetchNoConnect(Temp_Minus1,NoConnect);
  DifferentialQBit FetchTemp_Plus1(Temp_Plus1,Temp_Plus2);
  DifferentialQBit FetchTemp_Minus1(Temp_Minus2,Temp_Minus1);
  DifferentialQBit FetchTemp_Plus2(Temp_Plus2,Temp_Plus3);
  DifferentialQBit FetchTemp_Minus2(Temp_Minus3,Temp_Minus2);
  DifferentialQBit FetchTemp_Plus3(Temp_Plus3,ReceivedRadio);
  DifferentialQBit FetchTemp_Minus3(ReceivedWire,Temp_Minus3);

  DifferentialQBit ConnectVdd(SupplyDigit[1], NoConnect);
  
endmodule
