# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
#vlog "mux6to1.sv"
vlog "mux5to1.sv"
# vlog "full_adder.sv"
# vlog "rc_add_sub.sv"
vlog "partial_prop_gen_adder.sv"
vlog "CLA_4bit.sv"
vlog "CLA_16bit.sv"
vlog "CLA_64bit.sv"
vlog "alu.sv"
vlog "alustim.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -sv_seed 4469 -lib work alustim

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do alustim-wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
