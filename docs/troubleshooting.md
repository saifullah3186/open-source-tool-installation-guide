# Troubleshooting

## `Permission denied` when running a script

Run:

```bash
chmod +x scripts/*.sh
chmod +x examples/*/run.sh
```

## `iverilog: command not found`

Install it:

```bash
sudo apt update
sudo apt install -y iverilog
```

Then:

```bash
iverilog -V
```

## `yosys: command not found`

Try:

```bash
sudo apt update
sudo apt install -y yosys
```

If the package is unavailable on your Ubuntu release, use the current upstream Yosys installation instructions.

## OpenROAD is not detected

OpenROAD packaging differs between distributions. Check:

```bash
command -v openroad
```

If nothing is returned, install OpenROAD using the current upstream instructions for your platform.

## Docker is installed but the daemon check fails

Check:

```bash
docker --version
sudo systemctl status docker
```

On some WSL2 setups, Docker Desktop integration is used instead of a Linux daemon inside the distribution.

## WSL2 filesystem performance

For large EDA projects, keeping repositories inside the Linux filesystem can be faster than working under `/mnt/c`.

For example:

```bash
mkdir -p ~/eda
cd ~/eda
```

## Script reports warnings

Warnings are intentional. Complex EDA tools often have multiple installation methods and version requirements. A warning means the verification script could not confirm that optional software is available.

## Git says `Author identity unknown`

Configure Git:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## GitHub says password authentication is not supported

GitHub no longer accepts account passwords for HTTPS Git operations. Use GitHub CLI authentication or a supported credential/token mechanism.

For GitHub CLI:

```bash
gh auth login
```

Then verify:

```bash
gh auth status
```

## Before reporting a bug

Collect:

```bash
uname -a
lsb_release -a
bash --version
git --version
./scripts/verify.sh
```

Then include the output when opening an issue.
