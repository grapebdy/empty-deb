GIT_VER=`git log --oneline | head -n 1 | cut -d ' ' -f 1`
RELVERSION=$(shell date +%Y%m%d)-$(GIT_VER)
RELNAME=deb-$(RELVERSION)
INSTALLDIR :=$(PWD)/$(RELNAME)

all: release

release: install
	@tar czmf $(RELNAME).tar.gz $(RELNAME)
	@rm -fr $(INSTALLDIR)

install:
	@echo "clean old release...."
	@rm -fr $(INSTALLDIR) deb-*.tar.gz
	@mkdir $(INSTALLDIR)
	@cp -rf DEBIAN $(INSTALLDIR)

clean:
	@rm -rf deb-*
