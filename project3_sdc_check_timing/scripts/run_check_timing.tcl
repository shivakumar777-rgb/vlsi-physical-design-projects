# Usage: DESIGN=<top> SDC=constraints/after.sdc dc_shell -f scripts/run_check_timing.tcl
# Libraries come from your own .synopsys_dc.setup (not committed).
set design $::env(DESIGN)
set sdc    $::env(SDC)
analyze -format verilog [glob ./rtl/*.v]
elaborate $design
current_design $design
link
source $sdc
check_timing
report_clock
exit
