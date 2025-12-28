`include "DigitSupply.vh"

module IC_Example (
  input wire Crystal50Mhz1,
  input wire Crystal50Mhz2
    /* To Write Your Signal*/

    /* To Write Your Signal*/
);
  LinkPowerNoPLC MakePLC
  (
    Crystal50Mhz1,
    Crystal50Mhz2
  );
    /*
    tri QBitToRead;
    tri QBitToWrite;
    tri WrtingToQBit;
    tri AddressQBit;

    tri QRAM_DDRClockP;
    tri QRAM_DDRClockN;
  
    assign QBitToWrite = rVss;
    assign WrtingToQBit = rVdd;
  
    QRAM_inSDRAM MakeQRAM(QBitToRead, Vdd, QBitToWrite, WrtingToQBit, QRAM_DDRClockP, QRAM_DDRClockN);
    DifferentialQBit MakeDifferentialClock(QBitToRead, QBitToWrite);
    assign QRAM_DDRClockP = QBitToRead;
    assign QRAM_DDRClockN = QBitToWrite;
    GetQDREdge MakeEdge(QBitToWrite, QRAM_DDRClockP, QRAM_DDRClockN);
    GetQDREdge MakeEdge(AddressQBit, QRAM_DDRClockP, QRAM_DDRClockN);
    DifferentialQBit ClockAddressQBitToQDR(QRAM_DDRClockN,QRAM_DDRClockP);
    */
    /* To Write Your HDL Code*/
    
  
    /* To Write Your HDL Code*/
endmodule
