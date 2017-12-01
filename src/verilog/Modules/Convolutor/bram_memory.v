`timescale 1ns / 1ps

`define NB_ADDRESS 10
`define RAM_WIDTH 13
`define INIT 0


module bram_memory#( 
	parameter RAM_WIDTH 	= `RAM_WIDTH,    
	parameter NB_ADDRESS 	= `NB_ADDRESS,
	parameter INIT 			= `INIT,
	localparam RAM_DEPTH=(2**NB_ADDRESS)-1
	)(//Definición de puertos
	output [RAM_WIDTH-1:0]   o_data,
	input                    i_wrEnable,
	input                    i_CLK,
	input  [NB_ADDRESS-1:0]  i_writeAdd,
	input  [NB_ADDRESS-1:0]  i_readAdd,
	input  [RAM_WIDTH - 1:0] i_data
	);
	//add
	//input					i_rst;

	//output           [3:0]   o_led;


	//reg           [1:0] go_to_leds;
	reg [RAM_WIDTH-1:0] BRAM [RAM_DEPTH:0];
	reg [RAM_WIDTH-1:0] dout_reg;
	integer ram_index;

	initial begin
		case (INIT)
			1:begin
				BRAM[0] = 13'h07f ;
				BRAM[1] = 13'h07f ;
				BRAM[2] = 13'h07e ;
				BRAM[3] = 13'h07e ;
				BRAM[4] = 13'h07e ;
				BRAM[5] = 13'h07e ;
				BRAM[6] = 13'h07e ;
				BRAM[7] = 13'h07e ;
				BRAM[8] = 13'h07f ;
				BRAM[9] = 13'h07f ;
				BRAM[10] = 13'h07f ;
				BRAM[11] = 13'h07f ;
				BRAM[12] = 13'h07f ;
				BRAM[13] = 13'h07f ;
				BRAM[14] = 13'h07f ;
				BRAM[15] = 13'h07f ;
				BRAM[16] = 13'h07f ;
				BRAM[17] = 13'h07e ;
				BRAM[18] = 13'h07e ;
				BRAM[19] = 13'h07e ;
				BRAM[20] = 13'h07e ;
				BRAM[21] = 13'h07e ;
				BRAM[22] = 13'h07e ;
				BRAM[23] = 13'h07f ;
				BRAM[24] = 13'h07f ;
				BRAM[25] = 13'h07f ;
				BRAM[26] = 13'h07f ;
				BRAM[27] = 13'h07e ;
				BRAM[28] = 13'h07e ;
				BRAM[29] = 13'h07e ;
				BRAM[30] = 13'h07d ;
				BRAM[31] = 13'h07d ;
				BRAM[32] = 13'h07e ;
				BRAM[33] = 13'h07f ;
				BRAM[34] = 13'h07f ;
				BRAM[35] = 13'h07f ;
				BRAM[36] = 13'h07f ;
				BRAM[37] = 13'h07f ;
				BRAM[38] = 13'h07f ;
				BRAM[39] = 13'h07e ;
				BRAM[40] = 13'h07e ;
				BRAM[41] = 13'h07e ;
				BRAM[42] = 13'h07e ;
				BRAM[43] = 13'h07e ;
				BRAM[44] = 13'h07e ;
				BRAM[45] = 13'h07e ;
				BRAM[46] = 13'h07e ;
				BRAM[47] = 13'h07e ;
				BRAM[48] = 13'h07e ;
				BRAM[49] = 13'h07f ;
				BRAM[50] = 13'h07f ;
				BRAM[51] = 13'h07f ;
				BRAM[52] = 13'h07f ;
				BRAM[53] = 13'h07f ;
				BRAM[54] = 13'h07f ;
				BRAM[55] = 13'h07f ;
				BRAM[56] = 13'h07f ;
				BRAM[57] = 13'h07e ;
				BRAM[58] = 13'h07e ;
				BRAM[59] = 13'h07e ;
				BRAM[60] = 13'h07e ;
				BRAM[61] = 13'h07e ;
				BRAM[62] = 13'h07e ;
				BRAM[63] = 13'h07f ;
				BRAM[64] = 13'h07e ;
				BRAM[65] = 13'h07e ;
				BRAM[66] = 13'h07e ;
				BRAM[67] = 13'h07e ;
				BRAM[68] = 13'h07e ;
				BRAM[69] = 13'h07e ;
				BRAM[70] = 13'h07e ;
				BRAM[71] = 13'h07e ;
				BRAM[72] = 13'h07d ;
				BRAM[73] = 13'h07d ;
				BRAM[74] = 13'h07e ;
				BRAM[75] = 13'h07e ;
				BRAM[76] = 13'h07e ;
				BRAM[77] = 13'h07f ;
				BRAM[78] = 13'h07f ;
				BRAM[79] = 13'h07f ;
				BRAM[80] = 13'h07f ;
				BRAM[81] = 13'h07f ;
				BRAM[82] = 13'h07f ;
				BRAM[83] = 13'h07f ;
				BRAM[84] = 13'h07f ;
				BRAM[85] = 13'h07f ;
				BRAM[86] = 13'h07f ;
				BRAM[87] = 13'h07f ;
				BRAM[88] = 13'h07e ;
				BRAM[89] = 13'h07e ;
				BRAM[90] = 13'h07f ;
				BRAM[91] = 13'h07f ;
				BRAM[92] = 13'h07f ;
				BRAM[93] = 13'h07f ;
				BRAM[94] = 13'h07f ;
				BRAM[95] = 13'h07f ;
				BRAM[96] = 13'h07f ;
				BRAM[97] = 13'h07f ;
				BRAM[98] = 13'h07f ;
				BRAM[99] = 13'h07f ;
				BRAM[100] = 13'h07f ;
				BRAM[101] = 13'h07f ;
				BRAM[102] = 13'h07f ;
				BRAM[103] = 13'h07f ;
				BRAM[104] = 13'h07e ;
				BRAM[105] = 13'h07e ;
				BRAM[106] = 13'h07e ;
				BRAM[107] = 13'h07e ;
				BRAM[108] = 13'h07e ;
				BRAM[109] = 13'h07e ;
				BRAM[110] = 13'h07e ;
				BRAM[111] = 13'h07e ;
				BRAM[112] = 13'h07e ;
				BRAM[113] = 13'h07e ;
				BRAM[114] = 13'h07e ;
				BRAM[115] = 13'h07e ;
				BRAM[116] = 13'h07e ;
				BRAM[117] = 13'h07e ;
				BRAM[118] = 13'h07e ;
				BRAM[119] = 13'h07e ;
				BRAM[120] = 13'h07f ;
				BRAM[121] = 13'h07f ;
				BRAM[122] = 13'h07f ;
				BRAM[123] = 13'h07f ;
				BRAM[124] = 13'h07f ;
				BRAM[125] = 13'h07f ;
				BRAM[126] = 13'h07e ;
				BRAM[127] = 13'h07e ;
				BRAM[128] = 13'h07d ;
				BRAM[129] = 13'h07d ;
				BRAM[130] = 13'h07d ;
				BRAM[131] = 13'h07e ;
				BRAM[132] = 13'h07e ;
				BRAM[133] = 13'h07e ;
				BRAM[134] = 13'h07f ;
				BRAM[135] = 13'h07f ;
				BRAM[136] = 13'h07f ;
				BRAM[137] = 13'h07e ;
				BRAM[138] = 13'h07e ;
				BRAM[139] = 13'h07d ;
				BRAM[140] = 13'h07d ;
				BRAM[141] = 13'h07d ;
				BRAM[142] = 13'h07e ;
				BRAM[143] = 13'h07e ;
				BRAM[144] = 13'h07e ;
				BRAM[145] = 13'h07e ;
				BRAM[146] = 13'h07e ;
				BRAM[147] = 13'h07e ;
				BRAM[148] = 13'h07e ;
				BRAM[149] = 13'h07e ;
				BRAM[150] = 13'h07e ;
				BRAM[151] = 13'h07e ;
				BRAM[152] = 13'h07e ;
				BRAM[153] = 13'h07e ;
				BRAM[154] = 13'h07e ;
				BRAM[155] = 13'h07e ;
				BRAM[156] = 13'h07e ;
				BRAM[157] = 13'h07e ;
				BRAM[158] = 13'h07e ;
				BRAM[159] = 13'h07e ;
				BRAM[160] = 13'h07e ;
				BRAM[161] = 13'h07e ;
				BRAM[162] = 13'h07e ;
				BRAM[163] = 13'h07e ;
				BRAM[164] = 13'h07e ;
				BRAM[165] = 13'h07e ;
				BRAM[166] = 13'h07e ;
				BRAM[167] = 13'h07e ;
				BRAM[168] = 13'h07f ;
				BRAM[169] = 13'h07f ;
				BRAM[170] = 13'h07f ;
				BRAM[171] = 13'h07f ;
				BRAM[172] = 13'h07f ;
				BRAM[173] = 13'h07f ;
				BRAM[174] = 13'h07f ;
				BRAM[175] = 13'h07f ;
				BRAM[176] = 13'h07e ;
				BRAM[177] = 13'h07e ;
				BRAM[178] = 13'h07e ;
				BRAM[179] = 13'h07e ;
				BRAM[180] = 13'h07e ;
				BRAM[181] = 13'h07e ;
				BRAM[182] = 13'h07e ;
				BRAM[183] = 13'h07e ;
				BRAM[184] = 13'h07e ;
				BRAM[185] = 13'h07e ;
				BRAM[186] = 13'h07e ;
				BRAM[187] = 13'h07e ;
				BRAM[188] = 13'h07e ;
				BRAM[189] = 13'h07e ;
				BRAM[190] = 13'h07e ;
				BRAM[191] = 13'h07e ;
				BRAM[192] = 13'h07e ;
				BRAM[193] = 13'h07e ;
				BRAM[194] = 13'h07e ;
				BRAM[195] = 13'h07e ;
				BRAM[196] = 13'h07e ;
				BRAM[197] = 13'h07e ;
				BRAM[198] = 13'h07e ;
				BRAM[199] = 13'h07e ;
				BRAM[200] = 13'h07e ;
				BRAM[201] = 13'h07e ;
				BRAM[202] = 13'h07e ;
				BRAM[203] = 13'h07e ;
				BRAM[204] = 13'h07e ;
				BRAM[205] = 13'h07e ;
				BRAM[206] = 13'h07e ;
				BRAM[207] = 13'h07e ;
				BRAM[208] = 13'h07e ;
				BRAM[209] = 13'h07e ;
				BRAM[210] = 13'h07e ;
				BRAM[211] = 13'h07e ;
				BRAM[212] = 13'h07e ;
				BRAM[213] = 13'h07e ;
				BRAM[214] = 13'h07e ;
				BRAM[215] = 13'h07e ;
				BRAM[216] = 13'h07e ;
				BRAM[217] = 13'h07e ;
				BRAM[218] = 13'h07e ;
				BRAM[219] = 13'h07e ;
				BRAM[220] = 13'h07e ;
				BRAM[221] = 13'h07e ;
				BRAM[222] = 13'h07e ;
				BRAM[223] = 13'h07e ;
				BRAM[224] = 13'h07f ;
				BRAM[225] = 13'h07f ;
				BRAM[226] = 13'h07f ;
				BRAM[227] = 13'h07f ;
				BRAM[228] = 13'h07f ;
				BRAM[229] = 13'h07f ;
				BRAM[230] = 13'h07f ;
				BRAM[231] = 13'h07f ;
				BRAM[232] = 13'h07e ;
				BRAM[233] = 13'h07e ;
				BRAM[234] = 13'h07e ;
				BRAM[235] = 13'h07e ;
				BRAM[236] = 13'h07e ;
				BRAM[237] = 13'h07e ;
				BRAM[238] = 13'h07e ;
				BRAM[239] = 13'h07e ;
				BRAM[240] = 13'h07f ;
				BRAM[241] = 13'h07f ;
				BRAM[242] = 13'h07f ;
				BRAM[243] = 13'h07e ;
				BRAM[244] = 13'h07e ;
				BRAM[245] = 13'h07d ;
				BRAM[246] = 13'h07d ;
				BRAM[247] = 13'h07d ;
				BRAM[248] = 13'h07d ;
				BRAM[249] = 13'h07e ;
				BRAM[250] = 13'h07e ;
				BRAM[251] = 13'h07d ;
				BRAM[252] = 13'h07d ;
				BRAM[253] = 13'h07d ;
				BRAM[254] = 13'h07e ;
				BRAM[255] = 13'h07f ;
				BRAM[256] = 13'h07e ;
				BRAM[257] = 13'h07e ;
				BRAM[258] = 13'h07e ;
				BRAM[259] = 13'h07e ;
				BRAM[260] = 13'h07d ;
				BRAM[261] = 13'h07d ;
				BRAM[262] = 13'h07c ;
				BRAM[263] = 13'h07c ;
				BRAM[264] = 13'h07d ;
				BRAM[265] = 13'h07d ;
				BRAM[266] = 13'h07d ;
				BRAM[267] = 13'h07d ;
				BRAM[268] = 13'h07d ;
				BRAM[269] = 13'h07d ;
				BRAM[270] = 13'h07d ;
				BRAM[271] = 13'h07d ;
				BRAM[272] = 13'h07c ;
				BRAM[273] = 13'h07d ;
				BRAM[274] = 13'h07e ;
				BRAM[275] = 13'h07e ;
				BRAM[276] = 13'h07e ;
				BRAM[277] = 13'h07d ;
				BRAM[278] = 13'h07c ;
				BRAM[279] = 13'h07b ;
				BRAM[280] = 13'h07c ;
				BRAM[281] = 13'h07c ;
				BRAM[282] = 13'h07c ;
				BRAM[283] = 13'h07c ;
				BRAM[284] = 13'h07d ;
				BRAM[285] = 13'h07d ;
				BRAM[286] = 13'h07d ;
				BRAM[287] = 13'h07d ;
				BRAM[288] = 13'h07d ;
				BRAM[289] = 13'h07e ;
				BRAM[290] = 13'h07e ;
				BRAM[291] = 13'h07e ;
				BRAM[292] = 13'h07d ;
				BRAM[293] = 13'h07d ;
				BRAM[294] = 13'h07c ;
				BRAM[295] = 13'h07b ;
				BRAM[296] = 13'h07e ;
				BRAM[297] = 13'h07e ;
				BRAM[298] = 13'h07e ;
				BRAM[299] = 13'h07e ;
				BRAM[300] = 13'h07e ;
				BRAM[301] = 13'h07e ;
				BRAM[302] = 13'h07e ;
				BRAM[303] = 13'h07e ;
				BRAM[304] = 13'h07d ;
				BRAM[305] = 13'h07c ;
				BRAM[306] = 13'h07b ;
				BRAM[307] = 13'h07b ;
				BRAM[308] = 13'h07c ;
				BRAM[309] = 13'h07e ;
				BRAM[310] = 13'h07e ;
				BRAM[311] = 13'h07f ;
				BRAM[312] = 13'h07e ;
				BRAM[313] = 13'h07c ;
				BRAM[314] = 13'h07a ;
				BRAM[315] = 13'h079 ;
				BRAM[316] = 13'h079 ;
				BRAM[317] = 13'h07b ;
				BRAM[318] = 13'h07b ;
				BRAM[319] = 13'h07b ;
				BRAM[320] = 13'h07b ;
				BRAM[321] = 13'h07c ;
				BRAM[322] = 13'h07c ;
				BRAM[323] = 13'h07d ;
				BRAM[324] = 13'h07d ;
				BRAM[325] = 13'h07d ;
				BRAM[326] = 13'h07c ;
				BRAM[327] = 13'h07c ;
				BRAM[328] = 13'h075 ;
				BRAM[329] = 13'h078 ;
				BRAM[330] = 13'h07b ;
				BRAM[331] = 13'h07c ;
				BRAM[332] = 13'h07b ;
				BRAM[333] = 13'h07b ;
				BRAM[334] = 13'h07c ;
				BRAM[335] = 13'h07c ;
				BRAM[336] = 13'h07d ;
				BRAM[337] = 13'h07d ;
				BRAM[338] = 13'h07c ;
				BRAM[339] = 13'h07a ;
				BRAM[340] = 13'h078 ;
				BRAM[341] = 13'h079 ;
				BRAM[342] = 13'h07b ;
				BRAM[343] = 13'h07d ;
				BRAM[344] = 13'h07d ;
				BRAM[345] = 13'h07e ;
				BRAM[346] = 13'h07e ;
				BRAM[347] = 13'h07d ;
				BRAM[348] = 13'h07c ;
				BRAM[349] = 13'h07b ;
				BRAM[350] = 13'h07a ;
				BRAM[351] = 13'h07a ;
				BRAM[352] = 13'h07a ;
				BRAM[353] = 13'h07d ;
				BRAM[354] = 13'h07e ;
				BRAM[355] = 13'h07d ;
				BRAM[356] = 13'h07e ;
				BRAM[357] = 13'h07f ;
				BRAM[358] = 13'h07b ;
				BRAM[359] = 13'h074 ;
				BRAM[360] = 13'h073 ;
				BRAM[361] = 13'h075 ;
				BRAM[362] = 13'h076 ;
				BRAM[363] = 13'h076 ;
				BRAM[364] = 13'h076 ;
				BRAM[365] = 13'h078 ;
				BRAM[366] = 13'h07b ;
				BRAM[367] = 13'h07c ;
				BRAM[368] = 13'h07b ;
				BRAM[369] = 13'h07b ;
				BRAM[370] = 13'h07c ;
				BRAM[371] = 13'h07c ;
				BRAM[372] = 13'h07d ;
				BRAM[373] = 13'h07d ;
				BRAM[374] = 13'h07d ;
				BRAM[375] = 13'h07d ;
				BRAM[376] = 13'h07b ;
				BRAM[377] = 13'h07b ;
				BRAM[378] = 13'h07c ;
				BRAM[379] = 13'h07c ;
				BRAM[380] = 13'h07c ;
				BRAM[381] = 13'h07c ;
				BRAM[382] = 13'h07c ;
				BRAM[383] = 13'h07d ;
				BRAM[384] = 13'h07e ;
				BRAM[385] = 13'h07c ;
				BRAM[386] = 13'h07b ;
				BRAM[387] = 13'h07c ;
				BRAM[388] = 13'h07d ;
				BRAM[389] = 13'h07d ;
				BRAM[390] = 13'h07c ;
				BRAM[391] = 13'h07b ;
				BRAM[392] = 13'h07a ;
				BRAM[393] = 13'h078 ;
				BRAM[394] = 13'h077 ;
				BRAM[395] = 13'h078 ;
				BRAM[396] = 13'h079 ;
				BRAM[397] = 13'h078 ;
				BRAM[398] = 13'h074 ;
				BRAM[399] = 13'h071 ;
				BRAM[400] = 13'h071 ;
				BRAM[401] = 13'h078 ;
				BRAM[402] = 13'h07a ;
				BRAM[403] = 13'h076 ;
				BRAM[404] = 13'h077 ;
				BRAM[405] = 13'h07d ;
				BRAM[406] = 13'h07e ;
				BRAM[407] = 13'h079 ;
				BRAM[408] = 13'h079 ;
				BRAM[409] = 13'h079 ;
				BRAM[410] = 13'h07a ;
				BRAM[411] = 13'h07b ;
				BRAM[412] = 13'h07a ;
				BRAM[413] = 13'h079 ;
				BRAM[414] = 13'h079 ;
				BRAM[415] = 13'h07a ;
				BRAM[416] = 13'h07e ;
				BRAM[417] = 13'h07e ;
				BRAM[418] = 13'h07d ;
				BRAM[419] = 13'h07a ;
				BRAM[420] = 13'h079 ;
				BRAM[421] = 13'h079 ;
				BRAM[422] = 13'h07b ;
				BRAM[423] = 13'h07b ;
				BRAM[424] = 13'h079 ;
				BRAM[425] = 13'h07b ;
				BRAM[426] = 13'h07b ;
				BRAM[427] = 13'h076 ;
				BRAM[428] = 13'h071 ;
				BRAM[429] = 13'h06f ;
				BRAM[430] = 13'h073 ;
				BRAM[431] = 13'h078 ;
				BRAM[432] = 13'h07b ;
				BRAM[433] = 13'h079 ;
				BRAM[434] = 13'h077 ;
				BRAM[435] = 13'h076 ;
				BRAM[436] = 13'h077 ;
				BRAM[437] = 13'h079 ;
				BRAM[438] = 13'h078 ;
				BRAM[439] = 13'h076 ;
				for (ram_index = 440; ram_index <= RAM_DEPTH; ram_index = ram_index + 1)
					BRAM[ram_index] = {RAM_WIDTH{1'b1}};
			end
			2:begin
				BRAM[0] = 13'h07f ;
				BRAM[1] = 13'h07f ;
				BRAM[2] = 13'h07e ;
				BRAM[3] = 13'h07e ;
				BRAM[4] = 13'h07e ;
				BRAM[5] = 13'h07e ;
				BRAM[6] = 13'h07e ;
				BRAM[7] = 13'h07e ;
				BRAM[8] = 13'h07f ;
				BRAM[9] = 13'h07f ;
				BRAM[10] = 13'h07f ;
				BRAM[11] = 13'h07f ;
				BRAM[12] = 13'h07f ;
				BRAM[13] = 13'h07f ;
				BRAM[14] = 13'h07f ;
				BRAM[15] = 13'h07f ;
				BRAM[16] = 13'h07f ;
				BRAM[17] = 13'h07e ;
				BRAM[18] = 13'h07e ;
				BRAM[19] = 13'h07e ;
				BRAM[20] = 13'h07e ;
				BRAM[21] = 13'h07e ;
				BRAM[22] = 13'h07e ;
				BRAM[23] = 13'h07f ;
				BRAM[24] = 13'h07f ;
				BRAM[25] = 13'h07f ;
				BRAM[26] = 13'h07f ;
				BRAM[27] = 13'h07e ;
				BRAM[28] = 13'h07e ;
				BRAM[29] = 13'h07e ;
				BRAM[30] = 13'h07d ;
				BRAM[31] = 13'h07d ;
				BRAM[32] = 13'h07e ;
				BRAM[33] = 13'h07f ;
				BRAM[34] = 13'h07f ;
				BRAM[35] = 13'h07f ;
				BRAM[36] = 13'h07f ;
				BRAM[37] = 13'h07f ;
				BRAM[38] = 13'h07f ;
				BRAM[39] = 13'h07e ;
				BRAM[40] = 13'h07e ;
				BRAM[41] = 13'h07e ;
				BRAM[42] = 13'h07e ;
				BRAM[43] = 13'h07e ;
				BRAM[44] = 13'h07e ;
				BRAM[45] = 13'h07e ;
				BRAM[46] = 13'h07e ;
				BRAM[47] = 13'h07e ;
				BRAM[48] = 13'h07e ;
				BRAM[49] = 13'h07f ;
				BRAM[50] = 13'h07f ;
				BRAM[51] = 13'h07f ;
				BRAM[52] = 13'h07f ;
				BRAM[53] = 13'h07f ;
				BRAM[54] = 13'h07f ;
				BRAM[55] = 13'h07f ;
				BRAM[56] = 13'h07f ;
				BRAM[57] = 13'h07e ;
				BRAM[58] = 13'h07e ;
				BRAM[59] = 13'h07e ;
				BRAM[60] = 13'h07e ;
				BRAM[61] = 13'h07e ;
				BRAM[62] = 13'h07e ;
				BRAM[63] = 13'h07f ;
				BRAM[64] = 13'h07e ;
				BRAM[65] = 13'h07e ;
				BRAM[66] = 13'h07e ;
				BRAM[67] = 13'h07e ;
				BRAM[68] = 13'h07e ;
				BRAM[69] = 13'h07e ;
				BRAM[70] = 13'h07e ;
				BRAM[71] = 13'h07e ;
				BRAM[72] = 13'h07d ;
				BRAM[73] = 13'h07d ;
				BRAM[74] = 13'h07e ;
				BRAM[75] = 13'h07e ;
				BRAM[76] = 13'h07e ;
				BRAM[77] = 13'h07f ;
				BRAM[78] = 13'h07f ;
				BRAM[79] = 13'h07f ;
				BRAM[80] = 13'h07f ;
				BRAM[81] = 13'h07f ;
				BRAM[82] = 13'h07f ;
				BRAM[83] = 13'h07f ;
				BRAM[84] = 13'h07f ;
				BRAM[85] = 13'h07f ;
				BRAM[86] = 13'h07f ;
				BRAM[87] = 13'h07f ;
				BRAM[88] = 13'h07e ;
				BRAM[89] = 13'h07e ;
				BRAM[90] = 13'h07f ;
				BRAM[91] = 13'h07f ;
				BRAM[92] = 13'h07f ;
				BRAM[93] = 13'h07f ;
				BRAM[94] = 13'h07f ;
				BRAM[95] = 13'h07f ;
				BRAM[96] = 13'h07f ;
				BRAM[97] = 13'h07f ;
				BRAM[98] = 13'h07f ;
				BRAM[99] = 13'h07f ;
				BRAM[100] = 13'h07f ;
				BRAM[101] = 13'h07f ;
				BRAM[102] = 13'h07f ;
				BRAM[103] = 13'h07f ;
				BRAM[104] = 13'h07e ;
				BRAM[105] = 13'h07e ;
				BRAM[106] = 13'h07e ;
				BRAM[107] = 13'h07e ;
				BRAM[108] = 13'h07e ;
				BRAM[109] = 13'h07e ;
				BRAM[110] = 13'h07e ;
				BRAM[111] = 13'h07e ;
				BRAM[112] = 13'h07e ;
				BRAM[113] = 13'h07e ;
				BRAM[114] = 13'h07e ;
				BRAM[115] = 13'h07e ;
				BRAM[116] = 13'h07e ;
				BRAM[117] = 13'h07e ;
				BRAM[118] = 13'h07e ;
				BRAM[119] = 13'h07e ;
				BRAM[120] = 13'h07f ;
				BRAM[121] = 13'h07f ;
				BRAM[122] = 13'h07f ;
				BRAM[123] = 13'h07f ;
				BRAM[124] = 13'h07f ;
				BRAM[125] = 13'h07f ;
				BRAM[126] = 13'h07e ;
				BRAM[127] = 13'h07e ;
				BRAM[128] = 13'h07d ;
				BRAM[129] = 13'h07d ;
				BRAM[130] = 13'h07d ;
				BRAM[131] = 13'h07e ;
				BRAM[132] = 13'h07e ;
				BRAM[133] = 13'h07e ;
				BRAM[134] = 13'h07f ;
				BRAM[135] = 13'h07f ;
				BRAM[136] = 13'h07f ;
				BRAM[137] = 13'h07e ;
				BRAM[138] = 13'h07e ;
				BRAM[139] = 13'h07d ;
				BRAM[140] = 13'h07d ;
				BRAM[141] = 13'h07d ;
				BRAM[142] = 13'h07e ;
				BRAM[143] = 13'h07e ;
				BRAM[144] = 13'h07e ;
				BRAM[145] = 13'h07e ;
				BRAM[146] = 13'h07e ;
				BRAM[147] = 13'h07e ;
				BRAM[148] = 13'h07e ;
				BRAM[149] = 13'h07e ;
				BRAM[150] = 13'h07e ;
				BRAM[151] = 13'h07e ;
				BRAM[152] = 13'h07e ;
				BRAM[153] = 13'h07e ;
				BRAM[154] = 13'h07e ;
				BRAM[155] = 13'h07e ;
				BRAM[156] = 13'h07e ;
				BRAM[157] = 13'h07e ;
				BRAM[158] = 13'h07e ;
				BRAM[159] = 13'h07e ;
				BRAM[160] = 13'h07e ;
				BRAM[161] = 13'h07e ;
				BRAM[162] = 13'h07e ;
				BRAM[163] = 13'h07e ;
				BRAM[164] = 13'h07e ;
				BRAM[165] = 13'h07e ;
				BRAM[166] = 13'h07e ;
				BRAM[167] = 13'h07e ;
				BRAM[168] = 13'h07f ;
				BRAM[169] = 13'h07f ;
				BRAM[170] = 13'h07f ;
				BRAM[171] = 13'h07f ;
				BRAM[172] = 13'h07f ;
				BRAM[173] = 13'h07f ;
				BRAM[174] = 13'h07f ;
				BRAM[175] = 13'h07f ;
				BRAM[176] = 13'h07e ;
				BRAM[177] = 13'h07e ;
				BRAM[178] = 13'h07e ;
				BRAM[179] = 13'h07e ;
				BRAM[180] = 13'h07e ;
				BRAM[181] = 13'h07e ;
				BRAM[182] = 13'h07e ;
				BRAM[183] = 13'h07e ;
				BRAM[184] = 13'h07e ;
				BRAM[185] = 13'h07e ;
				BRAM[186] = 13'h07e ;
				BRAM[187] = 13'h07e ;
				BRAM[188] = 13'h07e ;
				BRAM[189] = 13'h07e ;
				BRAM[190] = 13'h07e ;
				BRAM[191] = 13'h07e ;
				BRAM[192] = 13'h07e ;
				BRAM[193] = 13'h07e ;
				BRAM[194] = 13'h07e ;
				BRAM[195] = 13'h07e ;
				BRAM[196] = 13'h07e ;
				BRAM[197] = 13'h07e ;
				BRAM[198] = 13'h07e ;
				BRAM[199] = 13'h07e ;
				BRAM[200] = 13'h07e ;
				BRAM[201] = 13'h07e ;
				BRAM[202] = 13'h07e ;
				BRAM[203] = 13'h07e ;
				BRAM[204] = 13'h07e ;
				BRAM[205] = 13'h07e ;
				BRAM[206] = 13'h07e ;
				BRAM[207] = 13'h07e ;
				BRAM[208] = 13'h07e ;
				BRAM[209] = 13'h07e ;
				BRAM[210] = 13'h07e ;
				BRAM[211] = 13'h07e ;
				BRAM[212] = 13'h07e ;
				BRAM[213] = 13'h07e ;
				BRAM[214] = 13'h07e ;
				BRAM[215] = 13'h07e ;
				BRAM[216] = 13'h07e ;
				BRAM[217] = 13'h07e ;
				BRAM[218] = 13'h07e ;
				BRAM[219] = 13'h07e ;
				BRAM[220] = 13'h07e ;
				BRAM[221] = 13'h07e ;
				BRAM[222] = 13'h07e ;
				BRAM[223] = 13'h07e ;
				BRAM[224] = 13'h07f ;
				BRAM[225] = 13'h07f ;
				BRAM[226] = 13'h07f ;
				BRAM[227] = 13'h07f ;
				BRAM[228] = 13'h07f ;
				BRAM[229] = 13'h07f ;
				BRAM[230] = 13'h07f ;
				BRAM[231] = 13'h07f ;
				BRAM[232] = 13'h07e ;
				BRAM[233] = 13'h07e ;
				BRAM[234] = 13'h07e ;
				BRAM[235] = 13'h07e ;
				BRAM[236] = 13'h07e ;
				BRAM[237] = 13'h07e ;
				BRAM[238] = 13'h07e ;
				BRAM[239] = 13'h07e ;
				BRAM[240] = 13'h07f ;
				BRAM[241] = 13'h07f ;
				BRAM[242] = 13'h07f ;
				BRAM[243] = 13'h07e ;
				BRAM[244] = 13'h07e ;
				BRAM[245] = 13'h07e ;
				BRAM[246] = 13'h07d ;
				BRAM[247] = 13'h07d ;
				BRAM[248] = 13'h07e ;
				BRAM[249] = 13'h07e ;
				BRAM[250] = 13'h07e ;
				BRAM[251] = 13'h07d ;
				BRAM[252] = 13'h07d ;
				BRAM[253] = 13'h07d ;
				BRAM[254] = 13'h07e ;
				BRAM[255] = 13'h07f ;
				BRAM[256] = 13'h07e ;
				BRAM[257] = 13'h07e ;
				BRAM[258] = 13'h07e ;
				BRAM[259] = 13'h07e ;
				BRAM[260] = 13'h07d ;
				BRAM[261] = 13'h07d ;
				BRAM[262] = 13'h07d ;
				BRAM[263] = 13'h07c ;
				BRAM[264] = 13'h07d ;
				BRAM[265] = 13'h07d ;
				BRAM[266] = 13'h07d ;
				BRAM[267] = 13'h07d ;
				BRAM[268] = 13'h07d ;
				BRAM[269] = 13'h07d ;
				BRAM[270] = 13'h07d ;
				BRAM[271] = 13'h07d ;
				BRAM[272] = 13'h07d ;
				BRAM[273] = 13'h07d ;
				BRAM[274] = 13'h07e ;
				BRAM[275] = 13'h07e ;
				BRAM[276] = 13'h07e ;
				BRAM[277] = 13'h07d ;
				BRAM[278] = 13'h07c ;
				BRAM[279] = 13'h07c ;
				BRAM[280] = 13'h07c ;
				BRAM[281] = 13'h07c ;
				BRAM[282] = 13'h07c ;
				BRAM[283] = 13'h07d ;
				BRAM[284] = 13'h07d ;
				BRAM[285] = 13'h07d ;
				BRAM[286] = 13'h07d ;
				BRAM[287] = 13'h07d ;
				BRAM[288] = 13'h07d ;
				BRAM[289] = 13'h07d ;
				BRAM[290] = 13'h07e ;
				BRAM[291] = 13'h07d ;
				BRAM[292] = 13'h07d ;
				BRAM[293] = 13'h07c ;
				BRAM[294] = 13'h07c ;
				BRAM[295] = 13'h07b ;
				BRAM[296] = 13'h07e ;
				BRAM[297] = 13'h07e ;
				BRAM[298] = 13'h07e ;
				BRAM[299] = 13'h07e ;
				BRAM[300] = 13'h07e ;
				BRAM[301] = 13'h07e ;
				BRAM[302] = 13'h07e ;
				BRAM[303] = 13'h07e ;
				BRAM[304] = 13'h07d ;
				BRAM[305] = 13'h07c ;
				BRAM[306] = 13'h07b ;
				BRAM[307] = 13'h07b ;
				BRAM[308] = 13'h07c ;
				BRAM[309] = 13'h07d ;
				BRAM[310] = 13'h07e ;
				BRAM[311] = 13'h07e ;
				BRAM[312] = 13'h07e ;
				BRAM[313] = 13'h07c ;
				BRAM[314] = 13'h07a ;
				BRAM[315] = 13'h079 ;
				BRAM[316] = 13'h079 ;
				BRAM[317] = 13'h07a ;
				BRAM[318] = 13'h07a ;
				BRAM[319] = 13'h07a ;
				BRAM[320] = 13'h07b ;
				BRAM[321] = 13'h07b ;
				BRAM[322] = 13'h07c ;
				BRAM[323] = 13'h07d ;
				BRAM[324] = 13'h07d ;
				BRAM[325] = 13'h07d ;
				BRAM[326] = 13'h07d ;
				BRAM[327] = 13'h07c ;
				BRAM[328] = 13'h076 ;
				BRAM[329] = 13'h079 ;
				BRAM[330] = 13'h07b ;
				BRAM[331] = 13'h07b ;
				BRAM[332] = 13'h079 ;
				BRAM[333] = 13'h078 ;
				BRAM[334] = 13'h079 ;
				BRAM[335] = 13'h07b ;
				BRAM[336] = 13'h07c ;
				BRAM[337] = 13'h07c ;
				BRAM[338] = 13'h07b ;
				BRAM[339] = 13'h07a ;
				BRAM[340] = 13'h079 ;
				BRAM[341] = 13'h079 ;
				BRAM[342] = 13'h07b ;
				BRAM[343] = 13'h07d ;
				BRAM[344] = 13'h07e ;
				BRAM[345] = 13'h07d ;
				BRAM[346] = 13'h07d ;
				BRAM[347] = 13'h07d ;
				BRAM[348] = 13'h07c ;
				BRAM[349] = 13'h07b ;
				BRAM[350] = 13'h079 ;
				BRAM[351] = 13'h078 ;
				BRAM[352] = 13'h078 ;
				BRAM[353] = 13'h07b ;
				BRAM[354] = 13'h07d ;
				BRAM[355] = 13'h07d ;
				BRAM[356] = 13'h07f ;
				BRAM[357] = 13'h07f ;
				BRAM[358] = 13'h07b ;
				BRAM[359] = 13'h074 ;
				BRAM[360] = 13'h073 ;
				BRAM[361] = 13'h075 ;
				BRAM[362] = 13'h076 ;
				BRAM[363] = 13'h075 ;
				BRAM[364] = 13'h076 ;
				BRAM[365] = 13'h078 ;
				BRAM[366] = 13'h07b ;
				BRAM[367] = 13'h07c ;
				BRAM[368] = 13'h07c ;
				BRAM[369] = 13'h07c ;
				BRAM[370] = 13'h07c ;
				BRAM[371] = 13'h07c ;
				BRAM[372] = 13'h07c ;
				BRAM[373] = 13'h07d ;
				BRAM[374] = 13'h07d ;
				BRAM[375] = 13'h07d ;
				BRAM[376] = 13'h07c ;
				BRAM[377] = 13'h07c ;
				BRAM[378] = 13'h07c ;
				BRAM[379] = 13'h07c ;
				BRAM[380] = 13'h07c ;
				BRAM[381] = 13'h07c ;
				BRAM[382] = 13'h07d ;
				BRAM[383] = 13'h07d ;
				BRAM[384] = 13'h07e ;
				BRAM[385] = 13'h07d ;
				BRAM[386] = 13'h07c ;
				BRAM[387] = 13'h07c ;
				BRAM[388] = 13'h07d ;
				BRAM[389] = 13'h07d ;
				BRAM[390] = 13'h07c ;
				BRAM[391] = 13'h07b ;
				BRAM[392] = 13'h079 ;
				BRAM[393] = 13'h078 ;
				BRAM[394] = 13'h077 ;
				BRAM[395] = 13'h078 ;
				BRAM[396] = 13'h079 ;
				BRAM[397] = 13'h079 ;
				BRAM[398] = 13'h075 ;
				BRAM[399] = 13'h072 ;
				BRAM[400] = 13'h073 ;
				BRAM[401] = 13'h078 ;
				BRAM[402] = 13'h078 ;
				BRAM[403] = 13'h074 ;
				BRAM[404] = 13'h075 ;
				BRAM[405] = 13'h07b ;
				BRAM[406] = 13'h07d ;
				BRAM[407] = 13'h07b ;
				BRAM[408] = 13'h079 ;
				BRAM[409] = 13'h079 ;
				BRAM[410] = 13'h07a ;
				BRAM[411] = 13'h07b ;
				BRAM[412] = 13'h07b ;
				BRAM[413] = 13'h079 ;
				BRAM[414] = 13'h079 ;
				BRAM[415] = 13'h07b ;
				BRAM[416] = 13'h07e ;
				BRAM[417] = 13'h07d ;
				BRAM[418] = 13'h07b ;
				BRAM[419] = 13'h078 ;
				BRAM[420] = 13'h076 ;
				BRAM[421] = 13'h077 ;
				BRAM[422] = 13'h079 ;
				BRAM[423] = 13'h079 ;
				BRAM[424] = 13'h07b ;
				BRAM[425] = 13'h07c ;
				BRAM[426] = 13'h07b ;
				BRAM[427] = 13'h077 ;
				BRAM[428] = 13'h072 ;
				BRAM[429] = 13'h071 ;
				BRAM[430] = 13'h073 ;
				BRAM[431] = 13'h077 ;
				BRAM[432] = 13'h07b ;
				BRAM[433] = 13'h079 ;
				BRAM[434] = 13'h078 ;
				BRAM[435] = 13'h077 ;
				BRAM[436] = 13'h078 ;
				BRAM[437] = 13'h079 ;
				BRAM[438] = 13'h077 ;
				BRAM[439] = 13'h074 ;
				for (ram_index = 440; ram_index <= RAM_DEPTH; ram_index = ram_index + 1)
					BRAM[ram_index] = {RAM_WIDTH{1'b1}};
			end
			3:begin
				BRAM[0] = 13'h07f ;
				BRAM[1] = 13'h07f ;
				BRAM[2] = 13'h07e ;
				BRAM[3] = 13'h07e ;
				BRAM[4] = 13'h07e ;
				BRAM[5] = 13'h07e ;
				BRAM[6] = 13'h07e ;
				BRAM[7] = 13'h07e ;
				BRAM[8] = 13'h07f ;
				BRAM[9] = 13'h07f ;
				BRAM[10] = 13'h07f ;
				BRAM[11] = 13'h07f ;
				BRAM[12] = 13'h07f ;
				BRAM[13] = 13'h07f ;
				BRAM[14] = 13'h07f ;
				BRAM[15] = 13'h07f ;
				BRAM[16] = 13'h07f ;
				BRAM[17] = 13'h07e ;
				BRAM[18] = 13'h07e ;
				BRAM[19] = 13'h07e ;
				BRAM[20] = 13'h07e ;
				BRAM[21] = 13'h07e ;
				BRAM[22] = 13'h07e ;
				BRAM[23] = 13'h07f ;
				BRAM[24] = 13'h07f ;
				BRAM[25] = 13'h07f ;
				BRAM[26] = 13'h07f ;
				BRAM[27] = 13'h07e ;
				BRAM[28] = 13'h07e ;
				BRAM[29] = 13'h07e ;
				BRAM[30] = 13'h07d ;
				BRAM[31] = 13'h07d ;
				BRAM[32] = 13'h07e ;
				BRAM[33] = 13'h07f ;
				BRAM[34] = 13'h07f ;
				BRAM[35] = 13'h07f ;
				BRAM[36] = 13'h07f ;
				BRAM[37] = 13'h07f ;
				BRAM[38] = 13'h07f ;
				BRAM[39] = 13'h07e ;
				BRAM[40] = 13'h07e ;
				BRAM[41] = 13'h07e ;
				BRAM[42] = 13'h07e ;
				BRAM[43] = 13'h07e ;
				BRAM[44] = 13'h07e ;
				BRAM[45] = 13'h07e ;
				BRAM[46] = 13'h07e ;
				BRAM[47] = 13'h07e ;
				BRAM[48] = 13'h07e ;
				BRAM[49] = 13'h07f ;
				BRAM[50] = 13'h07f ;
				BRAM[51] = 13'h07f ;
				BRAM[52] = 13'h07f ;
				BRAM[53] = 13'h07f ;
				BRAM[54] = 13'h07f ;
				BRAM[55] = 13'h07f ;
				BRAM[56] = 13'h07f ;
				BRAM[57] = 13'h07e ;
				BRAM[58] = 13'h07e ;
				BRAM[59] = 13'h07e ;
				BRAM[60] = 13'h07e ;
				BRAM[61] = 13'h07e ;
				BRAM[62] = 13'h07e ;
				BRAM[63] = 13'h07f ;
				BRAM[64] = 13'h07e ;
				BRAM[65] = 13'h07e ;
				BRAM[66] = 13'h07e ;
				BRAM[67] = 13'h07e ;
				BRAM[68] = 13'h07e ;
				BRAM[69] = 13'h07e ;
				BRAM[70] = 13'h07e ;
				BRAM[71] = 13'h07e ;
				BRAM[72] = 13'h07d ;
				BRAM[73] = 13'h07d ;
				BRAM[74] = 13'h07e ;
				BRAM[75] = 13'h07e ;
				BRAM[76] = 13'h07e ;
				BRAM[77] = 13'h07f ;
				BRAM[78] = 13'h07f ;
				BRAM[79] = 13'h07f ;
				BRAM[80] = 13'h07f ;
				BRAM[81] = 13'h07f ;
				BRAM[82] = 13'h07f ;
				BRAM[83] = 13'h07f ;
				BRAM[84] = 13'h07f ;
				BRAM[85] = 13'h07f ;
				BRAM[86] = 13'h07f ;
				BRAM[87] = 13'h07f ;
				BRAM[88] = 13'h07f ;
				BRAM[89] = 13'h07f ;
				BRAM[90] = 13'h07f ;
				BRAM[91] = 13'h07f ;
				BRAM[92] = 13'h07f ;
				BRAM[93] = 13'h07f ;
				BRAM[94] = 13'h07f ;
				BRAM[95] = 13'h07f ;
				BRAM[96] = 13'h07f ;
				BRAM[97] = 13'h07f ;
				BRAM[98] = 13'h07f ;
				BRAM[99] = 13'h07f ;
				BRAM[100] = 13'h07f ;
				BRAM[101] = 13'h07f ;
				BRAM[102] = 13'h07f ;
				BRAM[103] = 13'h07f ;
				BRAM[104] = 13'h07e ;
				BRAM[105] = 13'h07e ;
				BRAM[106] = 13'h07e ;
				BRAM[107] = 13'h07e ;
				BRAM[108] = 13'h07e ;
				BRAM[109] = 13'h07e ;
				BRAM[110] = 13'h07e ;
				BRAM[111] = 13'h07e ;
				BRAM[112] = 13'h07e ;
				BRAM[113] = 13'h07e ;
				BRAM[114] = 13'h07e ;
				BRAM[115] = 13'h07e ;
				BRAM[116] = 13'h07e ;
				BRAM[117] = 13'h07e ;
				BRAM[118] = 13'h07e ;
				BRAM[119] = 13'h07e ;
				BRAM[120] = 13'h07f ;
				BRAM[121] = 13'h07f ;
				BRAM[122] = 13'h07f ;
				BRAM[123] = 13'h07f ;
				BRAM[124] = 13'h07f ;
				BRAM[125] = 13'h07f ;
				BRAM[126] = 13'h07e ;
				BRAM[127] = 13'h07e ;
				BRAM[128] = 13'h07d ;
				BRAM[129] = 13'h07d ;
				BRAM[130] = 13'h07d ;
				BRAM[131] = 13'h07e ;
				BRAM[132] = 13'h07e ;
				BRAM[133] = 13'h07e ;
				BRAM[134] = 13'h07e ;
				BRAM[135] = 13'h07f ;
				BRAM[136] = 13'h07f ;
				BRAM[137] = 13'h07e ;
				BRAM[138] = 13'h07e ;
				BRAM[139] = 13'h07d ;
				BRAM[140] = 13'h07d ;
				BRAM[141] = 13'h07d ;
				BRAM[142] = 13'h07e ;
				BRAM[143] = 13'h07e ;
				BRAM[144] = 13'h07e ;
				BRAM[145] = 13'h07e ;
				BRAM[146] = 13'h07e ;
				BRAM[147] = 13'h07e ;
				BRAM[148] = 13'h07e ;
				BRAM[149] = 13'h07e ;
				BRAM[150] = 13'h07e ;
				BRAM[151] = 13'h07e ;
				BRAM[152] = 13'h07e ;
				BRAM[153] = 13'h07e ;
				BRAM[154] = 13'h07e ;
				BRAM[155] = 13'h07e ;
				BRAM[156] = 13'h07e ;
				BRAM[157] = 13'h07e ;
				BRAM[158] = 13'h07e ;
				BRAM[159] = 13'h07e ;
				BRAM[160] = 13'h07e ;
				BRAM[161] = 13'h07e ;
				BRAM[162] = 13'h07e ;
				BRAM[163] = 13'h07e ;
				BRAM[164] = 13'h07e ;
				BRAM[165] = 13'h07e ;
				BRAM[166] = 13'h07e ;
				BRAM[167] = 13'h07e ;
				BRAM[168] = 13'h07f ;
				BRAM[169] = 13'h07f ;
				BRAM[170] = 13'h07f ;
				BRAM[171] = 13'h07f ;
				BRAM[172] = 13'h07f ;
				BRAM[173] = 13'h07f ;
				BRAM[174] = 13'h07f ;
				BRAM[175] = 13'h07f ;
				BRAM[176] = 13'h07e ;
				BRAM[177] = 13'h07e ;
				BRAM[178] = 13'h07e ;
				BRAM[179] = 13'h07e ;
				BRAM[180] = 13'h07e ;
				BRAM[181] = 13'h07e ;
				BRAM[182] = 13'h07e ;
				BRAM[183] = 13'h07e ;
				BRAM[184] = 13'h07e ;
				BRAM[185] = 13'h07e ;
				BRAM[186] = 13'h07e ;
				BRAM[187] = 13'h07e ;
				BRAM[188] = 13'h07e ;
				BRAM[189] = 13'h07e ;
				BRAM[190] = 13'h07e ;
				BRAM[191] = 13'h07e ;
				BRAM[192] = 13'h07e ;
				BRAM[193] = 13'h07e ;
				BRAM[194] = 13'h07e ;
				BRAM[195] = 13'h07e ;
				BRAM[196] = 13'h07e ;
				BRAM[197] = 13'h07e ;
				BRAM[198] = 13'h07e ;
				BRAM[199] = 13'h07e ;
				BRAM[200] = 13'h07e ;
				BRAM[201] = 13'h07e ;
				BRAM[202] = 13'h07e ;
				BRAM[203] = 13'h07e ;
				BRAM[204] = 13'h07e ;
				BRAM[205] = 13'h07e ;
				BRAM[206] = 13'h07e ;
				BRAM[207] = 13'h07e ;
				BRAM[208] = 13'h07e ;
				BRAM[209] = 13'h07e ;
				BRAM[210] = 13'h07e ;
				BRAM[211] = 13'h07e ;
				BRAM[212] = 13'h07e ;
				BRAM[213] = 13'h07e ;
				BRAM[214] = 13'h07e ;
				BRAM[215] = 13'h07e ;
				BRAM[216] = 13'h07e ;
				BRAM[217] = 13'h07e ;
				BRAM[218] = 13'h07e ;
				BRAM[219] = 13'h07e ;
				BRAM[220] = 13'h07e ;
				BRAM[221] = 13'h07e ;
				BRAM[222] = 13'h07e ;
				BRAM[223] = 13'h07e ;
				BRAM[224] = 13'h07f ;
				BRAM[225] = 13'h07f ;
				BRAM[226] = 13'h07f ;
				BRAM[227] = 13'h07f ;
				BRAM[228] = 13'h07f ;
				BRAM[229] = 13'h07f ;
				BRAM[230] = 13'h07f ;
				BRAM[231] = 13'h07f ;
				BRAM[232] = 13'h07e ;
				BRAM[233] = 13'h07e ;
				BRAM[234] = 13'h07e ;
				BRAM[235] = 13'h07e ;
				BRAM[236] = 13'h07e ;
				BRAM[237] = 13'h07e ;
				BRAM[238] = 13'h07e ;
				BRAM[239] = 13'h07e ;
				BRAM[240] = 13'h07e ;
				BRAM[241] = 13'h07e ;
				BRAM[242] = 13'h07e ;
				BRAM[243] = 13'h07e ;
				BRAM[244] = 13'h07e ;
				BRAM[245] = 13'h07e ;
				BRAM[246] = 13'h07e ;
				BRAM[247] = 13'h07e ;
				BRAM[248] = 13'h07e ;
				BRAM[249] = 13'h07f ;
				BRAM[250] = 13'h07e ;
				BRAM[251] = 13'h07e ;
				BRAM[252] = 13'h07d ;
				BRAM[253] = 13'h07c ;
				BRAM[254] = 13'h07d ;
				BRAM[255] = 13'h07e ;
				BRAM[256] = 13'h07e ;
				BRAM[257] = 13'h07e ;
				BRAM[258] = 13'h07e ;
				BRAM[259] = 13'h07e ;
				BRAM[260] = 13'h07d ;
				BRAM[261] = 13'h07d ;
				BRAM[262] = 13'h07d ;
				BRAM[263] = 13'h07d ;
				BRAM[264] = 13'h07d ;
				BRAM[265] = 13'h07d ;
				BRAM[266] = 13'h07d ;
				BRAM[267] = 13'h07d ;
				BRAM[268] = 13'h07d ;
				BRAM[269] = 13'h07d ;
				BRAM[270] = 13'h07d ;
				BRAM[271] = 13'h07d ;
				BRAM[272] = 13'h07d ;
				BRAM[273] = 13'h07d ;
				BRAM[274] = 13'h07d ;
				BRAM[275] = 13'h07d ;
				BRAM[276] = 13'h07d ;
				BRAM[277] = 13'h07d ;
				BRAM[278] = 13'h07d ;
				BRAM[279] = 13'h07d ;
				BRAM[280] = 13'h07d ;
				BRAM[281] = 13'h07d ;
				BRAM[282] = 13'h07d ;
				BRAM[283] = 13'h07d ;
				BRAM[284] = 13'h07d ;
				BRAM[285] = 13'h07c ;
				BRAM[286] = 13'h07c ;
				BRAM[287] = 13'h07c ;
				BRAM[288] = 13'h07d ;
				BRAM[289] = 13'h07d ;
				BRAM[290] = 13'h07d ;
				BRAM[291] = 13'h07d ;
				BRAM[292] = 13'h07d ;
				BRAM[293] = 13'h07c ;
				BRAM[294] = 13'h07c ;
				BRAM[295] = 13'h07b ;
				BRAM[296] = 13'h07e ;
				BRAM[297] = 13'h07e ;
				BRAM[298] = 13'h07e ;
				BRAM[299] = 13'h07e ;
				BRAM[300] = 13'h07e ;
				BRAM[301] = 13'h07e ;
				BRAM[302] = 13'h07e ;
				BRAM[303] = 13'h07e ;
				BRAM[304] = 13'h07c ;
				BRAM[305] = 13'h07b ;
				BRAM[306] = 13'h07a ;
				BRAM[307] = 13'h07a ;
				BRAM[308] = 13'h07b ;
				BRAM[309] = 13'h07c ;
				BRAM[310] = 13'h07d ;
				BRAM[311] = 13'h07d ;
				BRAM[312] = 13'h07e ;
				BRAM[313] = 13'h07d ;
				BRAM[314] = 13'h07b ;
				BRAM[315] = 13'h07a ;
				BRAM[316] = 13'h079 ;
				BRAM[317] = 13'h079 ;
				BRAM[318] = 13'h079 ;
				BRAM[319] = 13'h078 ;
				BRAM[320] = 13'h07b ;
				BRAM[321] = 13'h07b ;
				BRAM[322] = 13'h07c ;
				BRAM[323] = 13'h07d ;
				BRAM[324] = 13'h07d ;
				BRAM[325] = 13'h07d ;
				BRAM[326] = 13'h07d ;
				BRAM[327] = 13'h07d ;
				BRAM[328] = 13'h078 ;
				BRAM[329] = 13'h07b ;
				BRAM[330] = 13'h07c ;
				BRAM[331] = 13'h079 ;
				BRAM[332] = 13'h076 ;
				BRAM[333] = 13'h074 ;
				BRAM[334] = 13'h076 ;
				BRAM[335] = 13'h079 ;
				BRAM[336] = 13'h07c ;
				BRAM[337] = 13'h07c ;
				BRAM[338] = 13'h07b ;
				BRAM[339] = 13'h07b ;
				BRAM[340] = 13'h07a ;
				BRAM[341] = 13'h07b ;
				BRAM[342] = 13'h07c ;
				BRAM[343] = 13'h07d ;
				BRAM[344] = 13'h07d ;
				BRAM[345] = 13'h07d ;
				BRAM[346] = 13'h07c ;
				BRAM[347] = 13'h07d ;
				BRAM[348] = 13'h07d ;
				BRAM[349] = 13'h07c ;
				BRAM[350] = 13'h079 ;
				BRAM[351] = 13'h077 ;
				BRAM[352] = 13'h077 ;
				BRAM[353] = 13'h079 ;
				BRAM[354] = 13'h07b ;
				BRAM[355] = 13'h07c ;
				BRAM[356] = 13'h07e ;
				BRAM[357] = 13'h07e ;
				BRAM[358] = 13'h07a ;
				BRAM[359] = 13'h074 ;
				BRAM[360] = 13'h073 ;
				BRAM[361] = 13'h075 ;
				BRAM[362] = 13'h076 ;
				BRAM[363] = 13'h074 ;
				BRAM[364] = 13'h075 ;
				BRAM[365] = 13'h078 ;
				BRAM[366] = 13'h07b ;
				BRAM[367] = 13'h07c ;
				BRAM[368] = 13'h07d ;
				BRAM[369] = 13'h07c ;
				BRAM[370] = 13'h07c ;
				BRAM[371] = 13'h07c ;
				BRAM[372] = 13'h07c ;
				BRAM[373] = 13'h07c ;
				BRAM[374] = 13'h07d ;
				BRAM[375] = 13'h07d ;
				BRAM[376] = 13'h07c ;
				BRAM[377] = 13'h07c ;
				BRAM[378] = 13'h07c ;
				BRAM[379] = 13'h07c ;
				BRAM[380] = 13'h07c ;
				BRAM[381] = 13'h07d ;
				BRAM[382] = 13'h07d ;
				BRAM[383] = 13'h07d ;
				BRAM[384] = 13'h07e ;
				BRAM[385] = 13'h07d ;
				BRAM[386] = 13'h07c ;
				BRAM[387] = 13'h07c ;
				BRAM[388] = 13'h07d ;
				BRAM[389] = 13'h07e ;
				BRAM[390] = 13'h07d ;
				BRAM[391] = 13'h07b ;
				BRAM[392] = 13'h078 ;
				BRAM[393] = 13'h078 ;
				BRAM[394] = 13'h078 ;
				BRAM[395] = 13'h079 ;
				BRAM[396] = 13'h07b ;
				BRAM[397] = 13'h079 ;
				BRAM[398] = 13'h076 ;
				BRAM[399] = 13'h072 ;
				BRAM[400] = 13'h075 ;
				BRAM[401] = 13'h077 ;
				BRAM[402] = 13'h076 ;
				BRAM[403] = 13'h072 ;
				BRAM[404] = 13'h073 ;
				BRAM[405] = 13'h078 ;
				BRAM[406] = 13'h07b ;
				BRAM[407] = 13'h07b ;
				BRAM[408] = 13'h078 ;
				BRAM[409] = 13'h078 ;
				BRAM[410] = 13'h07a ;
				BRAM[411] = 13'h07c ;
				BRAM[412] = 13'h07b ;
				BRAM[413] = 13'h07a ;
				BRAM[414] = 13'h079 ;
				BRAM[415] = 13'h07b ;
				BRAM[416] = 13'h07d ;
				BRAM[417] = 13'h07d ;
				BRAM[418] = 13'h079 ;
				BRAM[419] = 13'h075 ;
				BRAM[420] = 13'h073 ;
				BRAM[421] = 13'h075 ;
				BRAM[422] = 13'h078 ;
				BRAM[423] = 13'h079 ;
				BRAM[424] = 13'h07d ;
				BRAM[425] = 13'h07c ;
				BRAM[426] = 13'h07a ;
				BRAM[427] = 13'h077 ;
				BRAM[428] = 13'h074 ;
				BRAM[429] = 13'h074 ;
				BRAM[430] = 13'h076 ;
				BRAM[431] = 13'h077 ;
				BRAM[432] = 13'h07b ;
				BRAM[433] = 13'h07b ;
				BRAM[434] = 13'h078 ;
				BRAM[435] = 13'h077 ;
				BRAM[436] = 13'h077 ;
				BRAM[437] = 13'h077 ;
				BRAM[438] = 13'h075 ;
				BRAM[439] = 13'h071 ;
				for (ram_index = 440; ram_index <= RAM_DEPTH; ram_index = ram_index + 1)
					BRAM[ram_index] = {RAM_WIDTH{1'b1}};
			end
			default:begin
				for (ram_index = 0; ram_index <= RAM_DEPTH; ram_index = ram_index + 1)
					BRAM[ram_index] = {RAM_WIDTH{1'b1}};
			end

		endcase
	end
		
	always @(posedge i_CLK) begin
		dout_reg<=BRAM[i_readAdd];	
		if(i_wrEnable) begin			
			BRAM[i_writeAdd]<=i_data;		
		end	
	end
 
	assign{o_data}= dout_reg;
	//assign {o_led[3:2]}= go_to_leds; 
  

	/*
	BRAM[0] = 13'h7F; //127 (0.992)
				BRAM[1] = 13'h7F;
				for (ram_index = 2; ram_index <= 7; ram_index = ram_index + 1)
					BRAM[ram_index] = {13'h7E}; //126 

				for (ram_index = 8; ram_index <= 16; ram_index = ram_index + 1)
					BRAM[ram_index] = {13'h7F}; //127 

				for (ram_index = 17; ram_index <= 22; ram_index = ram_index + 1)
					BRAM[ram_index] = {13'h7E}; //126 

				for (ram_index = 23; ram_index <= 26; ram_index = ram_index + 1)
					BRAM[ram_index] = {13'h7F}; //127

				for (ram_index = 27; ram_index <= 29; ram_index = ram_index + 1)
					BRAM[ram_index] = {13'h7E}; //126 
 	
				BRAM[30] = 13'h7D; //127 (0.992)
				BRAM[31] = 13'h7D;
				BRAM[32] = 13'h7E; //127 (0.992)
				BRAM[33] = 13'h7F;
	
		for (ram_index = 34; ram_index <= RAM_DEPTH; ram_index = ram_index + 1)
			BRAM[ram_index] = {RAM_WIDTH{1'b1}};
				
	*/



endmodule

