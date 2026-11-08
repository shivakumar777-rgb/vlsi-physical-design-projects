# Method 1: self-contained flow.
# Libraries come from .synopsys_dc.setup. RTL files are read from ./rtl.
analyze -format verilog [glob ./rtl/*.v]
elaborate aes_cipher_top
current_design aes_cipher_top
link
