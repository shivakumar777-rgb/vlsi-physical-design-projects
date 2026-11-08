# Project 4: AES Cipher Top, Unresolved Reference Debug

**Tool:** Synopsys Design Compiler | **Language:** Tcl, Verilog RTL

## Objective
Bring up `aes_cipher_top` in Design Compiler. The project came with four RTL files, but one required module was missing. The goal was to find it and make `elaborate` and `link` run clean.

## Debug Flow
![Debug flow](docs/images/debug_flow.png)

## Method 1: Fix the path in the main script
1. Start the shell and run the flow:
   ```tcl
   source scripts/aes.tcl
   ```
2. After `elaborate aes_cipher_top`, the tool reports **unresolved references**.

   ![Unresolved references](docs/images/01_unresolved_references.png)
3. Run `link`. The output shows the missing module is **`aes_sbox`**.

   ![link output](docs/images/02_link_missing_aes_sbox.png)
4. Search for the missing RTL file.

   ![Finding aes_sbox](docs/images/03_find_aes_sbox_path.png)
5. Add its path to the RTL list in the script and run again.

   ![Path added](docs/images/04_path_added_in_script.png)
6. `elaborate` and `link` now complete with the reference resolved.

   ![Final output](docs/images/05_final_output.png)

## Method 2: Separate RTL list file
Keep the RTL file list in its own script and source it from the main flow.
1. Create `scripts/rtl.tcl` holding the RTL paths.

   ![rtl.tcl created](docs/images/06_rtl_tcl_created.png)
2. Source it. The same unresolved reference appears.

   ![Unresolved again](docs/images/07_unresolved_references_method2.png)
3. Find the missing RTL file.

   ![Missing file found](docs/images/08_missing_rtl_found.png)
4. Add the path to `rtl.tcl` and run again. The unresolved reference is gone.

   ![Path added to rtl.tcl](docs/images/09_path_added_in_rtl_tcl.png)

## Repository Structure
```
project4_aes_cipher_top/
├── README.md
├── LICENSE
├── .gitignore
├── rtl/        # AES RTL files (.v), including aes_sbox
├── scripts/
│   ├── aes.tcl          # Method 1: self-contained flow
│   ├── rtl.tcl          # Method 2: RTL file list
│   └── aes_rtl_list.tcl # Method 2: flow that sources rtl.tcl
├── reports/
└── docs/       # debug_notes.md, images/
```

## How to Run
Libraries come from your own `.synopsys_dc.setup` (not committed).
```bash
dc_shell -f scripts/aes.tcl            # Method 1
dc_shell -f scripts/aes_rtl_list.tcl   # Method 2
```

## Key Learnings
- `elaborate` lists unresolved references, and `link` names the exact missing module.
- A missing sub-module such as `aes_sbox` means an RTL file is absent from the analyze list. Find it, add it, rerun.
- Keeping the RTL list in a separate Tcl file makes fixes like this a one-line change.

## Author
**Gunti Siva Kumar**, B.Tech ECE, Narasaraopeta Engineering College (JNTUK)

## License
MIT
