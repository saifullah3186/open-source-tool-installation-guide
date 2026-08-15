#!/usr/bin/env bash
set -e

if ! command -v iverilog >/dev/null 2>&1; then
    echo "ERROR: Icarus Verilog is not installed."
    exit 1
fi

iverilog -g2012 -o uart_sim uart.v uart_tb.v
vvp uart_sim
rm -f uart_sim
