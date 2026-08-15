# Open-Source ASIC Tool Installation Guide

A practical, reproducible setup guide for an open-source digital ASIC/VLSI environment on Ubuntu or WSL2.

## What this project provides

This repository helps you install and verify a collection of open-source tools commonly used for:

- RTL simulation
- Logic synthesis
- Static timing analysis
- Floorplanning, placement and routing
- Physical design
- Layout viewing and editing
- DRC/LVS-related workflows
- Digital design learning and experimentation

The repository is intentionally split into **installation**, **verification**, and **examples** so that a fresh user can quickly determine whether the environment is working.

## Tooling

The verification script checks for tools that are available in the user's environment, including:

- Git
- Python 3
- Icarus Verilog
- Yosys
- OpenROAD
- KLayout
- Magic
- Docker
- Nix

OpenLane is checked when it is available through the user's chosen installation method. The script does not pretend a tool is installed when it cannot be detected.

> Tool packaging and installation commands can change over time. The scripts therefore prefer existing commands and provide clear warnings rather than silently installing an incompatible version.

## Quick Start

### 1. Clone

```bash
git clone https://github.com/saifullah3186/open-source-tool-installation-guide.git
cd open-source-tool-installation-guide
```

### 2. Make scripts executable

```bash
chmod +x scripts/install-ubuntu.sh scripts/verify.sh
```

### 3. Install the base environment

```bash
./scripts/install-ubuntu.sh
```

### 4. Verify the environment

```bash
./scripts/verify.sh
```

### 5. Run an example

```bash
cd examples/counter
./run.sh
```

If the counter example passes, your Verilog simulator is functioning.

## Repository structure

```text
open-source-tool-installation-guide/
├── README.md
├── LICENSE
├── INSTALL.md
├── VERIFY.md
├── .gitignore
│
├── scripts/
│   ├── install-ubuntu.sh
│   └── verify.sh
│
├── examples/
│   ├── counter/
│   │   ├── counter.v
│   │   ├── counter_tb.v
│   │   └── run.sh
│   │
│   ├── uart/
│   │   ├── uart.v
│   │   ├── uart_tb.v
│   │   └── run.sh
│   │
│   └── dft/
│       └── README.md
│
└── docs/
    └── troubleshooting.md
```

## Typical ASIC flow

The tools in this repository can be used as building blocks for a flow such as:

```text
Verilog RTL
    |
    v
Simulation
    |
    v
Synthesis
    |
    v
Timing / Netlist checks
    |
    v
Floorplanning
    |
    v
Placement
    |
    v
Clock Tree Synthesis
    |
    v
Routing
    |
    v
Physical verification
    |
    v
GDSII
```

For DFT-oriented work, a separate flow can be used for scan insertion, ATPG, MBIST and fault simulation. Those flows often require additional commercial or project-specific tools and are therefore not falsely represented as fully automated by this repository.

## Installation documentation

- [INSTALL.md](INSTALL.md) — installation and prerequisites
- [VERIFY.md](VERIFY.md) — verification and expected results
- [docs/troubleshooting.md](docs/troubleshooting.md) — common problems

## Examples

### Counter

A minimal synchronous counter and testbench using Icarus Verilog.

```bash
cd examples/counter
./run.sh
```

### UART

A small educational UART transmitter example.

```bash
cd examples/uart
./run.sh
```

### DFT

The DFT directory contains guidance for extending the environment for scan/ATPG/MBIST experiments.

## Supported environment

The primary target is:

- Ubuntu Linux
- Ubuntu under WSL2
- x86_64 systems

Other Linux distributions may work, but the installation script is deliberately conservative and is not intended to support every distribution automatically.

## Safety and reproducibility

The installer:

- checks the operating system
- uses `apt` only when available
- does not overwrite project source files
- avoids modifying shell startup files unnecessarily
- reports failures instead of hiding them
- makes existing installations detectable

Review scripts before running them on production systems.

## Contributing

Pull requests are welcome. When adding a tool:

1. Document why it is needed.
2. Add a detection check to `scripts/verify.sh`.
3. Update `INSTALL.md`.
4. Add or update an example where appropriate.
5. Test the change on a clean Ubuntu/WSL2 environment when possible.

## License

See [LICENSE](LICENSE).
