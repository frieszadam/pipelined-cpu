# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "partial_prop_gen_adder.sv"
vlog "CLA_4bit.sv"
vlog "CLA_16bit.sv"
vlog "CLA_16bit_tb1.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work CLA_16bit_tb1

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do CLA_16bit-wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
