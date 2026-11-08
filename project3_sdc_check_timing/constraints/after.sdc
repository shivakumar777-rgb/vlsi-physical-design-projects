# after.sdc: fixed constraints (check_timing warnings cleared).
# Paste your final SDC here. Structure used in this project:
#
#   create_clock           clk1                          (master clock)
#   create_generated_clock stage 1 output  -divide_by 2  (clk1   / 2)
#   create_generated_clock stage 2 output  -divide_by 2  (clk1   / 4)
#   create_generated_clock stage 3 output  -divide_by 2  (clk1   / 8)
#
# Each stage's -source is the previous stage's output pin.
