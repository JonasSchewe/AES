/*
 * aes_mix_columns.v
 * Copyright Jonas Schewe
 * jonas.schewedev@gmail.com
 */

/* AES MixColumns

    Does the AES specified mix columns operation. Is completly combinatoric.
 */
module aes_mix_columns(
    input wire [0 : 127] state_in,
    output wire [0 : 127] state_out
);


    /*
    Transform state by multiplication with fixed matrix

    Defined by standard
        s = ({02} • s0,c) ⊕ ({03} • s1,c) ⊕ s2,c ⊕ s3,c0,c0
        s = s0,c ⊕ ({02} • s1,c) ⊕ ({03} • s2,c) ⊕ s3,c1,c0
        s = s0,c ⊕ s1,c ⊕ ({02} • s2,c) ⊕ ({03} • s3,c)2,c0
        s = ({03} • s0,c) ⊕ s1,c ⊕ s2,c ⊕ ({02} • s3,c)      
*/

    function[0 : 7] multiplyBy2;
        input [0 : 7] value;
        begin
            // Multiplication by two is done with a shift. If MSB is 1 then also xor with 00011011 x1B
            if(value[0] == 1'h1) begin
                multiplyBy2 = ((value << 1) ^ 8'h1b);
            end else begin
                multiplyBy2 = (value << 1);
            end

        end
    endfunction : multiplyBy2

    function[0 : 7] multiplyBy3;
        input [0 : 7] value;
        begin
            // Multiply by two and xor with itself to add 
            multiplyBy3 = multiplyBy2(value) ^ value;
        end
    endfunction : multiplyBy3

    genvar i;
    generate
        for(i = 0; i < 4; i = i + 1) begin : mix_columns
            assign state_out[i*32 +: 8] = multiplyBy2(state_in[i*32 +:8]) ^ multiplyBy3(state_in[i*32+8 +:8]) ^ state_in[i*32+16 +:8] ^ state_in[i*32+24 +:8];
            assign state_out[i*32+8 +: 8] = state_in[i*32 +:8] ^ multiplyBy2(state_in[i*32+8 +:8]) ^  multiplyBy3(state_in[i*32+16 +:8]) ^ state_in[i*32+24 +:8];
            assign state_out[i*32+16 +: 8] = state_in[i*32 +:8] ^ state_in[i*32+8 +:8] ^ multiplyBy2(state_in[i*32+16 +:8]) ^  multiplyBy3(state_in[i*32+24 +:8]);
            assign state_out[i*32+24 +: 8] = multiplyBy3(state_in[i*32 +:8]) ^ state_in[i*32+8 +:8] ^  state_in[i*32+16 +:8] ^ multiplyBy2(state_in[i*32+24 +:8]);
        end
    endgenerate




endmodule : aes_mix_columns
