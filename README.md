# Project Helix

A baremetal x86_64 operating system, custom programming language, and high-frequency trading infrastructure.

## Components

| Component | Description | Status |
|---|---|---|
| **HelixOS** | Baremetal x86_64 kernel written in Rust | 🚧 In Progress |
| **HelixLang** | Custom systems language + compiler | ⏳ Planned |
| **HFT Engine** | Sub-microsecond trading infrastructure | ⏳ Planned |
| **ML Pipeline** | Model compiler (PyTorch → HelixLang → native) | ⏳ Planned |
| **GPU Pipeline** | DGX A100 market sim, RL training, NAS | ⏳ Planned |

## Quick Start

```bash
# Install dependencies (WSL2 Ubuntu)
sudo apt install qemu-system-x86
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly
rustup component add rust-src llvm-tools-preview
cargo install bootimage

# Build and run
cd helix-os
cargo bootimage
# OR use the run script:
chmod +x tools/run.sh
./tools/run.sh
```

## Project Structure

```
Helix/
├── helix-os/          # Baremetal kernel
├── helix-lang/        # Language + compiler
├── helix-gpu/         # GPU/DGX pipeline (Phase 8-9)
├── tools/             # Build/run scripts
└── docs/              # Architecture & specs
```

## Benchmark Targets

| Component | Target | Status |
|---|---|---|
| ITCH Parse | < 30ns/msg | ⏳ |
| Order Book Update | < 50ns | ⏳ |
| Matching Engine | < 50ns | ⏳ |
| ML Inference | < 200ns | ⏳ |
| Wire-to-Wire | < 2µs | ⏳ |
| vs PyTorch | 1000x faster | ⏳ |
| vs A100 TensorRT | 44x faster | ⏳ |
| DGX Power Draw | > 9.5kW | ⏳ |
