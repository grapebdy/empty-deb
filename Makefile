GIT_VER=`git log --oneline | head -n 1 | cut -d ' ' -f 1`
RELVERSION=$(shell date +%Y%m%d)-$(GIT_VER)
RELNAME=deb-rel-$(RELVERSION)
INSTALLDIR :=$(PWD)/$(RELNAME)

all: release

release: install
	@tar czmf $(RELNAME).tar.gz $(RELNAME)
	@rm -fr $(INSTALLDIR)

install:
	@echo "clean old release...."
	@rm -fr $(INSTALLDIR) deb-rel-*.tar.gz
	@mkdir $(INSTALLDIR)
	@cp -rf DEBIAN $(INSTALLDIR)
	@cp -rf install.sh $(INSTALLDIR)


clean:
	@rm -rf deb-rel-*
