#!/bin/bash

# This script sets up RPM Fusion repositories and installs multimedia packages on Fedora.

# Exit immediately if a command exits with a non-zero status
set -e

# Install RPM Fusion Free repository
echo "Installing RPM Fusion Free repository..."
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# Install RPM Fusion Non-Free repository
echo "Installing RPM Fusion Non-Free repository..."
sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install Intel Media Driver
echo "Installing Intel Media Driver..."
sudo dnf install -y intel-media-driver

# Swap FFmpeg packages
echo "Swapping FFmpeg packages..."
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing

# Update multimedia group
echo "Updating multimedia group..."
sudo dnf groupupdate -y multimedia

echo "Setup completed successfully!"