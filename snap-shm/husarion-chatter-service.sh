#!/bin/bash

# husarion-chatter-service.sh

USERNAME="$(whoami)"
SNAP_APP="husarion-chatter-shm"
SERVICE_NAME="${SNAP_APP}.service"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}"

install_service() {
    # Create the systemd service file
    cat <<EOF | sudo tee "${SERVICE_FILE}" > /dev/null
[Unit]
Description=Husarion Chatter SHM Talker Service
After=network.target

[Service]
Type=simple
User=${USERNAME}
ExecStart=/usr/bin/snap run '${SNAP_APP}.talker'
ExecStop=/bin/sh -c '/usr/bin/pkill -f "${SNAP_APP}" || true'
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

    # Reload systemd, enable and start the service
    sudo systemctl daemon-reload
    sudo systemctl enable "${SERVICE_NAME}"
    sudo systemctl start "${SERVICE_NAME}"
    
    echo "Service ${SERVICE_NAME} has been installed and started."
    echo "Use 'sudo systemctl status ${SERVICE_NAME}' to check its status."
}

remove_service() {
    sudo systemctl stop "${SERVICE_NAME}"
    sudo systemctl disable "${SERVICE_NAME}"
    sudo rm -f "${SERVICE_FILE}"
    sudo systemctl daemon-reload
    
    echo "Service ${SERVICE_NAME} has been removed."
}

case "$1" in
    remove)
        remove_service
        ;;
    *)
        install_service
        ;;
esac
