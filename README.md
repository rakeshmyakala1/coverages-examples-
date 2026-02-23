# Coverages Examples (SystemVerilog)

This repository contains SystemVerilog functional coverage examples collected in `cov.sv`.

## Contents

- Coverage of values from 0 to 100
- Even, odd, and multiples-of-10 bins
- Card deck value/suit coverage with cross coverage
- Student marks range bins
- Dice value coverage (1 to 6)
- Traffic light duration and color coverage
- Temperature range coverage bins
- Burst type vs. burst length coverage
- Binary signal cross coverage
- Transition bins, repetition bins, ignore bins, and illegal bins

## Main File

- `cov.sv`: all coverage examples

## Running (example with ModelSim/Questa)

```sh
vlog cov.sv
vsim -c rakesh -do "run -all; quit"
```
