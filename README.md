# Coverages Examples (SystemVerilog)

This repository contains functional coverage examples in `cov.sv`.

## Main File

- `cov.sv`: collection of coverage examples (basic to advanced)

## Examples Included In `cov.sv`

### Active examples (currently uncommented)

1. Cover all values from `0` to `100`
2. Cover even, odd, and multiples of `10` in `0:100`
3. Cover 52-card style value/suit combinations with cross coverage
4. Cover student marks bins (`0:50`, `51:75`, `76:100`)
5. Cover dice values (`1:6`)
6. Cover traffic light durations + cross with light color
7. Cover burst length by burst type using `iff`
8. Advanced explicit sampling example:
   - clocked covergroups (`@(posedge clk)`)
   - covergroup options (`goal`, `weight`, `name`, `per_instance`, `at_least`)
   - transition/repetition bins
   - illegal bins
9. AW channel handshake example:
   - separate class `awvalid_ready_cov`
   - coverpoints for `AWVALID` and `AWREADY`
   - handshake-state bins (`00`, `01`, `10`, `11`)
   - cross coverage of valid vs ready
   - separate module `awvalid_ready_tb`

### Additional examples present as commented blocks

- Temperature ranges in 4 bins
- A/B binary combination cross coverage
- Packet ID field `0:15`
- Binary vector with even number of `1`s (`$countones` + `iff`)
- Valid IP first-octet values (`10`, `172`, `192`)
- Valid vs invalid packet type bins
- Transition bins with `ignore_bins` and `illegal_bins`

## Running

`cov.sv` is a learning/examples file and contains multiple class/module definitions.

Use one target module at a time:

```sh
vlog cov.sv
vsim -c awvalid_ready_tb -do "run -all; quit"
```

For examples using module `rakesh`, run:

```sh
vlog cov.sv
vsim -c rakesh -do "run -all; quit"
```
