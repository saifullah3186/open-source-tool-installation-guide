#!/usr/bin/env bash
set -u

echo "=============================================="
echo " Open-Source ASIC Environment Installer"
echo "=============================================="

if [[ "${EUID}" -eq 0 ]]; then
    SUDO=""
else
    SUDO="sudo"
fi

if ! command -v apt >/dev/null 2>&1; then
    echo "ERROR: apt was not found."
    echo "This installer targets Debian/Ubuntu systems."
    exit 1
fi

echo
echo "[1/4] Updating package index..."
$SUDO apt update

PACKAGES=(
    git
    curl
    wget
    ca-certificates
    build-essential
    python3
    python3-pip
    python3-venv
    make
    cmake
    pkg-config
    unzip
    xz-utils
    bison
    flex
    gawk
    tcl
    tcl-dev
    libreadline-dev
    libffi-dev
    graphviz
)

echo
echo "[2/4] Installing base dependencies..."
$SUDO apt install -y "${PACKAGES[@]}"

echo
echo "[3/4] Installing available EDA packages from Ubuntu repositories..."

OPTIONAL_PACKAGES=(
    iverilog
    yosys
    klayout
    magic
    docker.io
)

for package in "${OPTIONAL_PACKAGES[@]}"; do
    if apt-cache show "$package" >/dev/null 2>&1; then
        echo "Installing available package: $package"
        $SUDO apt install -y "$package" || \
            echo "WARN: Could not install $package"
    else
        echo "WARN: $package is not available in this Ubuntu repository."
    fi
done

echo
echo "[4/4] Installation stage complete."
echo
echo "Next step:"
echo "  ./scripts/verify.sh"
echo
echo "Note: OpenROAD, OpenLane and Nix may require their"
echo "current upstream installation procedures."
