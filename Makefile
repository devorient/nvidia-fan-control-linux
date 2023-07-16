FAN_CONTROL_SH = fan-control.sh
FAN_CONTROL_SERVICE = fan-control.service
FAN_CONTROL = fan-control

INSTALL = install
PREFIX = /usr/local/bin

.NOTPARALLEL:

.PHONY: all
all:

.PHONY: install
install:
	$(INSTALL) -Dm 0755 $(FAN_CONTROL_SH) $(DESTDIR)$(PREFIX)/$(FAN_CONTROL)

service:
	$(INSTALL) -Dm 0755 $(FAN_CONTROL_SERVICE) /etc/systemd/system/$(FAN_CONTROL_SERVICE)
	systemctl enable $(FAN_CONTROL_SERVICE)
	systemctl start $(FAN_CONTROL_SERVICE)

.PHONY: uninstall
uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/$(FAN_CONTROL)

.PHONY: clean
clean:

