
`include "DigitSupply.vh"

module IC_Example (
    /* To Write Your Signal*/

    /* To Write Your Signal*/
);
  tri QBitToRead;
  tri QBitToWrite;
  tri WrtingToQBit;
  tri AddressQBit;

  tri QRAM_DDRClockP;
  tri QRAM_DDRClockN;
  
  assign QBitToWrite = rVss;
  assign WrtingToQBit = rVdd;
  
  QRAM_inSDRAM MakeQRAM(QBitToRead, Vdd, QBitToWrite, WrtingToQBit, QRAM_DDRClockP, QRAM_DDRClockN);

  
  
endmodule
module QRAM_inSDRAM (
    output outputQBit,
    input Read,
    input inputQBit,
    input Write,
    input AddressQBit,
    input DDRClockP,
    input DDRClockN
);
endmodule
  
