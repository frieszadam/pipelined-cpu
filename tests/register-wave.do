onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /register_tb/clk
add wave -noupdate -radix unsigned /register_tb/d
add wave -noupdate -radix unsigned /register_tb/q
add wave -noupdate /register_tb/en
add wave -noupdate -radix unsigned /register_tb/dut/data_in
add wave -noupdate -radix unsigned /register_tb/dut/data_previous
add wave -noupdate -radix unsigned /register_tb/dut/ff_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15 ps} 0}
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
WaveRestoreZoom {0 ps} {63 ps}
