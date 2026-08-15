# Verification Guide

Run:

```bash
./scripts/verify.sh
```

## Status meanings

### PASS

The command was detected and executed sufficiently to confirm that the tool is available.

### WARN

The tool is optional or could not be detected. A warning does not necessarily mean the environment is broken.

### FAIL

A required base dependency is missing or unusable.

## Example output

```text
Open-Source ASIC Environment Verification

[PASS] git
[PASS] python3
[PASS] make
[PASS] gcc
[PASS] iverilog
[PASS] yosys
[WARN] openroad
[WARN] klayout
[WARN] magic
[PASS] docker
[WARN] nix

Summary
  PASS: 7
  WARN: 4
  FAIL: 0

Verification completed.
```

The exact result depends on which tools you have installed.

## Verify the examples

Counter:

```bash
cd examples/counter
./run.sh
```

UART:

```bash
cd examples/uart
./run.sh
```

## Important

A `PASS` from the verification script means the executable was detected. It does not mean that every feature of a complex EDA tool has been validated.

For complete ASIC-flow validation, run a known-good RTL-to-GDSII design and inspect its generated reports.
