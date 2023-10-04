#!/bin/bash

# List of packages to check
packages=("qemu-kvm" "libvirt-daemon-system" "libvirt-daemon" "virtinst" "bridge-utils" "libosinfo-bin")

# Variable to store missing packages
missing_packages=()

# Loop through each package and check if it's available
for package in "${packages[@]}"
do
    dpkg -s $package &> /dev/null

    if [ $? -ne 0 ]; then
        missing_packages+=($package)
    fi
done

# Check if any packages are missing
if [ ${#missing_packages[@]} -eq 0 ]; then
    echo -e "\nAll checks passed!"
else
    echo -e "\nChecks failed. The missing packages are:"
    for package in "${missing_packages[@]}"
    do
        echo $package
    done
fi
