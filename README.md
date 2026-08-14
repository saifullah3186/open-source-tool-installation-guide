# Open-Source ASIC Learning Environment

A reproducible open-source ASIC learning environment for Windows users using WSL2 and Ubuntu.

This environment is designed for learning the complete digital ASIC flow using open-source tools.

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

## Architecture

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

## What You Can Learn

This environment can be used to learn:

- Verilog/SystemVerilog
- RTL design
- RTL simulation
- Logic synthesis
- Static timing analysis
- Floorplanning
- Placement
- Clock tree synthesis
- Routing
- Physical verification
- DFT concepts
- ATPG
- Fault simulation
- Fault coverage
- RTL-to-GDSII workflows

## Requirements

A Windows computer with:

- Windows 10/11
- WSL2
- Ubuntu
- Docker Desktop
- Internet connection
- Sufficient disk space

## Installation

Follow the complete installation instructions in:

INSTALL.md

After installation, run:

    ./scripts/verify.sh

A successful installation should report:

    Smoke test passed.

## Project Structure

    open-source-asic-learning/
    │
    ├── README.md
    ├── INSTALL.md
    ├── VERIFY.md
    │
    ├── scripts/
    │   ├── install-ubuntu.sh
    │   └── verify.sh
    │
    └── examples/
        ├── counter/
        ├── uart/
        └── dft/

## Important

This repository contains instructions, scripts and learning material.

The actual OpenLane, OpenROAD, Nix and Docker dependencies are downloaded from their respective upstream projects.

Do not manually copy an existing WSL installation or /nix/store into this repository.

## License

MIT
