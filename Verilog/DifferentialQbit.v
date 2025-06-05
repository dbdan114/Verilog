`include "DigitSupply.vh"

module DifferentialQBit(
    inout QBitN,
    inout QBitS
);
    tri QBitN;
    tri QBitS;
  
    tri NorthToSouth1;
    tri SouthToNorth1;

    trireg NorthToSouth2;
    trireg SouthToNorth2;
    
    _nmos ChargeNorth(NorthToSouth1, QBitN, Vdd);

    _nmos ChargeSouth(SouthToNorth1, QBitS, Vdd);

    assign NorthToSouth2=NorthToSouth1;

    assign SouthToNorth2=SouthToNorth1;

    assign QBitS=NorthToSouth2;
    
    assign QBitN=SouthToNorth2;
    
endmodule
