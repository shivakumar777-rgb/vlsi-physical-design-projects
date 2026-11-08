# Debug Notes: Half-Cycle Path

## How to spot it in report_timing
Run `report_timing -path_type full_clock_expanded` and read three places:
1. **Startpoint / Endpoint lines:** startpoint says "rising edge-triggered flip-flop", endpoint says "falling edge-triggered flip-flop".
2. **Capture clock line:** it reads `clock clk (fall edge)` and its time is T/2 (for example 2.00 on a 4.00 ns clock), not T.
3. **Data required time:** it is measured from that T/2 edge, so the logic has only half a period.

A full-cycle path shows `clock clk (rise edge)` at T on the capture side instead.

## Fix applied
Change the capture flop from `negedge clk` to `posedge clk`
(`rtl/half_cycle_path.v` -> `rtl/full_cycle_path.v`). The logic is unchanged and gets T instead of T/2.

## If the falling edge must stay
- Pipeline the logic so each stage fits in T/2, or
- Move part of the logic to the other side of the capture flop, or
- Reduce the logic depth (smaller multiplier, simpler arithmetic).
