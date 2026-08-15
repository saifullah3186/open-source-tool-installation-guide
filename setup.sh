#!/usr/bin/env bash

set -e

echo "=================================================="
echo " Open-Source ASIC Learning Environment"
echo " Automated Setup"
echo "=================================================="
echo

# --------------------------------------------------
# Check that we are running on Linux/WSL
# --------------------------------------------------

if [[ "$(uname -s)" != "Linux" ]]; then
    echo "ERROR: This script must be run inside Ubuntu/WSL."
    exit 1
fi

echo "[1/7] Checking Ubuntu environment..."
echo "Linux detected."
echo

# --------------------------------------------------
# Update Ubuntu
# --------------------------------------------------

echo "[2/7] Updating Ubuntu package lists..."

sudo apt update

echo

# --------------------------------------------------
# Install basic dependencies + Icarus Verilog
# --------------------------------------------------

echo "[3/7] Installing required Ubuntu packages..."

sudo apt install -y \
    curl \
    git \
    iverilog

echo

# --------------------------------------------------
# Check Docker
# --------------------------------------------------

echo "[4/7] Checking Docker..."

if ! command -v docker >/dev/null 2>&1; then
    echo
    echo "ERROR: Docker is not installed or is not available."
    echo
    echo "Please install Docker Desktop for Windows and enable"
    echo "WSL integration for your Ubuntu distribution."
    echo
    exit 1
fi

if ! docker info >/dev/null 2>&1; then
    echo
    echo "ERROR: Docker is installed but the Docker daemon"
    echo "is not available."
    echo
    echo "Please start Docker Desktop and make sure WSL integration"
    echo "is enabled for Ubuntu."
    echo
    exit 1
fi

echo "Docker is working."
echo

# --------------------------------------------------
# Create EDA directory
# --------------------------------------------------

echo "[5/7] Creating EDA workspace..."

mkdir -p "$HOME/eda"

echo

# --------------------------------------------------
# Install Nix
# --------------------------------------------------

echo "[6/7] Checking Nix..."

if command -v nix >/dev/null 2>&1; then

    echo "Nix is already installed."
    nix --version

else

    echo "Nix is not installed."
    echo "Installing Nix..."

    curl --proto '=https' \
         --tlsv1.2 \
         -sSf \
         -L https://install.determinate.systems/nix \
         | sh -s -- install --no-confirm \
         --extra-conf "
extra-substituters = https://openlane.cachix.org
extra-trusted-public-keys = openlane.cachix.org-1:qqdwh+QMNGmZAuyeQJTH9ErW57OWSvdtuwfBKdS254E=
"

fi

echo

# --------------------------------------------------
# Download OpenLane 2
# --------------------------------------------------

echo "[7/7] Downloading OpenLane 2..."

if [[ -d "$HOME/eda/openlane2/.git" ]]; then

    echo "OpenLane 2 is already present."

else

    git clone \
        https://github.com/efabless/openlane2.git \
        "$HOME/eda/openlane2"

fi

echo

# --------------------------------------------------
# Download Fault Docker image
# --------------------------------------------------

echo "Downloading Fault Docker image..."

docker pull ghcr.io/aucohl/fault:latest

echo

# --------------------------------------------------
# Finished
# --------------------------------------------------

echo "=================================================="
echo " Setup completed successfully!"
echo "=================================================="
echo

echo "Installed / configured:"
echo
echo "  - Icarus Verilog"
echo "  - Docker"
echo "  - Nix"
echo "  - OpenLane 2"
echo "  - Fault"
echo

echo "IMPORTANT:"
echo
echo "If Nix was installed during this setup, close Ubuntu"
echo "completely and open it again."
echo

echo "Then run:"
echo
echo "  cd ~/eda/openlane2"
echo "  nix-shell shell.nix"
echo
echo "Then test OpenLane with:"
echo
echo "  openlane --smoke-test"
echo

echo "After that, run the verification instructions"
echo "in VERIFY.md."
echo
