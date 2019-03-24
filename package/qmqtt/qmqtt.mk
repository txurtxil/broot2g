################################################################################
#
# qmqtt
#
################################################################################

QMQTT_VERSION = master
QMQTT_SITE = git://github.com/emqtt/qmqtt.git
#QMQTT_SOURCE = qmqtt-src-$(QMQTT_VERSION).tar.gz
QMQTT_DEPENDENCIES = qt5base

QMQTT_INSTALL_STAGING = YES

ifeq ($(BR2_STATIC_LIBS),y)
QMQTT_LIB_BUILD_TARGETS = staticlib
QMQTT_LIB_INSTALL_TARGETS = install-static
else ifeq ($(BR2_SHARED_LIBS),y)
QMQTT_LIB_BUILD_TARGETS = all
QMQTT_LIB_INSTALL_TARGETS = install
else
QMQTT_LIB_BUILD_TARGETS = all staticlib
QMQTT_LIB_INSTALL_TARGETS = install install-static
endif

define QMQTT_CONFIGURE_CMDS
	(cd $(@D)/src/mqtt; $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
endef

define QMQTT_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/src/mqtt $(QMQTT_LIB_BUILD_TARGETS)
endef

define QMQTT_INSTALL_STAGING_CMDS
#	cp -dpf $(@D)/lib/libqmqtt.so.* $(STAGING_DIR)/usr/lib
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/mqtt $(QMQTT_LIB_INSTALL_TARGETS) DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
endef

define QMQTT_INSTALL_TARGET_CMDS
#	cp -dpf $(@D)/lib/libqmqtt.so.* $(TARGET_DIR)/usr/lib
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/mqtt $(QMQTT_LIB_INSTALL_TARGETS) DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
endef


#define WIRINGPI_BUILD_CMDS
#	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_BUILD_TARGETS)
#endef

#define WIRINGPI_INSTALL_STAGING_CMDS
#	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
#endef

#define WIRINGPI_INSTALL_TARGET_CMDS
#	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
#endef


$(eval $(generic-package))
