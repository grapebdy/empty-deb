# empty-deb
this is empty deb generation env
## 1) install deb package, folder contains releases
      $ make install
      $ ls
      deb-rel-20190315-c9112b7

## 2) create software directory like pcie-utils in deb-rel-, and copy install files
      $ mkdir -p ./opt/pcie-utils
      $ cp -fr software_path/ ./opt/pcie-utils/

## 3) create scritps in DEBIAN folder
      postinst:  postinstallation
      postrm:    postremove
      preinst:   preinstallation
      prerm:     preremove

## 4) generate deb package
      $ dpkg-deb -b deb-rel-20190315-c9112b7 pcie-utils-linux-i386.deb

## 5) install deb
      $ dpkg  -i pcie-utils-linux-i386.deb
