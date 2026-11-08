#!/bin/bash
# Runs the half-cycle and full-cycle versions and writes reports/.
for d in half_cycle_path full_cycle_path; do
  DESIGN=$d dc_shell -f scripts/run_dc.tcl | tee reports/${d}_dc.log
done
echo "Compare: reports/half_cycle_path_setup_timing.rpt  vs  reports/full_cycle_path_setup_timing.rpt"
