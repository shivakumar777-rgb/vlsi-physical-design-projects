#!/bin/bash
# Functional check with Icarus Verilog: both versions must compute a*b + c.
iverilog -o sim.out rtl/*.v tb/tb_paths.v && vvp sim.out
