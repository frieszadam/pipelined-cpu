onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /mux_tb/sel
add wave -noupdate -radix binary -childformat {{{/mux_tb/in[31]} -radix unsigned} {{/mux_tb/in[30]} -radix unsigned} {{/mux_tb/in[29]} -radix unsigned} {{/mux_tb/in[28]} -radix unsigned} {{/mux_tb/in[27]} -radix unsigned} {{/mux_tb/in[26]} -radix unsigned} {{/mux_tb/in[25]} -radix unsigned} {{/mux_tb/in[24]} -radix unsigned} {{/mux_tb/in[23]} -radix unsigned} {{/mux_tb/in[22]} -radix unsigned} {{/mux_tb/in[21]} -radix unsigned} {{/mux_tb/in[20]} -radix unsigned} {{/mux_tb/in[19]} -radix unsigned} {{/mux_tb/in[18]} -radix unsigned} {{/mux_tb/in[17]} -radix unsigned} {{/mux_tb/in[16]} -radix unsigned} {{/mux_tb/in[15]} -radix unsigned} {{/mux_tb/in[14]} -radix unsigned} {{/mux_tb/in[13]} -radix unsigned} {{/mux_tb/in[12]} -radix unsigned} {{/mux_tb/in[11]} -radix unsigned} {{/mux_tb/in[10]} -radix unsigned} {{/mux_tb/in[9]} -radix unsigned} {{/mux_tb/in[8]} -radix unsigned} {{/mux_tb/in[7]} -radix unsigned} {{/mux_tb/in[6]} -radix unsigned} {{/mux_tb/in[5]} -radix unsigned} {{/mux_tb/in[4]} -radix unsigned} {{/mux_tb/in[3]} -radix unsigned} {{/mux_tb/in[2]} -radix unsigned} {{/mux_tb/in[1]} -radix unsigned} {{/mux_tb/in[0]} -radix unsigned}} -subitemconfig {{/mux_tb/in[31]} {-height 15 -radix unsigned} {/mux_tb/in[30]} {-height 15 -radix unsigned} {/mux_tb/in[29]} {-height 15 -radix unsigned} {/mux_tb/in[28]} {-height 15 -radix unsigned} {/mux_tb/in[27]} {-height 15 -radix unsigned} {/mux_tb/in[26]} {-height 15 -radix unsigned} {/mux_tb/in[25]} {-height 15 -radix unsigned} {/mux_tb/in[24]} {-height 15 -radix unsigned} {/mux_tb/in[23]} {-height 15 -radix unsigned} {/mux_tb/in[22]} {-height 15 -radix unsigned} {/mux_tb/in[21]} {-height 15 -radix unsigned} {/mux_tb/in[20]} {-height 15 -radix unsigned} {/mux_tb/in[19]} {-height 15 -radix unsigned} {/mux_tb/in[18]} {-height 15 -radix unsigned} {/mux_tb/in[17]} {-height 15 -radix unsigned} {/mux_tb/in[16]} {-height 15 -radix unsigned} {/mux_tb/in[15]} {-height 15 -radix unsigned} {/mux_tb/in[14]} {-height 15 -radix unsigned} {/mux_tb/in[13]} {-height 15 -radix unsigned} {/mux_tb/in[12]} {-height 15 -radix unsigned} {/mux_tb/in[11]} {-height 15 -radix unsigned} {/mux_tb/in[10]} {-height 15 -radix unsigned} {/mux_tb/in[9]} {-height 15 -radix unsigned} {/mux_tb/in[8]} {-height 15 -radix unsigned} {/mux_tb/in[7]} {-height 15 -radix unsigned} {/mux_tb/in[6]} {-height 15 -radix unsigned} {/mux_tb/in[5]} {-height 15 -radix unsigned} {/mux_tb/in[4]} {-height 15 -radix unsigned} {/mux_tb/in[3]} {-height 15 -radix unsigned} {/mux_tb/in[2]} {-height 15 -radix unsigned} {/mux_tb/in[1]} {-height 15 -radix unsigned} {/mux_tb/in[0]} {-height 15 -radix unsigned}} /mux_tb/in
add wave -noupdate -radix unsigned /mux_tb/out
add wave -noupdate -radix unsigned /mux_tb/ans
add wave -noupdate -radix unsigned /mux_tb/dut/outline0
add wave -noupdate -radix unsigned /mux_tb/dut/outline1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {336 ps}
