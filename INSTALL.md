# Installation Guide

## Prerequisites

Recommended:

- Ubuntu 22.04/24.04 or a compatible Ubuntu release
- WSL2 on Windows, if using Windows
- Internet connection
- sudo access
- at least several GB of free disk space

For large ASIC flows, substantially more disk space may be required.

## 1. Update Ubuntu

```bash
sudo apt update
sudo apt upgrade -y
```

## 2. Install basic packages

```bash
sudo apt install -y \
  git \
  curl \
  wget \
  build-essential \
  ca-certificates \
  python3 \
  python3-pip \
  python3-venv \
  make \
  cmake \
  pkg-config \
  unzip \
  xz-utils \
  bison \
  flex \
  libreadline-dev \
  gawk \
  tcl-dev \
  libffi-dev \
  graphviz
```

## 3. Run the project installer

From the repository root:

```bash
chmod +x scripts/install-ubuntu.sh
./scripts/install-ubuntu.sh
```

The installer installs safe/base dependencies and attempts to install packages that are directly available through Ubuntu's package manager.

It does **not** blindly claim that every EDA tool is installed. Some tools have version-specific upstream installation procedures.

## 4. Verify

```bash
chmod +x scripts/verify.sh
./scripts/verify.sh
```

The verification script reports:

- PASS — tool detected and executable
- WARN — optional tool not detected
- FAIL — required base dependency missing

## 5. Icarus Verilog example

```bash
cd examples/counter
./run.sh
```

Expected result:

```text
PASS: counter test completed successfully.
```

## 6. Yosys

If Yosys is available:

```bash
yosys -V
```

A version string confirms that the executable is available.

## 7. OpenROAD

If OpenROAD is installed:

```bash
openroad -version
```

The exact version and command-line output depend on the installed release.

## 8. Docker

Check:

```bash
docker --version
```

If Docker is installed but the daemon is not running, the version command can still succeed. The verification script therefore distinguishes executable detection from daemon availability.

## 9. Nix

Check:

```bash
nix --version
```

Nix installation is optional. If you use Nix as your package/environment manager, follow the current official Nix installation documentation for your platform.

## 10. OpenLane

OpenLane has version-specific installation and dependency requirements. Do not assume that installing a package called `openlane` automatically gives you a working ASIC flow.

After installing OpenLane using its current upstream instructions, verify it using the command appropriate to the installed version.

## WSL2 notes

If using Windows:

1. Enable WSL2.
2. Install a supported Ubuntu distribution.
3. Keep active Linux projects inside the Linux filesystem where practical.
4. Avoid unnecessarily mixing Windows and Linux toolchains.
5. Make shell scripts executable:

```bash
chmod +x scripts/*.sh examples/*/run.sh
```

## Re-running the installer

The installer is intended to be reasonably safe to run again. It should detect packages that are already installed rather than treating them as errors.

## Troubleshooting

See [docs/troubleshooting.md](docs/troubleshooting.md).
