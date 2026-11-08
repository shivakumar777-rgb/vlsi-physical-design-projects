# Debug Notes: Project 4

- Symptom: `elaborate aes_cipher_top` printed unresolved references.
- Diagnosis: `link` named the missing module: `aes_sbox`.
- Fix: located the `aes_sbox` RTL file and added its path to the RTL list.
- Result: unresolved references cleared (see docs/images).
- Method 2 moves the RTL list into `scripts/rtl.tcl` and fixes it there.
