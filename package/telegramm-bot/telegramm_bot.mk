################################################################################
#
# teleramm bot
#
################################################################################

TELEGRAMM_BOT_VERSION = master
TELEGRAMM_BOT_SITE = git://github.com/StefanoBelli/telegram-bot-api.git
#TELEGRAMM_BOT_DEPENDENCIES = curl jsoncpp

TELEGRAMM_BOT_INSTALL_STAGING = YES
TELEGRAMM_BOT_INSTALL_TARGET  = YES

#define TELEGRAMM_BOT_CONFIGURE_CMDS
#	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/cmake .)
#endef

#define TELEGRAMM_BOT_BUILD_CMDS
#	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) 
#endef

#define TELEGRAMM_BOT_INSTALL_STAGING_CMDS
#	cp -dpf $(@D)/lib/lib* $(STAGING_DIR)/usr/lib
#	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/mqtt $(QMQTT_LIB_INSTALL_TARGETS) DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
#endef

#define TELEGRAMM_BOT_INSTALL_TARGET_CMDS
#endef


$(eval $(cmake-package))
