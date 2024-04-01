# snap-docker-ros2
Docker container &lt;> Snap communication in ROS 2

## Cheatsheet

### Connections

```bash
$ snap connections husarion-chatter 
Interface                     Plug                                  Slot                                     Notes
content[ros-humble-ros-base]  husarion-chatter:ros-humble-ros-base  ros-humble-ros-base:ros-humble-ros-base  manual
network                       husarion-chatter:network              :network                                 -
network-bind                  husarion-chatter:network-bind         :network-bind
```

### ROS 2 disconnect / connect

```bash
sudo snap disconnect husarion-chatter:ros-humble-ros-base
sudo snap connect husarion-chatter:ros-humble-ros-base ros-humble-ros-base:ros-humble-ros-base
```

```bash
sudo snap connect husarion-chatter-shm:shared-memory
```

### logs from snap

```bash
journalctl -t husarion-chatter
```

### list available configurations

```bash
$ sudo snap get husarion-chatter 
error: snap "husarion-chatter" has no configuration
```

### list available snaps (and apps)

```bash
$ ls /snap/bin/
apple-music-for-linux      rosbot
firefox                    rosbot-xl-teleop.joy
firefox.geckodriver        rosbot-xl-teleop.key
foxglove-studio            rosbot-xl-teleop.mux-select
geckodriver                rosbot-xl-teleop.reset-config
husarion-chatter           snapcraft
husarion-chatter.listener  snappy-debug
husarion-chatter.talker    snappy-debug.audit-arch
lxc                        snappy-debug.id-range
lxd                        snappy-debug.scanlog
lxd.benchmark              snappy-debug.scmp-sys-resolver
lxd.buginfo                snappy-debug.security
lxd.check-kernel           snap-store
lxd.lxc                    snap-store.ubuntu-software
lxd.lxc-to-lxd             snap-store.ubuntu-software-local-file
lxd.migrate
```

### snap info

```bash
snap info husarion-chatter 
```

### unalias (if you eg. don't want to use snap version)

```bash
$ sudo snap unalias my-vlc    
Removed:
  - vlc as my-vlc
```

### debugging

```bash
unsquashfs ./husarion-chatter_0.1_amd64.snap
```

```bash
$ snap try squashfs-root
husarion-chatter 0.1 mounted from /home/dominik/tech/temp/snap-docker-ros2/snap-udp/squashfs-root
```

and now you can modify `husarion-chatter` snap scripts inside `/snap-udp/squashfs-root` folder without rebuilding the snap and run it after changes, eg. `husarion-chatter.talker`.

