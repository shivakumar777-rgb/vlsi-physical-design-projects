# Method 2: flow that reads the RTL list from rtl.tcl.
source scripts/rtl.tcl
analyze -format verilog $RTL_FILES
elaborate aes_cipher_top
current_design aes_cipher_top
link
