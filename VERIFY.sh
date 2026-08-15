
# Verification Guide

This guide checks that all components of the Open-Source ASIC Learning Environment are installed and working correctly.

Run these checks after completing the installation described in `INSTALL.md`.

---

## 1. Check Git

Run:

```bash
git --version
````

You should see a Git version number, for example:

```text
git version 2.x.x
```

---

## 2. Check Docker

Run:

```bash
docker --version
```

Then run the Docker test image:

```bash
docker run hello-world
```

A successful installation should display:

```text
Hello from Docker!
```

Docker must be running before continuing with the Fault check.

---

## 3. Check Icarus Verilog

Run:

```bash
iverilog -V
```

You should see output containing:

```text
Icarus Verilog version
```

The expected version for the tested environment is:

```text
Icarus Verilog version 12.0
```

---

## 4. Check Nix

Run:

```bash
nix --version
```

A Nix version should be displayed.

---

## 5. Check Fault

Fault is provided through Docker.

Run:

```bash
docker run --rm ghcr.io/aucohl/fault:latest fault --version
```

A successful installation should display the Fault version.

The tested environment currently uses:

```text
Fault 0.7.0
```

---

## 6. Check OpenLane 2

Go to the OpenLane 2 installation:

```bash
cd ~/eda/openlane2
```

Start the OpenLane Nix environment:

```bash
nix-shell shell.nix
```

Your terminal prompt should change to something similar to:

```text
[nix-shell:~/eda/openlane2]$
```

Now check OpenLane:

```bash
openlane --version
```

---

## 7. Check OpenROAD

OpenROAD is provided through the OpenLane Nix environment.

Inside the Nix shell, run:

```bash
openroad -version
```

A successful installation should display the OpenROAD version.

---

## 8. Check Yosys

Inside the Nix shell, run:

```bash
yosys --version
```

A successful installation should display the Yosys version.

---

## 9. Check KLayout

Inside the Nix shell, run:

```bash
klayout -v
```

A successful installation should display the KLayout version.

---

## 10. Check Magic

Inside the Nix shell, run:

```bash
magic -version
```

A successful installation should display the Magic version.

---

## 11. Run the OpenLane Smoke Test

Make sure you are inside the OpenLane Nix environment:

```bash
cd ~/eda/openlane2
nix-shell shell.nix
```

Then run:

```bash
openlane --smoke-test
```

A successful installation should finish with:

```text
Smoke test passed.
```

This is the most important OpenLane verification.

---

# Complete Environment

After successful installation, the environment should look approximately like this:

```text
Windows
│
└── WSL2
    │
    └── Ubuntu
        │
        ├── Nix
        │   │
        │   └── OpenLane 2
        │       │
        │       ├── OpenROAD
        │       ├── Yosys
        │       ├── KLayout
        │       └── Magic
        │
        ├── Icarus Verilog
        │
        └── Docker
            │
            └── Fault
```

The tools have different roles:

```text
Icarus Verilog
      │
      └── RTL simulation

OpenLane 2
      │
      ├── Yosys
      │      └── Logic synthesis
      │
      ├── OpenROAD
      │      └── Physical design
      │
      ├── KLayout
      │      └── Layout viewing / analysis
      │
      └── Magic
             └── Physical verification / layout

Fault
      │
      └── DFT / ATPG / fault simulation
```

---

# Quick Verification

If you only want to perform the essential checks, run:

```bash
git --version
```

```bash
docker --version
```

```bash
iverilog -V
```

```bash
nix --version
```

```bash
docker run --rm ghcr.io/aucohl/fault:latest fault --version
```

Then:

```bash
cd ~/eda/openlane2
nix-shell shell.nix
```

And:

```bash
openlane --version
```

```bash
openroad -version
```

```bash
yosys --version
```

Finally:

```bash
openlane --smoke-test
```

The expected final result is:

```text
Smoke test passed.
```

---

# Troubleshooting

## Docker does not work

Make sure:

1. Docker Desktop is installed.
2. Docker Desktop is running.
3. WSL integration is enabled for your Ubuntu distribution.

Test with:

```bash
docker run hello-world
```

If this does not work, fix Docker before attempting the Fault installation.

---

## Fault does not work

First check Docker:

```bash
docker run hello-world
```

Then try:

```bash
docker run --rm ghcr.io/aucohl/fault:latest fault --version
```

Fault is intentionally run through Docker so that its Python dependencies do not interfere with Ubuntu's system Python environment.

---

## OpenLane does not work

Go to:

```bash
cd ~/eda/openlane2
```

Start the Nix environment:

```bash
nix-shell shell.nix
```

Then run:

```bash
openlane --smoke-test
```

If the smoke test passes:

```text
Smoke test passed.
```

OpenLane is functioning correctly.

---

## Nix commands are not found

If Nix was just installed, close the Ubuntu terminal completely and open Ubuntu again.

Then run:

```bash
nix --version
```

If Nix is still unavailable, review the Nix installation section in `INSTALL.md`.

---

# Successful Installation

The environment is considered ready when:

* Docker works
* Icarus Verilog works
* Nix works
* Fault works
* OpenLane works
* OpenROAD works
* Yosys works
* The OpenLane smoke test passes

The most important confirmation is:

```text
Smoke test passed.
```

The system is then ready for the ASIC learning examples in this repository.
