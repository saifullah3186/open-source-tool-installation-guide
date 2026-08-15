# Installation Guide


This guide sets up an open-source ASIC learning environment on Windows using WSL2, Ubuntu, Docker and Nix.


---


# Part 1 — Windows Prerequisites


## 1. Install WSL2


Open **PowerShell as Administrator** and run:


```powershell
wsl --install

Restart Windows if requested.

After restarting, open PowerShell and check:

wsl --list --verbose

Your Ubuntu installation should use:

VERSION 2
2. Install Ubuntu

If Ubuntu was not installed automatically, run:

wsl --list --online

Then install Ubuntu:

wsl --install -d Ubuntu

Launch Ubuntu:

wsl

Ubuntu will ask you to create a Linux username and password.

Part 2 — Install Docker Desktop

Download and install Docker Desktop for Windows.

After installation:

Open Docker Desktop.
Open Settings.
Go to Resources → WSL Integration.
Enable integration with your Ubuntu distribution.
Apply the settings.

Open Ubuntu and test Docker:

docker --version

Then:

docker run hello-world

You should see:

Hello from Docker!

If this works, Docker is ready.

Part 3 — Download This Repository

Inside Ubuntu, run:

cd ~

Clone this repository:

git clone https://github.com/saifullah3186/open-source-tool-installation-guide.git

Enter the repository:

cd ~/open-source-tool-installation-guide
Part 4 — Run the Automated Setup

Make the setup script executable:

chmod +x setup.sh

Run:

./setup.sh

The script will install and configure the Linux-side components required for the ASIC learning environment.

These include:

Nix
OpenLane 2
Icarus Verilog
Fault Docker image
Part 5 — Restart Ubuntu

If Nix was installed during setup, close the Ubuntu terminal completely.

Open Ubuntu again.

This allows the newly installed Nix environment to be loaded correctly.

Part 6 — Verify the Installation

Return to the repository:

cd ~/open-source-tool-installation-guide

Make the verification script executable:

chmod +x verify.sh

Run:

./verify.sh

The script checks:

Docker
Nix
Icarus Verilog
Fault
OpenLane 2
OpenROAD
Yosys

It also runs the OpenLane smoke test.

A successful OpenLane installation should report:

Smoke test passed.
Part 7 — Start Using OpenLane

OpenLane 2 is installed in:

~/eda/openlane2

To enter the OpenLane development environment manually:

cd ~/eda/openlane2

Then:

nix-shell shell.nix

Inside the environment you can use:

openlane --version
openroad -version
yosys --version
Part 8 — Icarus Verilog

Icarus Verilog can be used directly from Ubuntu:

iverilog -v

It can be used for RTL simulation independently of OpenLane.

Part 9 — Fault

Fault is provided through Docker.

Check the installed Fault version with:

docker run --rm ghcr.io/aucohl/fault:latest fault --version

This avoids installing Fault's older Python dependencies directly into the Ubuntu system Python environment.

Final Environment

After successful installation, the environment looks like:

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

The environment is now ready for ASIC design, RTL simulation, synthesis, physical design and DFT/ATPG learning.
