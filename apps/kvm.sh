#!/usr/bin/env bash


VIRT_SUPPORT=`egrep -c '(vmx|svm)' /proc/cpuinfo`
if (($VIRT_SUPPORT)); then
    echo "Virtualization support ok"
else
    echo "Virtualization support NOT ok... exiting"
    return &>/dev/null || exit
fi

sudo apt update

sudo apt install -y cpu-checker qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

ME=`whoami`

sudo adduser $ME libvirt

sudo adduser $ME kvm

sudo apt install -y virt-manager
