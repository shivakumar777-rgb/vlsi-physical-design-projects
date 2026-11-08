# Usage: DESIGN=half_cycle_path dc_shell -f scripts/run_dc.tcl
#        DESIGN=full_cycle_path dc_shell -f scripts/run_dc.tcl
# Libraries come from your own .synopsys_dc.setup (not committed).
set design $::env(DESIGN)
file mkdir reports

analyze -format verilog rtl/${design}.v
elaborate $design
current_design $design
link
source sdc/top.sdc
check_timing

compile_ultra

# Worst setup path, with the clock edges shown
report_timing -delay_type max -path_type full_clock_expanded -nworst 1 \
    > reports/${design}_setup_timing.rpt
report_qor > reports/${design}_qor.rpt
exit
