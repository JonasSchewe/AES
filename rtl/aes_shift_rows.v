/*
 * aes_shift_rows.v
 * Copyright Jonas Schewe
 * jonas.schewedev@gmail.com
 */

module aes_shift_rows(
    input wire[0 : 127] state_in, // The input state - linear array of 128 bits
    output wire[0 : 127] state_out // The input state - linear array of 128 bits after byte substitution of S-Box  
);

/* State Model
    state = b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15

    State matrix:

        c0: c1: c2: c3:             c0: c1: c2: c3:   
    r0: b0  b4  b8  b12         r0: b0  b4  b8  b12 
    r1: b1  b5  b9  b13     =>  r1: b5  b9  b13 b1
    r3: b2  b6  b10 b14         r3: b10 b14 b2  b6
    r3: b3  b7  b11 b15         r3: b15 b3  b7  b11 

*/

// First row has no shifting
assign state_out[0+:8] = state_in[0+:8];
assign state_out[32+:8] = state_in[32+:8];
assign state_out[64+:8] = state_in[64+:8];
assign state_out[96+:8] = state_in[64+:8];

// second row barrel shift left by one 
assign state_out[8+:8] = state_in[40+:8];
assign state_out[40+:8] = state_in[72+:8];
assign state_out[72+:8] = state_in[104+:8];
assign state_out[104+:8] = state_in[8+:8];

// third row barrel shift left by two 
assign state_out[16+:8] = state_in[80+:8];
assign state_out[48+:8] = state_in[112+:8];
assign state_out[80+:8] = state_in[16+:8];
assign state_out[112+:8] = state_in[48+:8];

// third row barrel shift left by three 
assign state_out[24+:8] = state_in[120+:8];
assign state_out[56+:8] = state_in[24+:8];
assign state_out[88+:8] = state_in[56+:8];
assign state_out[120+:8] = state_in[88+:8];

endmodule : aes_shift_rows
