onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /alustim/A
add wave -noupdate -radix decimal /alustim/B
add wave -noupdate /alustim/carry_out
add wave -noupdate /alustim/cntrl
add wave -noupdate /alustim/delay
add wave -noupdate /alustim/i
add wave -noupdate /alustim/negative
add wave -noupdate /alustim/overflow
add wave -noupdate -radix decimal /alustim/result
add wave -noupdate /alustim/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {59106359375 ps} 0}
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
WaveRestoreZoom {59106359375 ps} {59769171875 ps}
