# Common constraints for both versions (same clock, same I/O budget).
create_clock -name clk -period 4.0 [get_ports clk]
set_input_delay  -clock clk 0.5 [remove_from_collection [all_inputs] [get_ports {clk rst_n}]]
set_output_delay -clock clk 0.5 [all_outputs]
set_false_path -from [get_ports rst_n]
