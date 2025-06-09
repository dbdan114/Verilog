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
    DifferentialQBit MakeDifferentialClock(QBitToRead, QBitToWrite);
    assign QRAM_DDRClockP = QBitToRead;
    assign QRAM_DDRClockN = QBitToWrite;
    DifferentialQBit ClockPToQBitToWrite(QRAM_DDRClockP, QBitToWrite);
    DifferentialQBit ClockNToQBitToWrite(QRAM_DDRClockN, QBitToWrite);

    /* To Write Your HDL Code*/
    
  
    /* To Write Your HDL Code*/
endmodule
