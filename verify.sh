#!/usr/bin/env bash

set -e

echo "=================================================="
echo " Open-Source ASIC Learning Environment"
echo " Verification"
echo "=================================================="
echo

# --------------------------------------------------
# Helper
# --------------------------------------------------

pass() {
    echo "PASS: $1"
}

fail() {
    echo "FAIL: $1"
    exit 1
}

# --------------------------------------------------
# Git
# --------------------------------------------------

echo "[1/7] Checking Git..."

if command -v git >/dev/null 2>&1; then
    git --version
    pass "Git"
else
    fail "Git is not installed"
fi

echo

# --------------------------------------------------
# Docker
# --------------------------------------------------

echo "[2/7] Checking Docker..."

if ! command -v docker >/dev/null 2>&1; then
    fail "Docker command not found"
fi

docker --version

if ! docker info >/dev/null 2>&1; then
    fail "Docker daemon is not running or WSL integration is unavailable"
fi

pass "Docker"

echo

# --------------------------------------------------
# Icarus Verilog
# --------------------------------------------------

echo "[3/7] Checking Icarus Verilog..."

if command -v iverilog >/dev/null 2>&1; then
    iverilog -V 2>&1 | head -1
    pass "Icarus Verilog"
else
    fail "Icarus Verilog is not installed"
fi

echo

# --------------------------------------------------
# Nix
# --------------------------------------------------

echo "[4/7] Checking Nix..."

# Try to load the Nix environment if it is not
# already available in the current shell.

if ! command -v nix >/dev/null 2>&1; then
    if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
        source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    fi
fi

if command -v nix >/dev/null 2>&1; then
    nix --version
    pass "Nix"
else
    fail "Nix is not available. Close and reopen Ubuntu, then try again."
fi

echo

# --------------------------------------------------
# Fault
# --------------------------------------------------

echo "[5/7] Checking Fault..."

FAULT_VERSION="$(
    docker run --rm ghcr.io/aucohl/fault:latest fault --version
)"

echo "$FAULT_VERSION"

if [[ "$FAULT_VERSION" == *"Fault"* ]]; then
    pass "Fault"
else
    fail "Fault Docker image could not be executed"
fi

echo

# --------------------------------------------------
# OpenLane / OpenROAD / Yosys
# --------------------------------------------------

echo "[6/7] Checking OpenLane environment..."

OPENLANE_DIR="$HOME/eda/openlane2"

if [[ ! -d "$OPENLANE_DIR" ]]; then
    fail "OpenLane 2 directory not found at $OPENLANE_DIR"
fi

cd "$OPENLANE_DIR"

echo "OpenLane directory: $OPENLANE_DIR"
echo

echo "Starting OpenLane Nix environment..."

nix-shell shell.nix --run '
    echo
    echo "OpenLane:"
    openlane --version

    echo
    echo "OpenROAD:"
    openroad -version

    echo
    echo "Yosys:"
    yosys --version

    echo
    echo "KLayout:"
    klayout -v

    echo
    echo "Magic:"
    magic -version
'

echo

# --------------------------------------------------
# OpenLane smoke test
# --------------------------------------------------

echo "[7/7] Running OpenLane smoke test..."

nix-shell shell.nix --run '
    openlane --smoke-test
'

echo
echo "=================================================="
echo " ALL CHECKS PASSED"
echo "=================================================="
echo
echo "Your open-source ASIC learning environment is ready."
echo
echo "You can now start working with:"
echo
echo "  - Verilog / RTL"
echo "  - Icarus Verilog"
echo "  - OpenLane 2"
echo "  - OpenROAD"
echo "  - Yosys"
echo "  - KLayout"
echo "  - Magic"
echo "  - Fault"
echo "  - DFT / ATPG"
echo
echo "=================================================="
