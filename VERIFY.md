# Verification

## 1. Check Docker

    docker --version

## 2. Check Icarus Verilog

    iverilog -v

The output should contain:

    Icarus Verilog version

## 3. Check Nix

    nix --version

## 4. Check Fault

    docker run --rm ghcr.io/aucohl/fault:latest fault --version

## 5. Check OpenLane

    cd ~/eda/openlane2

Enter the environment:

    nix-shell shell.nix

Then:

    openlane --version

    openroad -version

    yosys --version

## 6. Run the smoke test

    openlane --smoke-test

Expected result:

    Smoke test passed.

If the smoke test passes, OpenLane is working correctly.

## 7. Exit the Nix environment

    exit
