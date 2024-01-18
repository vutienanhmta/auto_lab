#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx keepalived

# Config  trang web
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Nginx!</title>
</head>
<body>
    <h1>Success! The Nginx server is working!</h1>
</body>
</html>
EOF

# Config Keepalived cho Backup
cat <<EOF | sudo tee /etc/keepalived/keepalived.conf
vrrp_instance VI_1 {
    state BACKUP
    interface enp0s8
    virtual_router_id 50
    priority 50
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 12345
    }
    virtual_ipaddress {
        192.168.56.40
    }
}
EOF

sudo systemctl restart nginx
sudo systemctl enable keepalived
sudo systemctl start keepalived

