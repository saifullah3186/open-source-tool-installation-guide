#!/usr/bin/env bash
set -e

if ! command -v iverilog >/dev/null 2>&1; then
    echo "ERROR: Icarus Verilog is not installed."
    echo "Run ../../scripts/install-ubuntu.sh or install iverilog manually."
    exit 1
fi

iverilog -g2012 -o counter_sim counter.v counter_tb.v
vvp counter_sim
rm -f counter_sim
