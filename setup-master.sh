#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx keepalived

# Cài đặt Nginx (có thể cấu hình trang web tại đây)

# Cấu hình Keepalived cho Master
cat <<EOF | sudo tee /etc/keepalived/keepalived.conf
vrrp_instance VI_1 {
    state MASTER
    interface eth1
    virtual_router_id 50
    priority 100
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

