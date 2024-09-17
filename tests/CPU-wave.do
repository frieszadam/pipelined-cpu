onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_tb/dut/register/clk
add wave -noupdate /CPU_tb/reset
add wave -noupdate -group {Instruct mem} -radix unsigned /CPU_tb/dut/instruct_mem/address
add wave -noupdate -group {Instruct mem} /CPU_tb/dut/instruct_mem/instruction
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[88]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[87]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[86]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[85]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[84]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[83]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[82]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[81]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[80]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[79]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[78]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[77]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[76]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[75]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[74]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[73]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[72]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[71]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[70]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[69]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[68]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[67]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[66]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[65]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[64]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[63]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[62]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[61]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[60]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[59]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[58]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[57]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[56]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[55]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[54]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[53]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[52]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[51]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[50]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[49]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[48]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[47]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[46]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[45]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[44]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[43]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[42]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[41]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[40]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[39]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[38]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[37]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[36]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[35]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[34]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[33]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[32]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[31]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[30]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[29]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[28]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[27]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[26]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[25]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[24]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[23]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[22]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[21]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[20]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[19]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[18]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[17]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[16]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[15]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[14]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[13]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[12]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[11]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[10]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[9]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[8]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[7]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[6]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[5]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[4]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[3]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[2]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[1]}
add wave -noupdate -group {Data Mem} -group {datamem low} -radix decimal {/CPU_tb/dut/datamem/mem[0]}
add wave -noupdate -group {Data Mem} -radix decimal /CPU_tb/dut/datamem/address
add wave -noupdate -group {Data Mem} -radix decimal /CPU_tb/dut/datamem/read_data
add wave -noupdate -group {Data Mem} -radix decimal /CPU_tb/dut/datamem/write_data
add wave -noupdate -group {Data Mem} /CPU_tb/dut/datamem/write_enable
add wave -noupdate -group Registers -radix decimal -childformat {{{/CPU_tb/dut/register/DataOut[31]} -radix decimal} {{/CPU_tb/dut/register/DataOut[30]} -radix decimal} {{/CPU_tb/dut/register/DataOut[29]} -radix decimal} {{/CPU_tb/dut/register/DataOut[28]} -radix decimal} {{/CPU_tb/dut/register/DataOut[27]} -radix decimal} {{/CPU_tb/dut/register/DataOut[26]} -radix decimal} {{/CPU_tb/dut/register/DataOut[25]} -radix decimal} {{/CPU_tb/dut/register/DataOut[24]} -radix decimal} {{/CPU_tb/dut/register/DataOut[23]} -radix decimal} {{/CPU_tb/dut/register/DataOut[22]} -radix decimal} {{/CPU_tb/dut/register/DataOut[21]} -radix decimal} {{/CPU_tb/dut/register/DataOut[20]} -radix decimal} {{/CPU_tb/dut/register/DataOut[19]} -radix decimal} {{/CPU_tb/dut/register/DataOut[18]} -radix decimal} {{/CPU_tb/dut/register/DataOut[17]} -radix decimal} {{/CPU_tb/dut/register/DataOut[16]} -radix decimal} {{/CPU_tb/dut/register/DataOut[15]} -radix decimal} {{/CPU_tb/dut/register/DataOut[14]} -radix decimal} {{/CPU_tb/dut/register/DataOut[13]} -radix decimal} {{/CPU_tb/dut/register/DataOut[12]} -radix decimal} {{/CPU_tb/dut/register/DataOut[11]} -radix decimal} {{/CPU_tb/dut/register/DataOut[10]} -radix decimal} {{/CPU_tb/dut/register/DataOut[9]} -radix decimal} {{/CPU_tb/dut/register/DataOut[8]} -radix decimal} {{/CPU_tb/dut/register/DataOut[7]} -radix decimal} {{/CPU_tb/dut/register/DataOut[6]} -radix decimal} {{/CPU_tb/dut/register/DataOut[5]} -radix decimal} {{/CPU_tb/dut/register/DataOut[4]} -radix decimal} {{/CPU_tb/dut/register/DataOut[3]} -radix decimal} {{/CPU_tb/dut/register/DataOut[2]} -radix decimal} {{/CPU_tb/dut/register/DataOut[1]} -radix decimal} {{/CPU_tb/dut/register/DataOut[0]} -radix decimal}} -subitemconfig {{/CPU_tb/dut/register/DataOut[31]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[30]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[29]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[28]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[27]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[26]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[25]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[24]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[23]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[22]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[21]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[20]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[19]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[18]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[17]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[16]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[15]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[14]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[13]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[12]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[11]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[10]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[9]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[8]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[7]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[6]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[5]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[4]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[3]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[2]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[1]} {-height 15 -radix decimal} {/CPU_tb/dut/register/DataOut[0]} {-height 15 -radix decimal}} /CPU_tb/dut/register/DataOut
add wave -noupdate -group Registers -radix decimal /CPU_tb/dut/register/ReadData1
add wave -noupdate -group Registers -radix decimal -childformat {{{/CPU_tb/dut/register/ReadData2[63]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[62]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[61]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[60]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[59]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[58]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[57]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[56]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[55]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[54]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[53]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[52]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[51]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[50]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[49]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[48]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[47]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[46]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[45]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[44]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[43]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[42]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[41]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[40]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[39]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[38]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[37]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[36]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[35]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[34]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[33]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[32]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[31]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[30]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[29]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[28]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[27]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[26]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[25]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[24]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[23]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[22]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[21]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[20]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[19]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[18]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[17]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[16]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[15]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[14]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[13]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[12]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[11]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[10]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[9]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[8]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[7]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[6]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[5]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[4]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[3]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[2]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[1]} -radix decimal} {{/CPU_tb/dut/register/ReadData2[0]} -radix decimal}} -subitemconfig {{/CPU_tb/dut/register/ReadData2[63]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[62]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[61]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[60]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[59]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[58]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[57]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[56]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[55]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[54]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[53]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[52]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[51]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[50]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[49]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[48]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[47]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[46]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[45]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[44]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[43]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[42]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[41]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[40]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[39]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[38]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[37]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[36]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[35]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[34]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[33]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[32]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[31]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[30]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[29]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[28]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[27]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[26]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[25]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[24]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[23]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[22]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[21]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[20]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[19]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[18]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[17]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[16]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[15]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[14]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[13]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[12]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[11]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[10]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[9]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[8]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[7]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[6]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[5]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[4]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[3]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[2]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[1]} {-height 15 -radix decimal} {/CPU_tb/dut/register/ReadData2[0]} {-height 15 -radix decimal}} /CPU_tb/dut/register/ReadData2
add wave -noupdate -group Registers -radix unsigned /CPU_tb/dut/register/ReadRegister1
add wave -noupdate -group Registers -radix unsigned /CPU_tb/dut/register/ReadRegister2
add wave -noupdate -group Registers /CPU_tb/dut/register/RegWrite
add wave -noupdate -group Registers -radix decimal /CPU_tb/dut/register/WriteData
add wave -noupdate -group Registers -radix unsigned /CPU_tb/dut/register/WriteRegister
add wave -noupdate -group ALU -radix decimal /CPU_tb/dut/ALU/A
add wave -noupdate -group ALU -radix decimal /CPU_tb/dut/ALU/B
add wave -noupdate -group ALU -radix decimal /CPU_tb/dut/ALU/result
add wave -noupdate -group ALU /CPU_tb/dut/ALU/zero
add wave -noupdate -group ALU /CPU_tb/dut/ALU/negative
add wave -noupdate -group ALU /CPU_tb/dut/ALU/overflow
add wave -noupdate -group ALU /CPU_tb/dut/ALU/carry_out
add wave -noupdate -group {Program Counter} /CPU_tb/dut/takeBranch
add wave -noupdate -group {Program Counter} -radix unsigned /CPU_tb/dut/program_counter_in
add wave -noupdate -group {Program Counter} -radix unsigned /CPU_tb/dut/PC_out
add wave -noupdate -group {CRTL Unit} /CPU_tb/dut/ctrl_unit/ALUSrc
add wave -noupdate -group {CRTL Unit} /CPU_tb/dut/ctrl_unit/Branch
add wave -noupdate -group {CRTL Unit} /CPU_tb/dut/ctrl_unit/Mem2Reg
add wave -noupdate -group {CRTL Unit} /CPU_tb/dut/ctrl_unit/MemWrite
add wave -noupdate -group {CRTL Unit} /CPU_tb/dut/ctrl_unit/Reg2Loc
add wave -noupdate -group {CRTL Unit} /CPU_tb/dut/ctrl_unit/RegWrite
add wave -noupdate -group {CRTL Unit} /CPU_tb/dut/ctrl_unit/Uncondbranch
add wave -noupdate -group {CRTL Unit} /CPU_tb/dut/BLT
add wave -noupdate -group {CRTL Unit} /CPU_tb/dut/ctrl_unit/ALUop
add wave -noupdate -group {CRTL Unit} /CPU_tb/dut/ctrl_unit/se_ctrl
add wave -noupdate -group {CRTL Unit} /CPU_tb/dut/ctrl_unit/instr_MSB
add wave -noupdate -group {Pipeline Regs} -group IFID /CPU_tb/dut/instruction
add wave -noupdate -group {Pipeline Regs} -group IFID -radix unsigned /CPU_tb/dut/PC_out
add wave -noupdate -group {Pipeline Regs} -group IFID /CPU_tb/dut/IFID_instruction
add wave -noupdate -group {Pipeline Regs} -group IFID -radix unsigned /CPU_tb/dut/IFID_PC_normal
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/ALUSrc
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/LDUR
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/Mem2Reg
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/MemWrite
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/RegWrite
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/ALUop
add wave -noupdate -group {Pipeline Regs} -group IDEX -radix unsigned /CPU_tb/dut/IFID_PC_normal
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/IFID_instruction
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/IDEX_ALUSrc
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/IDEX_ALUop
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/IDEX_Mem2Reg
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/IDEX_MemWrite
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/IDEX_Rd
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/IDEX_RegWrite
add wave -noupdate -group {Pipeline Regs} -group IDEX -radix unsigned /CPU_tb/dut/IDEX_Rm
add wave -noupdate -group {Pipeline Regs} -group IDEX -radix unsigned /CPU_tb/dut/IDEX_Rn
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/instr_Rn
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/instr_Rm
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/instr_Rd
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/IDEX_instruction
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/IDEX_ldur
add wave -noupdate -group {Pipeline Regs} -group IDEX -radix decimal /CPU_tb/dut/IDEX_reg_read_data1
add wave -noupdate -group {Pipeline Regs} -group IDEX -radix decimal /CPU_tb/dut/IDEX_reg_read_data2
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/IDEX_se_data_extended
add wave -noupdate -group {Pipeline Regs} -group IDEX /CPU_tb/dut/IDEX_setFlags
add wave -noupdate -group {Pipeline Regs} -group EXMEM /CPU_tb/dut/IDEX_MemWrite
add wave -noupdate -group {Pipeline Regs} -group EXMEM /CPU_tb/dut/IDEX_Mem2Reg
add wave -noupdate -group {Pipeline Regs} -group EXMEM /CPU_tb/dut/IDEX_RegWrite
add wave -noupdate -group {Pipeline Regs} -group EXMEM -radix unsigned /CPU_tb/dut/IDEX_Rd
add wave -noupdate -group {Pipeline Regs} -group EXMEM -radix unsigned /CPU_tb/dut/IDEX_Rm
add wave -noupdate -group {Pipeline Regs} -group EXMEM -radix unsigned /CPU_tb/dut/IDEX_Rn
add wave -noupdate -group {Pipeline Regs} -group EXMEM -radix decimal /CPU_tb/dut/ALU_out
add wave -noupdate -group {Pipeline Regs} -group EXMEM -radix decimal /CPU_tb/dut/ALUSrc_out
add wave -noupdate -group {Pipeline Regs} -group EXMEM -radix decimal /CPU_tb/dut/EXMEM_ALUSrc_out
add wave -noupdate -group {Pipeline Regs} -group EXMEM -radix decimal /CPU_tb/dut/EXMEM_ALU_out
add wave -noupdate -group {Pipeline Regs} -group EXMEM /CPU_tb/dut/EXMEM_Mem2Reg
add wave -noupdate -group {Pipeline Regs} -group EXMEM /CPU_tb/dut/EXMEM_MemWrite
add wave -noupdate -group {Pipeline Regs} -group EXMEM -radix unsigned /CPU_tb/dut/EXMEM_Rd
add wave -noupdate -group {Pipeline Regs} -group EXMEM /CPU_tb/dut/EXMEM_RegWrite
add wave -noupdate -group {Pipeline Regs} -group EXMEM -radix unsigned /CPU_tb/dut/EXMEM_Rm
add wave -noupdate -group {Pipeline Regs} -group EXMEM -radix unsigned /CPU_tb/dut/EXMEM_Rn
add wave -noupdate -group {Pipeline Regs} -group EXMEM /CPU_tb/dut/EXMEM_instruction
add wave -noupdate -group {Pipeline Regs} -group MEMWB /CPU_tb/dut/EXMEM_RegWrite
add wave -noupdate -group {Pipeline Regs} -group MEMWB -radix unsigned /CPU_tb/dut/EXMEM_Rd
add wave -noupdate -group {Pipeline Regs} -group MEMWB /CPU_tb/dut/datamem_read_data
add wave -noupdate -group {Pipeline Regs} -group MEMWB -radix decimal /CPU_tb/dut/EXMEM_ALU_out
add wave -noupdate -group {Pipeline Regs} -group MEMWB -radix decimal /CPU_tb/dut/MEMWB_ALU_out
add wave -noupdate -group {Pipeline Regs} -group MEMWB -radix decimal /CPU_tb/dut/MEMWB_data_out
add wave -noupdate -group {Pipeline Regs} -group MEMWB -radix decimal /CPU_tb/dut/MEMWB_datamem_read_data
add wave -noupdate -group {Pipeline Regs} -group MEMWB /CPU_tb/dut/MEMWB_RegWrite
add wave -noupdate -group Forwarders -group ALU_forwarder /CPU_tb/dut/fu/MEMWB_RegWrite
add wave -noupdate -group Forwarders -group ALU_forwarder /CPU_tb/dut/fu/EXMEM_RegWrite
add wave -noupdate -group Forwarders -group ALU_forwarder -radix unsigned /CPU_tb/dut/fu/MEMWB_Rd
add wave -noupdate -group Forwarders -group ALU_forwarder -radix unsigned /CPU_tb/dut/fu/EXMEM_Rd
add wave -noupdate -group Forwarders -group ALU_forwarder -radix unsigned /CPU_tb/dut/fu/IDEX_Rn
add wave -noupdate -group Forwarders -group ALU_forwarder -radix unsigned /CPU_tb/dut/fu/IDEX_Rm
add wave -noupdate -group Forwarders -group ALU_forwarder /CPU_tb/dut/fu/ForwardA
add wave -noupdate -group Forwarders -group ALU_forwarder /CPU_tb/dut/fu/ForwardB
add wave -noupdate -group Forwarders -group ALU_forwarder -radix decimal /CPU_tb/dut/ALU_a
add wave -noupdate -group Forwarders -group ALU_forwarder -radix decimal /CPU_tb/dut/ALU_b
add wave -noupdate -group Forwarders -group ALU_forwarder -radix decimal /CPU_tb/dut/ALU_forwardb_out
add wave -noupdate -group Forwarders -group BR_forwarder -radix unsigned /CPU_tb/dut/BR_fu/instr_Rd
add wave -noupdate -group Forwarders -group BR_forwarder -radix unsigned /CPU_tb/dut/BR_fu/IDEX_Rd
add wave -noupdate -group Forwarders -group BR_forwarder -radix unsigned /CPU_tb/dut/BR_fu/EXMEM_Rd
add wave -noupdate -group Forwarders -group BR_forwarder /CPU_tb/dut/BR_fu/IDEX_RegWrite
add wave -noupdate -group Forwarders -group BR_forwarder /CPU_tb/dut/BR_fu/EXMEM_RegWrite
add wave -noupdate -group Forwarders -group BR_forwarder /CPU_tb/dut/BR_fu/BR_Forward
add wave -noupdate -group Forwarders -group BR_forwarder /CPU_tb/dut/BR_fu/instr_eq_exmem
add wave -noupdate -group Forwarders -group BR_forwarder /CPU_tb/dut/BR_fu/instr_eq_idex
add wave -noupdate -group Forwarders -group BL_forwarder -radix unsigned /CPU_tb/dut/BL_fu/IDEX_Rn
add wave -noupdate -group Forwarders -group BL_forwarder -radix unsigned /CPU_tb/dut/BL_fu/IDEX_Rm
add wave -noupdate -group Forwarders -group BL_forwarder /CPU_tb/dut/BL_fu/BL_ForwardA
add wave -noupdate -group Forwarders -group BL_forwarder /CPU_tb/dut/BL_fu/BL_ForwardB
add wave -noupdate -group Forwarders -group BL_forwarder /CPU_tb/dut/BL_fu/BL_Forward_Rd
add wave -noupdate -group Forwarders -group BL_forwarder /CPU_tb/dut/BL_fu/IDEX_MemWrite
add wave -noupdate -group Forwarders -group BL_forwarder /CPU_tb/dut/BL_fu/Rn_is_thirty
add wave -noupdate -group Forwarders -group BL_forwarder /CPU_tb/dut/BL_fu/Rm_is_thirty
add wave -noupdate -group Forwarders -group BL_forwarder /CPU_tb/dut/BL_fu/Rd_is_thirty
add wave -noupdate -group Forwarders -group BL_forwarder /CPU_tb/dut/IDEX_pipe_reg/IDEX_BL
add wave -noupdate -group Forwarders -group BL_forwarder /CPU_tb/dut/BL_fu/EXMEM_BL
add wave -noupdate -group Forwarders -group BL_forwarder /CPU_tb/dut/BL_fu/MEMWB_BL
add wave -noupdate -group {Branch Check} /CPU_tb/dut/to_Branch_or_not_to_Branch/takeBranch
add wave -noupdate -group {Branch Check} /CPU_tb/dut/to_Branch_or_not_to_Branch/validCBZ
add wave -noupdate -group {Branch Check} /CPU_tb/dut/to_Branch_or_not_to_Branch/validBLT
add wave -noupdate -group {Branch Check} /CPU_tb/dut/is_BR
add wave -noupdate -group {Branch Check} -radix unsigned /CPU_tb/dut/PC_branch_taken_val
add wave -noupdate -group Flags /CPU_tb/dut/flag_register/en
add wave -noupdate -group Flags /CPU_tb/dut/flag_carry_out
add wave -noupdate -group Flags /CPU_tb/dut/flag_neg
add wave -noupdate -group Flags /CPU_tb/dut/flag_overflow
add wave -noupdate -group Flags /CPU_tb/dut/flag_zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28550083 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 190
configure wave -valuecolwidth 92
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {28308333 ps} {30120615 ps}
