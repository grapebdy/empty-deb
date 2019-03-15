# empty-deb
this is empty deb generation env
## 1) create software directory, like pcie-utils
      $ mkdir -p ./opt/pcie-utils

## 2) create scritps in DEBIAN folder

## 3) generate deb package
      $ dpkg-deb -b empty-deb pcie-utils-linux-i386.deb

## 4) install deb
      $ dpkg  -i pcie-utils-linux-i386.deb
