# VirshGPU
CLI management of VMs with dedicated GPUs.

Script management and 1 liners for spinning up VMs for gaming and for research on multi GPU systems.

Currently placeholder repo for future additions.

Ubunutu 22 server supported and tested with U22Servers and Windows 10 guests.

Install necessary packages:
```
sudo apt install qemu-kvm libvirt-daemon-system libvirt-daemon virtinst bridge-utils libosinfo-bin
```

Create win 10 VM:

```
sudo virt-install --name win10gaming --ram 8192 --vcpus sockets=1,cores=3,threads=2 --os-variant win10 --graphics vnc,listen=0.0.0.0 --cdrom windows_10.iso --disk path=virtio-win-0.1.229.iso,device=cdrom --disk size=60,bus=virtio,cache=writeback --boot uefi,loader=/usr/share/OVMF/OVMF_CODE_4M.fd
```

Addition of GPU(s) and HDMI interfaces
```
virt-xml win10gaming --add-device --hostdev pci_0000_XX_00_0
virt-xml win10gaming --add-device --hostdev pci_0000_XX_00_1
```

Actual PCI bus might differ, check with:
```
lspci -nnk | grep -i -e VGA -e HDMI -A3
```
You might also have more functions than one, aka the might be pci_0000_XX_00_1, pci_0000_XX_00_2, pci_0000_XX_00_3... and so on.

Win10 download location(pick english - magnet):

 [https://tb.rg-adguard.net/public.php](https://tb.rg-adguard.net/public.php)

These are the official images, so you still need a serial number.

Scripts and full explanations come later

List all installed VMs:
```bash
virsh list --all
```