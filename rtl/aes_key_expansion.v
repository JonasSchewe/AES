/*
 * aes_key_expansion.v
 * Copyright Jonas Schewe
 * jonas.schewedev@gmail.com
 */

 /* AES Key Expansion

 Generates the four words needed for each column for each of the ten, 12, 14 round
  */
 module aes_key_expansion #(
    parameter integer nk = 4, // Key length in 32bit words defined in the AES specification
    parameter integer nr = 10 // Number of rounds specified in AES specification
    
 )
 (
    input wire [0 : (nk * 32) - 1] key,
    output wire [0 : ((nr - 1) * 128) - 1] roundKeys
 );


 function[0 : 31] RotWord;
    input [0 : 31] word;
    begin
        RotWord = {word[8 +: 24], word[0 +:8]};
    end
 endfunction : RotWord
 

 function[0 : 31] sBoxLookUp;
    input [0 : 31] word;
    begin
    end
    
 endfunction : sBoxLookUp
 
    
 endmodule : aes_key_expansion
 
