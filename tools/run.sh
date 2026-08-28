#!/usr/bin/env bash
# HelixOS — Build and run in QEMU
# Usage: ./tools/run.sh [--debug] [--serial-only]

set -euo pipefail

cd "$(dirname "$0")/.."

QEMU_ARGS=(
    -drive "format=raw,file=target/x86_64-helix/debug/bootimage-helix-os.bin"
    -serial stdio
    -m 256M
    -smp 2
    -no-reboot
)

# Add VGA display unless --serial-only
if [[ "${1:-}" != "--serial-only" ]]; then
    QEMU_ARGS+=(-display gtk)
else
    QEMU_ARGS+=(-display none)
fi

# Add GDB stub if --debug
if [[ "${1:-}" == "--debug" ]]; then
    QEMU_ARGS+=(-s -S)
    echo "GDB server listening on localhost:1234"
    echo "Connect with: gdb -ex 'target remote :1234'"
fi

# Build first
echo "=== Building HelixOS ==="
cd helix-os
cargo bootimage

echo "=== Launching QEMU ==="
qemu-system-x86_64 "${QEMU_ARGS[@]}"
