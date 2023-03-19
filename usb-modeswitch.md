###  Установка usb_modeswitch на камеру с прошивкой fpv, lite
```
curl -o /usr/sbin/usb_modeswitch https://github.com/OpenIPC/sandbox-fpv/raw/master/usb-modeswitch/musl/usb_modeswitch && chmod +x /usr/sbin/usb_modeswitch
curl -o /usr/sbin/usb_modeswitch_dispatcher https://github.com/OpenIPC/sandbox-fpv/raw/master/usb-modeswitch/musl/usb_modeswitch_dispatcher && chmod +x /usr/sbin/usb_modeswitch_dispatcher
curl -o /etc/usb_modeswitch.conf https://github.com/OpenIPC/sandbox-fpv/raw/master/usb-modeswitch/musl/usb_modeswitch.conf
curl -o /lib/udev/usb_modeswitch https://github.com/OpenIPC/sandbox-fpv/raw/master/usb-modeswitch/musl/usb_modeswitch.sh && chmod +x /lib/udev/usb_modeswitch
curl -o /usr/lib/libusb-1.0.so.0.3.0 https://github.com/OpenIPC/sandbox-fpv/raw/master/usb-modeswitch/musl/libusb-1.0.so.0.3.0 && chmod +x /usr/lib/libusb-1.0.so.0.3.0
ln -s /usr/lib/libusb-1.0.so.0.3.0 /usr/lib/libusb-1.0.so
mkdir -p /usr/include/libusb-1.0 && curl -o /usr/include/libusb-1.0/libusb.h https://github.com/OpenIPC/sandbox-fpv/raw/master/usb-modeswitch/musl/libusb.h
```

Пример настройки в /etc/network/interfaces для e3372h:
```
auto eth1
iface eth1 inet dhcp
    pre-up sleep 4
    pre-up usb_modeswitch -v 0x12d1 -p 0x1f01 -J
    pre-up modprobe usbserial vendor=0x12d1 product=0x14dc
    pre-up modprobe rndis_host
    pre-up sleep 4
```