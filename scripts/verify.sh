#!/usr/bin/env bash

set -u

PASS=0
WARN=0
FAIL=0

echo "=============================================="
echo " Open-Source ASIC Environment Verification"
echo "=============================================="
echo

check_required() {
    local name="$1"
    local command="$2"

    if command -v "$command" >/dev/null 2>&1; then
        echo "[PASS] $name"
        PASS=$((PASS + 1))
    else
        echo "[FAIL] $name"
        FAIL=$((FAIL + 1))
    fi
}

check_optional() {
    local name="$1"
    local command="$2"

    if command -v "$command" >/dev/null 2>&1; then
        echo "[PASS] $name"
        PASS=$((PASS + 1))
    else
        echo "[WARN] $name"
        WARN=$((WARN + 1))
    fi
}

check_required "git" "git"
check_required "python3" "python3"
check_required "make" "make"
check_required "gcc" "gcc"

check_optional "Icarus Verilog" "iverilog"
check_optional "Yosys" "yosys"
check_optional "OpenROAD" "openroad"
check_optional "KLayout" "klayout"
check_optional "Magic" "magic"
check_optional "Docker" "docker"
check_optional "Nix" "nix"

echo
echo "----------------------------------------------"
echo " Version information"
echo "----------------------------------------------"

if command -v iverilog >/dev/null 2>&1; then
    iverilog -V 2>&1 | head -n 2
fi

if command -v yosys >/dev/null 2>&1; then
    yosys -V 2>&1 | head -n 1
fi

if command -v openroad >/dev/null 2>&1; then
    openroad -version 2>&1 | head -n 1
fi

if command -v klayout >/dev/null 2>&1; then
    klayout -v 2>&1 | head -n 1
fi

if command -v magic >/dev/null 2>&1; then
    magic -version 2>&1 | head -n 1
fi

if command -v docker >/dev/null 2>&1; then
    docker --version
    if docker info >/dev/null 2>&1; then
        echo "[PASS] Docker daemon"
        PASS=$((PASS + 1))
    else
        echo "[WARN] Docker daemon not running/accessible"
        WARN=$((WARN + 1))
    fi
fi

echo
echo "=============================================="
echo " Summary"
echo "=============================================="
echo "  PASS: $PASS"
echo "  WARN: $WARN"
echo "  FAIL: $FAIL"
echo

if [[ "$FAIL" -gt 0 ]]; then
    echo "Verification found missing required dependencies."
    exit 1
fi

echo "Verification completed."
exit 0
