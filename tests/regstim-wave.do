onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /regstim/clk
add wave -noupdate -radix unsigned /regstim/ReadRegister1
add wave -noupdate -radix unsigned /regstim/ReadRegister2
add wave -noupdate -radix decimal /regstim/ReadData1
add wave -noupdate -radix decimal /regstim/ReadData2
add wave -noupdate -radix unsigned /regstim/WriteRegister
add wave -noupdate -radix decimal /regstim/WriteData
add wave -noupdate /regstim/RegWrite
add wave -noupdate -childformat {{{/regstim/dut/DataOut[31]} -radix hexadecimal} {{/regstim/dut/DataOut[30]} -radix hexadecimal} {{/regstim/dut/DataOut[29]} -radix hexadecimal} {{/regstim/dut/DataOut[28]} -radix hexadecimal} {{/regstim/dut/DataOut[27]} -radix hexadecimal} {{/regstim/dut/DataOut[26]} -radix hexadecimal} {{/regstim/dut/DataOut[25]} -radix hexadecimal} {{/regstim/dut/DataOut[24]} -radix hexadecimal} {{/regstim/dut/DataOut[23]} -radix hexadecimal} {{/regstim/dut/DataOut[22]} -radix hexadecimal} {{/regstim/dut/DataOut[21]} -radix hexadecimal} {{/regstim/dut/DataOut[20]} -radix hexadecimal} {{/regstim/dut/DataOut[19]} -radix hexadecimal} {{/regstim/dut/DataOut[18]} -radix hexadecimal} {{/regstim/dut/DataOut[17]} -radix hexadecimal} {{/regstim/dut/DataOut[16]} -radix hexadecimal} {{/regstim/dut/DataOut[15]} -radix hexadecimal} {{/regstim/dut/DataOut[14]} -radix hexadecimal} {{/regstim/dut/DataOut[13]} -radix hexadecimal} {{/regstim/dut/DataOut[12]} -radix hexadecimal} {{/regstim/dut/DataOut[11]} -radix hexadecimal} {{/regstim/dut/DataOut[10]} -radix hexadecimal} {{/regstim/dut/DataOut[9]} -radix hexadecimal} {{/regstim/dut/DataOut[8]} -radix hexadecimal} {{/regstim/dut/DataOut[7]} -radix hexadecimal} {{/regstim/dut/DataOut[6]} -radix hexadecimal} {{/regstim/dut/DataOut[5]} -radix hexadecimal} {{/regstim/dut/DataOut[4]} -radix hexadecimal} {{/regstim/dut/DataOut[3]} -radix hexadecimal} {{/regstim/dut/DataOut[2]} -radix hexadecimal} {{/regstim/dut/DataOut[1]} -radix hexadecimal} {{/regstim/dut/DataOut[0]} -radix hexadecimal}} -subitemconfig {{/regstim/dut/DataOut[31]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[30]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[29]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[28]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[27]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[26]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[25]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[24]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[23]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[22]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[21]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[20]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[19]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[18]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[17]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[16]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[15]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[14]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[13]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[12]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[11]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[10]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[9]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[8]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[7]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[6]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[5]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[4]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[3]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[2]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[1]} {-height 15 -radix hexadecimal} {/regstim/dut/DataOut[0]} {-height 15 -radix hexadecimal}} /regstim/dut/DataOut
add wave -noupdate /regstim/dut/enable_signals
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {47500000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {432233452 ps}
