#!/usr/bin/env bash

nix-store --gc
sudo nix-store --gc
sudo nix-collect-garbage -d
nix-collect-garbage -d
sudo nix-store --optimize
