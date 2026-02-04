# stormfury  
## Paths  
/usr/local/sbin/update-cloudflare-firewalld.sh  
/etc/systemd/system/update-cloudflare-firewalld.service  
/etc/systemd/system/update-cloudflare-firewalld.timer  

## Permissions 
chmod 750 /usr/local/sbin/update-cloudflare-firewalld.sh  
chown root:root /usr/local/sbin/update-cloudflare-firewalld.sh  

systemctl daemon-reload  
systemctl enable --now update-cloudflare-firewalld.timer  

## Modify zones and services
sudo firewall-cmd --permanent --zone=public --remove-service=http  
sudo firewall-cmd --permanent --zone=public --remove-service=https  
sudo firewall-cmd --permanent --zone=cloudflare --add-service=https  
sudo firewall-cmd --reload  

## Reverse Proxy  
/etc/nginx/conf.d/stormfury.conf  

## Logs  
systemctl status update-cloudflare-firewalld.service  
journalctl -u update-cloudflare-firewalld.service  
