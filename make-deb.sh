#!/bin/bash
DEB_TOOLS_DIR=/tmp/deb-empty
RELEASEDIR=$1
OUTDIR=$2
INSTALLDIR=$3
TOOLNAME=$4

function download_deb_repo() {
	git clone https://github.com/grapebdy/empty-deb.git $DEB_TOOLS_DIR
	cd $DEB_TOOLS_DIR && make install;
}

function generate_deb() {
	VERSION_DIR=`cat $DEB_TOOLS_DIR/version`

	mkdir  -p $DEB_TOOLS_DIR/$VERSION_DIR/$INSTALLDIR

	cp -a $RELEASEDIR/etc/deb/postinst $DEB_TOOLS_DIR/$VERSION_DIR/DEBIAN/
	cp -a $RELEASEDIR/etc/deb/prerm $DEB_TOOLS_DIR/$VERSION_DIR/DEBIAN/
	cp -a $RELEASEDIR/etc/deb/control $DEB_TOOLS_DIR/$VERSION_DIR/DEBIAN/

	rm -fr $DEB_TOOLS_DIR/$VERSION_DIR/$INSTALLDIR/*

	cp -a $RELEASEDIR/* $DEB_TOOLS_DIR/$VERSION_DIR/$INSTALLDIR/
	dpkg -b $DEB_TOOLS_DIR/$VERSION_DIR $OUTDIR/$TOOLNAME
}

function main() {
	if [ ! -d $DEB_TOOLS_DIR ]
	then
		download_deb_repo
	fi

	generate_deb
}

if [ $# -le 1 ]
then

	echo "./make-deb.sh srcdir outdir installdir deb-file-name"
	exit 1
fi

main $1 $2
