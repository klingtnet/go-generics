#!/usr/bin/env bash

# For details see https://go.googlesource.com/go/+/refs/heads/dev.go2go/README.go2go.md

set -euo pipefail

git clone https://go.googlesource.com/go goroot
pushd goroot
git checkout dev.go2go
pushd src
./all.bash
popd
popd

