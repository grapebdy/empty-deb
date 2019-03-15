# empty-deb
this is empty deb generation env
## 1) create software directory like pcie-utils, and copy install files
      $ mkdir -p ./opt/pcie-utils
      $ cp -fr software_path/ ./opt/pcie-utils/

## 2) create scritps in DEBIAN folder
      postinst:  postinstallation
      postrm:    postremove
      preinst:   preinstallation
      prerm:     preremove

## 3) generate deb package
      $ dpkg-deb -b empty-deb pcie-utils-linux-i386.deb

## 4) install deb
      $ dpkg  -i pcie-utils-linux-i386.deb
