# Open-Source ASIC Learning Environment

A simple, reproducible ASIC learning environment for Windows users using WSL2, Ubuntu, Docker and Nix.

The environment provides a complete open-source RTL-to-ASIC learning flow together with simulation and DFT/ATPG tools.

## Included Tools

- OpenLane 2
- OpenROAD
- Yosys
- KLayout
- Magic
- Icarus Verilog
- Fault
- Docker
- Nix

## Environment Architecture

```text
Windows
│
└── WSL2
    │
    └── Ubuntu
        │
        ├── Nix
        │   └── OpenLane 2
        │       ├── OpenROAD
        │       ├── Yosys
        │       ├── KLayout
        │       └── Magic
        │
        ├── Icarus Verilog
        │
        └── Docker
            └── Fault
