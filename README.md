# vlsi-physical-design-projects
# VLSI Physical Design Projects

VLSI projects covering the RTL-to-floorplan ASIC flow: static timing analysis (STA), SDC constraints, timing debug, logic synthesis with Synopsys Design Compiler, and physical design with IC Compiler II (ICC2).

**Keywords:** VLSI, physical design, ASIC flow, static timing analysis, SDC, check_timing, generated clocks, half-cycle path, Synopsys Design Compiler, ICC2, RTL synthesis, Verilog, Tcl, RISC-V, CVA6

## Projects

| # | Project | Folder | Focus |
|---|---------|--------|-------|
| 1 | SDC constraints and `check_timing` cleanup | [project3_sdc_check_timing](project3_sdc_check_timing) | Clock-divider chain, generated clocks, clearing timing warnings |
| 2 | AES cipher top, unresolved reference debug | [project4_aes_cipher_top](project4_aes_cipher_top) | Missing `aes_sbox` module, `elaborate` and `link` debug |
| 3 | Half-cycle path timing analysis | [half_cycle_path_timing](half_cycle_path_timing) | Reading `report_timing`, half-cycle vs full-cycle fix |
| 4 | CVA6 RISC-V core: synthesis and PnR | Coming soon | `compile_ultra`, QoR, ICC2 MCMM setup, floorplanning |

## Tool Flow
RTL, analyze and elaborate, SDC constraints, `compile_ultra`, QoR report, ICC2 setup, MCMM, derates, floorplan

## Tools and Skills
- **EDA:** Synopsys Design Compiler, IC Compiler II (ICC2)
- **Languages:** Verilog, Tcl, SDC, Python
- **Topics:** static timing analysis, clock constraints, timing closure, logic synthesis, physical design

## Author
**Gunti Siva Kumar**, B.Tech ECE, Narasaraopeta Engineering College (JNTUK)
Interested in VLSI, physical design and embedded systems roles.
