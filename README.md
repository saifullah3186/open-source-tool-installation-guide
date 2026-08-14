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
What can be learned?

This environment can be used to study:

Verilog/SystemVerilog
RTL design
RTL simulation
Logic synthesis
Static timing analysis
Floorplanning
Placement
Clock tree synthesis
Routing
Physical design
RTL-to-GDSII flow
Design-for-Test (DFT)
ATPG
Fault simulation
Fault coverage
Requirements

Before running the Linux setup script, install:

Windows 10/11
WSL2
Ubuntu
Docker Desktop

The installation guide explains how to install these prerequisites.

Installation

Clone this repository inside Ubuntu:

git clone https://github.com/saifullah3186/open-source-tool-installation-guide.git

Enter the repository:

cd open-source-tool-installation-guide

Run the setup:

./setup.sh

After the setup completes, close Ubuntu and open it again.

Then verify the installation:

cd ~/open-source-tool-installation-guide
./verify.sh
OpenLane Smoke Test

The verification script also checks the OpenLane installation.

A successful installation should report:

Smoke test passed.
Important

This repository contains installation scripts, documentation and learning material.

The actual EDA tools and dependencies are downloaded from their respective upstream projects.

This repository does not contain:

/nix/store
Docker images
WSL filesystem images
Python virtual environments
OpenLane dependencies copied from another computer

This keeps the project small and reproducible.

Project Structure
open-source-tool-installation-guide/
│
├── README.md
├── INSTALL.md
├── VERIFY.md
├── setup.sh
├── verify.sh
└── LICENSE
License

MIT
