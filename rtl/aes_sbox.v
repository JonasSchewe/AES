/*
 * aes_sbox.v
 * Copyright Jonas Schewe
 * jonas.schewedev@gmail.com
 */

/* 
    This module does the substitution of bytes in the s-box. Its pure combinational logic.
*/
module aes_sbox(
    input wire[127 : 0] state_in, // The input state - linear array of 128 bits
    output wire[127 : 0] state_out // The input state - linear array of 128 bits after byte substitution of S-Box
);


    // Substitution assignments
    genvar subByte;
    generate
        for (subByte = 0; subByte < 16; subByte = subByte + 1) begin : substition_assignment
            assign state_out[(subByte * 8) + 7 : (subByte * 8)] = sbox[state_in[(subByte * 8) + 7 : (subByte * 8) + 4]][state_in[(subByte * 8) + 3 : (subByte * 8)]];
        end
    endgenerate

    // AES specification defined S-Box
    wire [7:0] sbox [16] [16];

    // Row 0
    assign sbox[0][0]  = 8'h63;
    assign sbox[0][1]  = 8'h7c;
    assign sbox[0][2]  = 8'h77;
    assign sbox[0][3]  = 8'h7b;
    assign sbox[0][4]  = 8'hf2;
    assign sbox[0][5]  = 8'h6b;
    assign sbox[0][6]  = 8'h6f;
    assign sbox[0][7]  = 8'hc5;
    assign sbox[0][8]  = 8'h30;
    assign sbox[0][9]  = 8'h01;
    assign sbox[0][10] = 8'h67;
    assign sbox[0][11] = 8'h2b;
    assign sbox[0][12] = 8'hfe;
    assign sbox[0][13] = 8'hd7;
    assign sbox[0][14] = 8'hab;
    assign sbox[0][15] = 8'h76;

    // Row 1
    assign sbox[1][0]  = 8'hca;
    assign sbox[1][1]  = 8'h82;
    assign sbox[1][2]  = 8'hc9;
    assign sbox[1][3]  = 8'h7d;
    assign sbox[1][4]  = 8'hfa;
    assign sbox[1][5]  = 8'h59;
    assign sbox[1][6]  = 8'h47;
    assign sbox[1][7]  = 8'hf0;
    assign sbox[1][8]  = 8'had;
    assign sbox[1][9]  = 8'hd4;
    assign sbox[1][10] = 8'ha2;
    assign sbox[1][11] = 8'haf;
    assign sbox[1][12] = 8'h9c;
    assign sbox[1][13] = 8'ha4;
    assign sbox[1][14] = 8'h72;
    assign sbox[1][15] = 8'hc0;

    // Row 2
    assign sbox[2][0]  = 8'hb7;
    assign sbox[2][1]  = 8'hfd;
    assign sbox[2][2]  = 8'h93;
    assign sbox[2][3]  = 8'h26;
    assign sbox[2][4]  = 8'h36;
    assign sbox[2][5]  = 8'h3f;
    assign sbox[2][6]  = 8'hf7;
    assign sbox[2][7]  = 8'hcc;
    assign sbox[2][8]  = 8'h34;
    assign sbox[2][9]  = 8'ha5;
    assign sbox[2][10] = 8'he5;
    assign sbox[2][11] = 8'hf1;
    assign sbox[2][12] = 8'h71;
    assign sbox[2][13] = 8'hd8;
    assign sbox[2][14] = 8'h31;
    assign sbox[2][15] = 8'h15;

    // Row 3
    assign sbox[3][0]  = 8'h04;
    assign sbox[3][1]  = 8'hc7;
    assign sbox[3][2]  = 8'h23;
    assign sbox[3][3]  = 8'hc3;
    assign sbox[3][4]  = 8'h18;
    assign sbox[3][5]  = 8'h96;
    assign sbox[3][6]  = 8'h05;
    assign sbox[3][7]  = 8'h9a;
    assign sbox[3][8]  = 8'h07;
    assign sbox[3][9]  = 8'h12;
    assign sbox[3][10] = 8'h80;
    assign sbox[3][11] = 8'he2;
    assign sbox[3][12] = 8'heb;
    assign sbox[3][13] = 8'h27;
    assign sbox[3][14] = 8'hb2;
    assign sbox[3][15] = 8'h75;

    // Row 4
    assign sbox[4][0]  = 8'h09;
    assign sbox[4][1]  = 8'h83;
    assign sbox[4][2]  = 8'h2c;
    assign sbox[4][3]  = 8'h1a;
    assign sbox[4][4]  = 8'h1b;
    assign sbox[4][5]  = 8'h6e;
    assign sbox[4][6]  = 8'h5a;
    assign sbox[4][7]  = 8'ha0;
    assign sbox[4][8]  = 8'h52;
    assign sbox[4][9]  = 8'h3b;
    assign sbox[4][10] = 8'hd6;
    assign sbox[4][11] = 8'hb3;
    assign sbox[4][12] = 8'h29;
    assign sbox[4][13] = 8'he3;
    assign sbox[4][14] = 8'h2f;
    assign sbox[4][15] = 8'h84;

    // Row 5
    assign sbox[5][0]  = 8'h53;
    assign sbox[5][1]  = 8'hd1;
    assign sbox[5][2]  = 8'h00;
    assign sbox[5][3]  = 8'hed;
    assign sbox[5][4]  = 8'h20;
    assign sbox[5][5]  = 8'hfc;
    assign sbox[5][6]  = 8'hb1;
    assign sbox[5][7]  = 8'h5b;
    assign sbox[5][8]  = 8'h6a;
    assign sbox[5][9]  = 8'hcb;
    assign sbox[5][10] = 8'hbe;
    assign sbox[5][11] = 8'h39;
    assign sbox[5][12] = 8'h4a;
    assign sbox[5][13] = 8'h4c;
    assign sbox[5][14] = 8'h58;
    assign sbox[5][15] = 8'hcf;

    // Row 6
    assign sbox[6][0]  = 8'hd0;
    assign sbox[6][1]  = 8'hef;
    assign sbox[6][2]  = 8'haa;
    assign sbox[6][3]  = 8'hfb;
    assign sbox[6][4]  = 8'h43;
    assign sbox[6][5]  = 8'h4d;
    assign sbox[6][6]  = 8'h33;
    assign sbox[6][7]  = 8'h85;
    assign sbox[6][8]  = 8'h45;
    assign sbox[6][9]  = 8'hf9;
    assign sbox[6][10] = 8'h02;
    assign sbox[6][11] = 8'h7f;
    assign sbox[6][12] = 8'h50;
    assign sbox[6][13] = 8'h3c;
    assign sbox[6][14] = 8'h9f;
    assign sbox[6][15] = 8'ha8;

    // Row 7
    assign sbox[7][0]  = 8'h51;
    assign sbox[7][1]  = 8'ha3;
    assign sbox[7][2]  = 8'h40;
    assign sbox[7][3]  = 8'h8f;
    assign sbox[7][4]  = 8'h92;
    assign sbox[7][5]  = 8'h9d;
    assign sbox[7][6]  = 8'h38;
    assign sbox[7][7]  = 8'hf5;
    assign sbox[7][8]  = 8'hbc;
    assign sbox[7][9]  = 8'hb6;
    assign sbox[7][10] = 8'hda;
    assign sbox[7][11] = 8'h21;
    assign sbox[7][12] = 8'h10;
    assign sbox[7][13] = 8'hff;
    assign sbox[7][14] = 8'hf3;
    assign sbox[7][15] = 8'hd2;

    // Row 8
    assign sbox[8][0]  = 8'hcd;
    assign sbox[8][1]  = 8'h0c;
    assign sbox[8][2]  = 8'h13;
    assign sbox[8][3]  = 8'hec;
    assign sbox[8][4]  = 8'h5f;
    assign sbox[8][5]  = 8'h97;
    assign sbox[8][6]  = 8'h44;
    assign sbox[8][7]  = 8'h17;
    assign sbox[8][8]  = 8'hc4;
    assign sbox[8][9]  = 8'ha7;
    assign sbox[8][10] = 8'h7e;
    assign sbox[8][11] = 8'h3d;
    assign sbox[8][12] = 8'h64;
    assign sbox[8][13] = 8'h5d;
    assign sbox[8][14] = 8'h19;
    assign sbox[8][15] = 8'h73;

    // Row 9
    assign sbox[9][0]  = 8'h60;
    assign sbox[9][1]  = 8'h81;
    assign sbox[9][2]  = 8'h4f;
    assign sbox[9][3]  = 8'hdc;
    assign sbox[9][4]  = 8'h22;
    assign sbox[9][5]  = 8'h2a;
    assign sbox[9][6]  = 8'h90;
    assign sbox[9][7]  = 8'h88;
    assign sbox[9][8]  = 8'h46;
    assign sbox[9][9]  = 8'hee;
    assign sbox[9][10] = 8'hb8;
    assign sbox[9][11] = 8'h14;
    assign sbox[9][12] = 8'hde;
    assign sbox[9][13] = 8'h5e;
    assign sbox[9][14] = 8'h0b;
    assign sbox[9][15] = 8'hdb;

    // Row 10
    assign sbox[10][0] = 8'he0;
    assign sbox[10][1] = 8'h32;
    assign sbox[10][2] = 8'h3a;
    assign sbox[10][3] = 8'h0a;
    assign sbox[10][4] = 8'h49;
    assign sbox[10][5] = 8'h06;
    assign sbox[10][6] = 8'h24;
    assign sbox[10][7] = 8'h5c;
    assign sbox[10][8] = 8'hc2;
    assign sbox[10][9] = 8'hd3;
    assign sbox[10][10] = 8'hac;
    assign sbox[10][11] = 8'h62;
    assign sbox[10][12] = 8'h91;
    assign sbox[10][13] = 8'h95;
    assign sbox[10][14] = 8'he4;
    assign sbox[10][15] = 8'h79;

    // Row 11
    assign sbox[11][0] = 8'he7;
    assign sbox[11][1] = 8'hc8;
    assign sbox[11][2] = 8'h37;
    assign sbox[11][3] = 8'h6d;
    assign sbox[11][4] = 8'h8d;
    assign sbox[11][5] = 8'hd5;
    assign sbox[11][6] = 8'h4e;
    assign sbox[11][7] = 8'ha9;
    assign sbox[11][8] = 8'h6c;
    assign sbox[11][9] = 8'h56;
    assign sbox[11][10] = 8'hf4;
    assign sbox[11][11] = 8'hea;
    assign sbox[11][12] = 8'h65;
    assign sbox[11][13] = 8'h7a;
    assign sbox[11][14] = 8'hae;
    assign sbox[11][15] = 8'h08;

    // Row 12
    assign sbox[12][0] = 8'hba;
    assign sbox[12][1] = 8'h78;
    assign sbox[12][2] = 8'h25;
    assign sbox[12][3] = 8'h2e;
    assign sbox[12][4] = 8'h1c;
    assign sbox[12][5] = 8'ha6;
    assign sbox[12][6] = 8'hb4;
    assign sbox[12][7] = 8'hc6;
    assign sbox[12][8] = 8'he8;
    assign sbox[12][9] = 8'hdd;
    assign sbox[12][10] = 8'h74;
    assign sbox[12][11] = 8'h1f;
    assign sbox[12][12] = 8'h4b;
    assign sbox[12][13] = 8'hbd;
    assign sbox[12][14] = 8'h8b;
    assign sbox[12][15] = 8'h8a;

    // Row 13
    assign sbox[13][0] = 8'h70;
    assign sbox[13][1] = 8'h3e;
    assign sbox[13][2] = 8'hb5;
    assign sbox[13][3] = 8'h66;
    assign sbox[13][4] = 8'h48;
    assign sbox[13][5] = 8'h03;
    assign sbox[13][6] = 8'hf6;
    assign sbox[13][7] = 8'h0e;
    assign sbox[13][8] = 8'h61;
    assign sbox[13][9] = 8'h35;
    assign sbox[13][10] = 8'h57;
    assign sbox[13][11] = 8'hb9;
    assign sbox[13][12] = 8'h86;
    assign sbox[13][13] = 8'hc1;
    assign sbox[13][14] = 8'h1d;
    assign sbox[13][15] = 8'h9e;

    // Row 14
    assign sbox[14][0] = 8'he1;
    assign sbox[14][1] = 8'hf8;
    assign sbox[14][2] = 8'h98;
    assign sbox[14][3] = 8'h11;
    assign sbox[14][4] = 8'h69;
    assign sbox[14][5] = 8'hd9;
    assign sbox[14][6] = 8'h8e;
    assign sbox[14][7] = 8'h94;
    assign sbox[14][8] = 8'h9b;
    assign sbox[14][9] = 8'h1e;
    assign sbox[14][10] = 8'h87;
    assign sbox[14][11] = 8'he9;
    assign sbox[14][12] = 8'hce;
    assign sbox[14][13] = 8'h55;
    assign sbox[14][14] = 8'h28;
    assign sbox[14][15] = 8'hdf;

    // Row 15
    assign sbox[15][0] = 8'h8c;
    assign sbox[15][1] = 8'ha1;
    assign sbox[15][2] = 8'h89;
    assign sbox[15][3] = 8'h0d;
    assign sbox[15][4] = 8'hbf;
    assign sbox[15][5] = 8'he6;
    assign sbox[15][6] = 8'h42;
    assign sbox[15][7] = 8'h68;
    assign sbox[15][8] = 8'h41;
    assign sbox[15][9] = 8'h99;
    assign sbox[15][10] = 8'h2d;
    assign sbox[15][11] = 8'h0f;
    assign sbox[15][12] = 8'hb0;
    assign sbox[15][13] = 8'h54;
    assign sbox[15][14] = 8'hbb;
    assign sbox[15][15] = 8'h16;

endmodule : aes_sbox

