WEBINJECT := Webinject
WEBINJECT_VERS := 1.88
WEBINJECT_DIR := Webinject-$(WEBINJECT_VERS)

WEBINJECT_PATCHING := $(BUILD_HELPER_DIR)/$(WEBINJECT_DIR)-patching
WEBINJECT_BUILD := $(BUILD_HELPER_DIR)/$(WEBINJECT_DIR)-build
WEBINJECT_INSTALL := $(BUILD_HELPER_DIR)/$(WEBINJECT_DIR)-install

#WEBINJECT_INSTALL_DIR := $(INTERMEDIATE_INSTALL_BASE)/$(WEBINJECT_DIR)
WEBINJECT_BUILD_DIR := $(PACKAGE_BUILD_DIR)/$(WEBINJECT_DIR)
#WEBINJECT_WORK_DIR := $(PACKAGE_WORK_DIR)/$(WEBINJECT_DIR)

$(WEBINJECT_BUILD): $(WEBINJECT_PATCHING) $(PERL_MODULES_INTERMEDIATE_INSTALL)
	export PERL5LIB=$(PACKAGE_PERL_MODULES_PERL5LIB)/lib/perl5; \
	    cd $(WEBINJECT_BUILD_DIR) && echo "" | $(PERL) Makefile.PL
	cd $(WEBINJECT_BUILD_DIR) && $(MAKE) check_webinject
	$(TOUCH) $@

$(WEBINJECT_INSTALL): $(WEBINJECT_BUILD)
	install -m 755 $(WEBINJECT_BUILD_DIR)/check_webinject $(DESTDIR)$(OMD_ROOT)/lib/nagios/plugins/
	$(TOUCH) $@
