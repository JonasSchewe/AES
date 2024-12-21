/*
 * aes_inv_sbox.v
 * Copyright Jonas Schewe
 * jonas.schewedev@gmail.com
 */

/* 
    This module does the inverse substitution of bytes in the s-box. Its pure combinational logic.
*/
module aes_inv_sbox(
    input wire[0 : 127] state_in, // The input state - linear array of 128 bits
    output wire[0 : 127] state_out // The input state - linear array of 128 bits after byte substitution of S-Box   
);
    // Substitution assignments ? test +:
    genvar subByte;
    generate
        for (subByte = 0; subByte < 16; subByte = subByte + 1) begin : substition_assignment
            assign state_out[(subByte * 8) : (subByte * 8) + 7] = inv_sbox[state_in[(subByte * 8) + 4 : (subByte * 8) + 7]][state_in[(subByte * 8) : (subByte * 8) + 3]];
        end
    endgenerate

    // AES specification defined S-Box
    wire [7:0] inv_sbox [16] [16];

     // Row 0
    assign inv_sbox[0][0]  = 8'h52;
    assign inv_sbox[0][1]  = 8'h09;
    assign inv_sbox[0][2]  = 8'h6a;
    assign inv_sbox[0][3]  = 8'hd5;
    assign inv_sbox[0][4]  = 8'h30;
    assign inv_sbox[0][5]  = 8'h36;
    assign inv_sbox[0][6]  = 8'ha5;
    assign inv_sbox[0][7]  = 8'h38;
    assign inv_sbox[0][8]  = 8'hbf;
    assign inv_sbox[0][9]  = 8'h40;
    assign inv_sbox[0][10] = 8'ha3;
    assign inv_sbox[0][11] = 8'h9e;
    assign inv_sbox[0][12] = 8'h81;
    assign inv_sbox[0][13] = 8'hf3;
    assign inv_sbox[0][14] = 8'hd7;
    assign inv_sbox[0][15] = 8'hfb;

        // Row 1
    assign inv_sbox[1][0]  = 8'h7c;
    assign inv_sbox[1][1]  = 8'he3;
    assign inv_sbox[1][2]  = 8'h39;
    assign inv_sbox[1][3]  = 8'h82;
    assign inv_sbox[1][4]  = 8'h9b;
    assign inv_sbox[1][5]  = 8'h2f;
    assign inv_sbox[1][6]  = 8'hff;
    assign inv_sbox[1][7]  = 8'h87;
    assign inv_sbox[1][8]  = 8'h34;
    assign inv_sbox[1][9]  = 8'h8e;
    assign inv_sbox[1][10] = 8'h43;
    assign inv_sbox[1][11] = 8'h44;
    assign inv_sbox[1][12] = 8'hc4;
    assign inv_sbox[1][13] = 8'hde;
    assign inv_sbox[1][14] = 8'he9;
    assign inv_sbox[1][15] = 8'hcb;

        // Row 2
    assign inv_sbox[2][0]  = 8'h54;
    assign inv_sbox[2][1]  = 8'h7b;
    assign inv_sbox[2][2]  = 8'h94;
    assign inv_sbox[2][3]  = 8'h32;
    assign inv_sbox[2][4]  = 8'ha6;
    assign inv_sbox[2][5]  = 8'hc2;
    assign inv_sbox[2][6]  = 8'h23;
    assign inv_sbox[2][7]  = 8'h3d;
    assign inv_sbox[2][8]  = 8'hee;
    assign inv_sbox[2][9]  = 8'h4c;
    assign inv_sbox[2][10] = 8'h95;
    assign inv_sbox[2][11] = 8'h0b;
    assign inv_sbox[2][12] = 8'h42;
    assign inv_sbox[2][13] = 8'hfa;
    assign inv_sbox[2][14] = 8'hc3;
    assign inv_sbox[2][15] = 8'h4e;

        // Row 3
    assign inv_sbox[3][0]  = 8'h08;
    assign inv_sbox[3][1]  = 8'h2e;
    assign inv_sbox[3][2]  = 8'ha1;
    assign inv_sbox[3][3]  = 8'h66;
    assign inv_sbox[3][4]  = 8'h28;
    assign inv_sbox[3][5]  = 8'hd9;
    assign inv_sbox[3][6]  = 8'h24;
    assign inv_sbox[3][7]  = 8'hb2;
    assign inv_sbox[3][8]  = 8'h76;
    assign inv_sbox[3][9]  = 8'h5b;
    assign inv_sbox[3][10] = 8'ha2;
    assign inv_sbox[3][11] = 8'h49;
    assign inv_sbox[3][12] = 8'h6d;
    assign inv_sbox[3][13] = 8'h8b;
    assign inv_sbox[3][14] = 8'hd1;
    assign inv_sbox[3][15] = 8'h25;

        // Row 4
    assign inv_sbox[4][0]  = 8'h72;
    assign inv_sbox[4][1]  = 8'hf8;
    assign inv_sbox[4][2]  = 8'hf6;
    assign inv_sbox[4][3]  = 8'h64;
    assign inv_sbox[4][4]  = 8'h86;
    assign inv_sbox[4][5]  = 8'h68;
    assign inv_sbox[4][6]  = 8'h98;
    assign inv_sbox[4][7]  = 8'h16;
    assign inv_sbox[4][8]  = 8'hd4;
    assign inv_sbox[4][9]  = 8'ha4;
    assign inv_sbox[4][10] = 8'h5c;
    assign inv_sbox[4][11] = 8'hcc;
    assign inv_sbox[4][12] = 8'h5d;
    assign inv_sbox[4][13] = 8'h65;
    assign inv_sbox[4][14] = 8'hb6;
    assign inv_sbox[4][15] = 8'h92;

        // Row 5
    assign inv_sbox[5][0]  = 8'h6c;
    assign inv_sbox[5][1]  = 8'h70;
    assign inv_sbox[5][2]  = 8'h48;
    assign inv_sbox[5][3]  = 8'h50;
    assign inv_sbox[5][4]  = 8'hfd;
    assign inv_sbox[5][5]  = 8'hed;
    assign inv_sbox[5][6]  = 8'hb9;
    assign inv_sbox[5][7]  = 8'hda;
    assign inv_sbox[5][8]  = 8'h5e;
    assign inv_sbox[5][9]  = 8'h15;
    assign inv_sbox[5][10] = 8'h46;
    assign inv_sbox[5][11] = 8'h57;
    assign inv_sbox[5][12] = 8'ha7;
    assign inv_sbox[5][13] = 8'h8d;
    assign inv_sbox[5][14] = 8'h9d;
    assign inv_sbox[5][15] = 8'h84;

        // Row 6
    assign inv_sbox[6][0]  = 8'h90;
    assign inv_sbox[6][1]  = 8'hd8;
    assign inv_sbox[6][2]  = 8'hab;
    assign inv_sbox[6][3]  = 8'h00;
    assign inv_sbox[6][4]  = 8'h8c;
    assign inv_sbox[6][5]  = 8'hbc;
    assign inv_sbox[6][6]  = 8'hd3;
    assign inv_sbox[6][7]  = 8'h0a;
    assign inv_sbox[6][8]  = 8'hf7;
    assign inv_sbox[6][9]  = 8'he4;
    assign inv_sbox[6][10] = 8'h58;
    assign inv_sbox[6][11] = 8'h05;
    assign inv_sbox[6][12] = 8'hb8;
    assign inv_sbox[6][13] = 8'hb3;
    assign inv_sbox[6][14] = 8'h45;
    assign inv_sbox[6][15] = 8'h06;

        // Row 7
    assign inv_sbox[7][0]  = 8'hd0;
    assign inv_sbox[7][1]  = 8'h2c;
    assign inv_sbox[7][2]  = 8'h1e;
    assign inv_sbox[7][3]  = 8'h8f;
    assign inv_sbox[7][4]  = 8'hca;
    assign inv_sbox[7][5]  = 8'h3f;
    assign inv_sbox[7][6]  = 8'h0f;
    assign inv_sbox[7][7]  = 8'h02;
    assign inv_sbox[7][8]  = 8'hc1;
    assign inv_sbox[7][9]  = 8'haf;
    assign inv_sbox[7][10] = 8'hbd;
    assign inv_sbox[7][11] = 8'h03;
    assign inv_sbox[7][12] = 8'h01;
    assign inv_sbox[7][13] = 8'h13;
    assign inv_sbox[7][14] = 8'h8a;
    assign inv_sbox[7][15] = 8'h6b;

        // Row 8
    assign inv_sbox[8][0]  = 8'h3a;
    assign inv_sbox[8][1]  = 8'h91;
    assign inv_sbox[8][2]  = 8'h11;
    assign inv_sbox[8][3]  = 8'h41;
    assign inv_sbox[8][4]  = 8'h4f;
    assign inv_sbox[8][5]  = 8'h67;
    assign inv_sbox[8][6]  = 8'hdc;
    assign inv_sbox[8][7]  = 8'hea;
    assign inv_sbox[8][8]  = 8'h97;
    assign inv_sbox[8][9]  = 8'hf2;
    assign inv_sbox[8][10] = 8'hcf;
    assign inv_sbox[8][11] = 8'hce;
    assign inv_sbox[8][12] = 8'hf0;
    assign inv_sbox[8][13] = 8'hb4;
    assign inv_sbox[8][14] = 8'he6;
    assign inv_sbox[8][15] = 8'h73;

        // Row 9
    assign inv_sbox[9][0]  = 8'h96;
    assign inv_sbox[9][1]  = 8'hac;
    assign inv_sbox[9][2]  = 8'h74;
    assign inv_sbox[9][3]  = 8'h22;
    assign inv_sbox[9][4]  = 8'he7;
    assign inv_sbox[9][5]  = 8'had;
    assign inv_sbox[9][6]  = 8'h35;
    assign inv_sbox[9][7]  = 8'h85;
    assign inv_sbox[9][8]  = 8'he2;
    assign inv_sbox[9][9]  = 8'hf9;
    assign inv_sbox[9][10] = 8'h37;
    assign inv_sbox[9][11] = 8'he8;
    assign inv_sbox[9][12] = 8'h1c;
    assign inv_sbox[9][13] = 8'h75;
    assign inv_sbox[9][14] = 8'hdf;
    assign inv_sbox[9][15] = 8'h6e;

        // Row 10
    assign inv_sbox[10][0] = 8'h47;
    assign inv_sbox[10][1] = 8'hf1;
    assign inv_sbox[10][2] = 8'h1a;
    assign inv_sbox[10][3] = 8'h71;
    assign inv_sbox[10][4] = 8'h1d;
    assign inv_sbox[10][5] = 8'h29;
    assign inv_sbox[10][6] = 8'hc5;
    assign inv_sbox[10][7] = 8'h89;
    assign inv_sbox[10][8] = 8'h6f;
    assign inv_sbox[10][9] = 8'hb7;
    assign inv_sbox[10][10] = 8'h62;
    assign inv_sbox[10][11] = 8'h0e;
    assign inv_sbox[10][12] = 8'haa;
    assign inv_sbox[10][13] = 8'h18;
    assign inv_sbox[10][14] = 8'hbe;
    assign inv_sbox[10][15] = 8'h1b;

        // Row 11
    assign inv_sbox[11][0] = 8'hfc;
    assign inv_sbox[11][1] = 8'h56;
    assign inv_sbox[11][2] = 8'h3e;
    assign inv_sbox[11][3] = 8'h4b;
    assign inv_sbox[11][4] = 8'hc6;
    assign inv_sbox[11][5] = 8'hd2;
    assign inv_sbox[11][6] = 8'h79;
    assign inv_sbox[11][7] = 8'h20;
    assign inv_sbox[11][8] = 8'h9a;
    assign inv_sbox[11][9] = 8'hdb;
    assign inv_sbox[11][10] = 8'hc0;
    assign inv_sbox[11][11] = 8'hfe;
    assign inv_sbox[11][12] = 8'h78;
    assign inv_sbox[11][13] = 8'hcd;
    assign inv_sbox[11][14] = 8'h5a;
    assign inv_sbox[11][15] = 8'hf4;

        // Row 12
    assign inv_sbox[12][0] = 8'h1f;
    assign inv_sbox[12][1] = 8'hdd;
    assign inv_sbox[12][2] = 8'ha8;
    assign inv_sbox[12][3] = 8'h33;
    assign inv_sbox[12][4] = 8'h88;
    assign inv_sbox[12][5] = 8'h07;
    assign inv_sbox[12][6] = 8'hc7;
    assign inv_sbox[12][7] = 8'h31;
    assign inv_sbox[12][8] = 8'hb1;
    assign inv_sbox[12][9] = 8'h12;
    assign inv_sbox[12][10] = 8'h10;
    assign inv_sbox[12][11] = 8'h59;
    assign inv_sbox[12][12] = 8'h27;
    assign inv_sbox[12][13] = 8'h80;
    assign inv_sbox[12][14] = 8'hec;
    assign inv_sbox[12][15] = 8'h5f;

        // Row 13
    assign inv_sbox[13][0] = 8'h60;
    assign inv_sbox[13][1] = 8'h51;
    assign inv_sbox[13][2] = 8'h7f;
    assign inv_sbox[13][3] = 8'ha9;
    assign inv_sbox[13][4] = 8'h19;
    assign inv_sbox[13][5] = 8'hb5;
    assign inv_sbox[13][6] = 8'h4a;
    assign inv_sbox[13][7] = 8'h0d;
    assign inv_sbox[13][8] = 8'h2d;
    assign inv_sbox[13][9] = 8'he5;
    assign inv_sbox[13][10] = 8'h7a;
    assign inv_sbox[13][11] = 8'h9f;
    assign inv_sbox[13][12] = 8'h93;
    assign inv_sbox[13][13] = 8'hc9;
    assign inv_sbox[13][14] = 8'h9c;
    assign inv_sbox[13][15] = 8'hef;

        // Row 14
    assign inv_sbox[14][0] = 8'ha0;
    assign inv_sbox[14][1] = 8'he0;
    assign inv_sbox[14][2] = 8'h3b;
    assign inv_sbox[14][3] = 8'h4d;
    assign inv_sbox[14][4] = 8'hae;
    assign inv_sbox[14][5] = 8'h2a;
    assign inv_sbox[14][6] = 8'hf5;
    assign inv_sbox[14][7] = 8'hb0;
    assign inv_sbox[14][8] = 8'hc8;
    assign inv_sbox[14][9] = 8'heb;
    assign inv_sbox[14][10] = 8'hbb;
    assign inv_sbox[14][11] = 8'h3c;
    assign inv_sbox[14][12] = 8'h83;
    assign inv_sbox[14][13] = 8'h53;
    assign inv_sbox[14][14] = 8'h99;
    assign inv_sbox[14][15] = 8'h61;

        // Row 15
    assign inv_sbox[15][0] = 8'h17;
    assign inv_sbox[15][1] = 8'h2b;
    assign inv_sbox[15][2] = 8'h04;
    assign inv_sbox[15][3] = 8'h7e;
    assign inv_sbox[15][4] = 8'hba;
    assign inv_sbox[15][5] = 8'h77;
    assign inv_sbox[15][6] = 8'hd6;
    assign inv_sbox[15][7] = 8'h26;
    assign inv_sbox[15][8] = 8'he1;
    assign inv_sbox[15][9] = 8'h69;
    assign inv_sbox[15][10] = 8'h14;
    assign inv_sbox[15][11] = 8'h63;
    assign inv_sbox[15][12] = 8'h55;
    assign inv_sbox[15][13] = 8'h21;
    assign inv_sbox[15][14] = 8'h0c;
    assign inv_sbox[15][15] = 8'h7d;

endmodule : aes_inv_sbox

