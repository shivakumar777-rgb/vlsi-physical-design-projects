# Debug Notes: Project 3

- Symptom: `check_timing` warnings.
- Cause: divider outputs (÷2, ÷4, ÷8) used as clocks without generated clock definitions.
- Fix: one `create_generated_clock -divide_by 2` per stage, chained through `-source`.
- Result: warnings cleared (see docs/images).
