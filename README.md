# stormfury
/usr/local/sbin/update-cloudflare-firewalld.sh
/etc/systemd/system/update-cloudflare-firewalld.service
/etc/systemd/system/update-cloudflare-firewalld.timer

chmod 750 /usr/local/sbin/update-cloudflare-firewalld.sh
chown root:root /usr/local/sbin/update-cloudflare-firewalld.sh

systemctl daemon-reload
systemctl enable --now update-cloudflare-firewalld.timer

systemctl status update-cloudflare-firewalld.service
journalctl -u update-cloudflare-firewalld.service
