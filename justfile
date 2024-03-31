enable-docker:
    #!/bin/bash
    sudo systemctl start docker.service
    sudo systemctl start docker.socket
    sudo systemctl restart systemd-sysctl

build-snap-udp:
    #!/bin/bash
    export SNAPCRAFT_ENABLE_EXPERIMENTAL_EXTENSIONS=1
    sudo /bin/bash -c "echo "net.ipv4.conf.all.forwarding=1" > /etc/sysctl.d/99-forwarding.conf"
    sudo systemctl stop docker.service
    sudo systemctl stop docker.socket
    sudo systemctl restart systemd-sysctl

    sudo iptables -I DOCKER-USER -i lxdbr0 -j ACCEPT
    sudo iptables -I DOCKER-USER -o lxdbr0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
    bash -c "cd snap-udp && snapcraft"

install-snap-udp:
    #/bin/bash
    sudo snap remove husarion-chatter
    sudo snap install snap-udp/husarion-chatter_0.1_amd64.snap --dangerous

# run-snap-shell:
#     sudo snap run --shell husarion-chatter