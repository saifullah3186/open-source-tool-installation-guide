# Installation Guide

## 1. Install WSL2

Open PowerShell as Administrator.

Run:

    wsl --install

Restart Windows if requested.

## 2. Install Ubuntu

Open PowerShell again.

Run:

    wsl --list --online

Install Ubuntu:

    wsl --install -d Ubuntu

Launch Ubuntu:

    wsl

Create your Ubuntu username and password when prompted.

## 3. Verify WSL2

From PowerShell:

    wsl --list --verbose

Ubuntu should show:

    VERSION 2

## 4. Update Ubuntu

Open Ubuntu.

Run:

    sudo apt update

Then:

    sudo apt upgrade -y

Install required basic packages:

    sudo apt install -y curl git

## 5. Install Docker Desktop

Download Docker Desktop for Windows from:

https://www.docker.com/products/docker-desktop/

Install Docker Desktop.

Open:

Docker Desktop
→ Settings
→ Resources
→ WSL Integration

Enable integration with your Ubuntu distribution.

Apply the settings.

## 6. Test Docker

Inside Ubuntu:

    docker --version

Then:

    docker run hello-world

You should see:

    Hello from Docker!

## 7. Create the EDA workspace

Run:

    mkdir -p ~/eda

Then:

    cd ~/eda

## 8. Install Nix

Run:

    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm --extra-conf "
    extra-substituters = https://openlane.cachix.org
    extra-trusted-public-keys = openlane.cachix.org-1:qqdwh+QMNGmZAuyeQJTH9ErW57OWSvdtuwfBKdS254E=
    "

Close Ubuntu and open it again.

Verify:

    nix --version

## 9. Download OpenLane 2

Run:

    cd ~/eda

Clone OpenLane:

    git clone https://github.com/efabless/openlane2.git

Enter the directory:

    cd ~/eda/openlane2

## 10. Start the OpenLane environment

Run:

    nix-shell shell.nix

Wait for Nix to download the required dependencies.

When complete, the prompt should contain:

    [nix-shell:~/eda/openlane2]$

## 11. Verify OpenLane

Run:

    openlane --version

Then:

    openroad -version

Then:

    yosys --version

## 12. Run the OpenLane smoke test

Run:

    openlane --smoke-test

The expected result is:

    Smoke test passed.

## 13. Install Icarus Verilog

Exit the Nix shell:

    exit

Update Ubuntu:

    sudo apt update

Install Icarus:

    sudo apt install -y iverilog

Verify:

    iverilog -v

## 14. Install Fault

Fault is installed using its official Docker image.

Run:

    docker pull ghcr.io/aucohl/fault:latest

Verify:

    docker run --rm ghcr.io/aucohl/fault:latest fault --version

A successful installation should print the Fault version.

## 15. Create the design workspace

Run:

    mkdir -p ~/eda/designs

Your EDA workspace should now contain:

    ~/eda/
    ├── openlane2/
    └── designs/

## Installation Complete

You now have:

- OpenLane 2
- OpenROAD
- Yosys
- KLayout
- Magic
- Icarus Verilog
- Fault
- Docker
- Nix

Run the verification instructions in VERIFY.md before starting the examples.
