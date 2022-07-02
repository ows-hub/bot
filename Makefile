include $(TOPDIR)/rules.mk

PKG_NAME:=ows-bot

PKG_VERSION:=1.0.4
PKG_RELEASE:=1

PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define Package/ows-bot
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Telegram BOT for openwrt
  URL:=https://github.com/ows-hub/bot
  PKGARCH:=all
  TITLE:=Telegram for openwrt BOT
endef

define Package/ows-bot/description
  Telegram for use in openwrt. Its a BOT
  that executes selected commands in your router.
  Version: $(PKG_VERSION)-$(PKG_RELEASE)
  Info   : https://github.com/ows-hub/bot
endef

define Package/ows-bot/conffiles
/etc/config/bot
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ows-bot/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./etc/init.d/telegram_bot \
			./etc/init.d/lanports \
			./etc/init.d/hosts_scan \
		$(1)/etc/init.d

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./etc/config/bot \
		$(1)/etc/config/bot
	
	$(INSTALL_DIR) $(1)/etc/bot
	$(INSTALL_CONF) ./etc/bot/macaddr.ignore \
		$(1)/etc/bot/macaddr.ignore

	$(INSTALL_DIR) $(1)/usr/share/bot
	echo "$(PKG_VERSION)-$(PKG_RELEASE)" > $(1)/usr/share/bot/version
	
	$(INSTALL_DIR) $(1)/usr/lib/bot/plugins/actions
	$(INSTALL_BIN) ./usr/lib/bot/plugins/actions/cam_mv \
				./usr/lib/bot/plugins/actions/fwr_disable \
				./usr/lib/bot/plugins/actions/fw_delete \
				./usr/lib/bot/plugins/actions/proc_stop \
				./usr/lib/bot/plugins/actions/fwr_enable \
				./usr/lib/bot/plugins/actions/chromego \
				./usr/lib/bot/plugins/actions/fw_disable \
				./usr/lib/bot/plugins/actions/wifi_disable \
				./usr/lib/bot/plugins/actions/proxy_enable \
				./usr/lib/bot/plugins/actions/wifi_restart \
				./usr/lib/bot/plugins/actions/proc_restart \
				./usr/lib/bot/plugins/actions/proxy_disable \
				./usr/lib/bot/plugins/actions/wifi_enable \
				./usr/lib/bot/plugins/actions/light_control \
				./usr/lib/bot/plugins/actions/proc_start \
				./usr/lib/bot/plugins/actions/fw_enable \
		$(1)/usr/lib/bot/plugins/actions
	
	$(INSTALL_DIR) $(1)/usr/lib/bot/plugins/ctx
	$(INSTALL_BIN) ./usr/lib/bot/plugins/ctx/wifi_list \
				./usr/lib/bot/plugins/ctx/fwr_list \
				./usr/lib/bot/plugins/ctx/service_list \
				./usr/lib/bot/plugins/ctx/chromego \
				./usr/lib/bot/plugins/ctx/reboot \
				./usr/lib/bot/plugins/ctx/cam_kbd \
				./usr/lib/bot/plugins/ctx/proxy \
				./usr/lib/bot/plugins/ctx/fw_list \
				./usr/lib/bot/plugins/ctx/light_list \
		$(1)/usr/lib/bot/plugins/ctx
	
	$(INSTALL_DIR) $(1)/usr/lib/bot/plugins/help
	$(INSTALL_DATA) ./usr/lib/bot/plugins/help/cam_mv \
				./usr/lib/bot/plugins/help/fw_unblock \
				./usr/lib/bot/plugins/help/fw_add \
				./usr/lib/bot/plugins/help/cam_vdo \
				./usr/lib/bot/plugins/help/fwr_disable \
				./usr/lib/bot/plugins/help/msg_tv \
				./usr/lib/bot/plugins/help/wifi_list \
				./usr/lib/bot/plugins/help/swports_list \
				./usr/lib/bot/plugins/help/fwr_list \
				./usr/lib/bot/plugins/help/fw_delete \
				./usr/lib/bot/plugins/help/chromego_list \
				./usr/lib/bot/plugins/help/get_mac \
				./usr/lib/bot/plugins/help/proc_stop \
				./usr/lib/bot/plugins/help/proc_list \
				./usr/lib/bot/plugins/help/proxy_list \
				./usr/lib/bot/plugins/help/get_uptime \
				./usr/lib/bot/plugins/help/fwr_enable \
				./usr/lib/bot/plugins/help/wll_list \
				./usr/lib/bot/plugins/help/start \
				./usr/lib/bot/plugins/help/ignoredmac_list \
				./usr/lib/bot/plugins/help/fw_disable \
				./usr/lib/bot/plugins/help/lights \
				./usr/lib/bot/plugins/help/wifi_disable \
				./usr/lib/bot/plugins/help/proxy_enable \
				./usr/lib/bot/plugins/help/wifi_restart \
				./usr/lib/bot/plugins/help/proc_restart \
				./usr/lib/bot/plugins/help/reboot \
				./usr/lib/bot/plugins/help/proxy_disable \
				./usr/lib/bot/plugins/help/wifi_enable \
				./usr/lib/bot/plugins/help/get_ip \
				./usr/lib/bot/plugins/help/cam_shot \
				./usr/lib/bot/plugins/help/cam_movie \
				./usr/lib/bot/plugins/help/get_ping \
				./usr/lib/bot/plugins/help/fw_list \
				./usr/lib/bot/plugins/help/chromego_add \
				./usr/lib/bot/plugins/help/proc_start \
				./usr/lib/bot/plugins/help/ignoredmac_add \
				./usr/lib/bot/plugins/help/chromego_del \
				./usr/lib/bot/plugins/help/fw_enable \
				./usr/lib/bot/plugins/help/hst_list \
				./usr/lib/bot/plugins/help/netstat \
		$(1)/usr/lib/bot/plugins/help

	$(INSTALL_DIR) $(1)/usr/lib/bot/plugins
	$(INSTALL_BIN) ./usr/lib/bot/plugins/cam_mv \
				./usr/lib/bot/plugins/fw_unblock \
				./usr/lib/bot/plugins/fw_add \
				./usr/lib/bot/plugins/cam_vdo \
				./usr/lib/bot/plugins/fwr_disable \
				./usr/lib/bot/plugins/msg_tv \
				./usr/lib/bot/plugins/wifi_list \
				./usr/lib/bot/plugins/swports_list \
				./usr/lib/bot/plugins/fwr_list \
				./usr/lib/bot/plugins/fw_delete \
				./usr/lib/bot/plugins/chromego_list \
				./usr/lib/bot/plugins/get_mac \
				./usr/lib/bot/plugins/proc_stop \
				./usr/lib/bot/plugins/proc_list \
				./usr/lib/bot/plugins/proxy_list \
				./usr/lib/bot/plugins/get_uptime \
				./usr/lib/bot/plugins/fwr_enable \
				./usr/lib/bot/plugins/wll_list \
				./usr/lib/bot/plugins/start \
				./usr/lib/bot/plugins/ignoredmac_list \
				./usr/lib/bot/plugins/fw_disable \
				./usr/lib/bot/plugins/lights \
				./usr/lib/bot/plugins/wifi_disable \
				./usr/lib/bot/plugins/proxy_enable \
				./usr/lib/bot/plugins/wifi_restart \
				./usr/lib/bot/plugins/proc_restart \
				./usr/lib/bot/plugins/reboot \
				./usr/lib/bot/plugins/proxy_disable \
				./usr/lib/bot/plugins/wifi_enable \
				./usr/lib/bot/plugins/get_ip \
				./usr/lib/bot/plugins/cam_shot \
				./usr/lib/bot/plugins/cam_movie \
				./usr/lib/bot/plugins/get_ping \
				./usr/lib/bot/plugins/fw_list \
				./usr/lib/bot/plugins/chromego_add \
				./usr/lib/bot/plugins/proc_start \
				./usr/lib/bot/plugins/ignoredmac_add \
				./usr/lib/bot/plugins/chromego_del \
				./usr/lib/bot/plugins/fw_enable \
				./usr/lib/bot/plugins/hst_list \
				./usr/lib/bot/plugins/netstat \
		$(1)/usr/lib/bot/plugins

	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./sbin/telebot \
				./sbin/camkeyboard \
				./sbin/telegram_bot \
				./sbin/telekeyboard \
				./sbin/hosts_scan \
				./sbin/proxy \
				./sbin/typing \
				./sbin/telegram_sender \
				./sbin/lanports \
		$(1)/sbin/
endef

define Package/telegram-openwrt/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	/etc/init.d/telegram_bot enabled
	/etc/init.d/lanports enabled
	/etc/init.d/hosts_scan enabled
	/etc/init.d/telegram_bot start
	/etc/init.d/lanports start
	/etc/init.d/hosts_scan start
fi
exit 0
endef

define Package/telegram-openwrt/prerm
#!/bin/sh
if [ -n "$${IPKG_INSTROOT}" ]; then
	/etc/init.d/telegram_bot stop
	/etc/init.d/lanports stop
	/etc/init.d/hosts_scan stop
	/etc/init.d/telegram_bot disable
	/etc/init.d/lanports disable
	/etc/init.d/hosts_scan disable
fi
exit 0
endef

$(eval $(call BuildPackage,telegram-openwrt))
