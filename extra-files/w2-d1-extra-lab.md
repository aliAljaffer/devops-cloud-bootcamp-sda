# Extra Lab added by Mr. Dhingra

## 1) Navigation and Shell Essentials

```bash
ali@ironhack:~$ # Navigation & Shell Essentials
ali@ironhack:~$ pwd; whoami;hostname
/home/ali
ali
ironhack
ali@ironhack:~$ mkdir -p ~/lab/findme
ali@ironhack:~$ touch ~/lab/findme/{a.log,b.log,c.txt,notes.md}
ali@ironhack:~$ find ~/lab/findme/ -name "*.log"
/home/ali/lab/findme/b.log
/home/ali/lab/findme/a.log
ali@ironhack:~$
```

![Navigation and Shell Essentials](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-extra-lab/navigation-shell-essentials.png)

## 2) Users, Groups & Permissions

```bash
ali@ironhack:~$ # Users, Groups, Permissions
ali@ironhack:~$ id
uid=1000(ali) gid=1000(ali) groups=1000(ali),27(sudo),985(vboxsf)
ali@ironhack:~$ groups
ali sudo vboxsf
ali@ironhack:~$ mkdir -p ~/lab/perms && echo "secret" > ~/lab/perms/report.txt
ali@ironhack:~$ ls -l ~/lab/perms/report.txt
-rw-rw-r-- 1 ali ali 7 Sep  7 08:46 /home/ali/lab/perms/report.txt
ali@ironhack:~$ chmod 640 ~/lab/perms/report.txt
ali@ironhack:~$ ls -l ~/lab/perms/report.txt
-rw-r----- 1 ali ali 7 Sep  7 08:46 /home/ali/lab/perms/report.txt
ali@ironhack:~$ sudo chown root:root ~/lab/perms/report.txt
ali@ironhack:~$ ls -l ~/lab/perms/report.txt
-rw-r----- 1 root root 7 Sep  7 08:46 /home/ali/lab/perms/report.txt
ali@ironhack:~$ mkdir -p ~/labs/shared
ali@ironhack:~$ chmod 1777 ~/labs/shared
ali@ironhack:~$ ls -ld ~/labs/shared/
drwxrwxrwt 2 ali ali 4096 Sep  7 08:47 /home/ali/labs/shared/
ali@ironhack:~$
```

![Users, Groups & Permissions](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-extra-lab/users-groups-permissions.png)

## 3) Packages with APT

تذكروا ان `/dev/null` يعتبر ملف او ديفايس فاضي فأي شي ارسله عليه ما يظهر في اوتبوت الكوماند

```bash
ali@ironhack:~$ # Packages with APT
ali@ironhack:~$ sudo apt update > /dev/null
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
ali@ironhack:~$ sudo apt upgrade -y > /dev/null
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
ali@ironhack:~$ sudo apt install -y htop curl wget tree > /dev/null
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
ali@ironhack:~$ which htop
/usr/bin/htop
ali@ironhack:~$ htop --version
htop 3.4.0
ali@ironhack:~$ curl --version | head -1
curl 8.12.1 (aarch64-unknown-linux-gnu) libcurl/8.12.1 OpenSSL/3.4.1 zlib/1.3.1 brotli/1.1.0 zstd/1.5.6 libidn2/2.3.8 libpsl/0.21.2 libssh2/1.11.1 nghttp2/1.64.0 librtmp/2.3 OpenLDAP/2.6.9
ali@ironhack:~$ apt search jq | head -10

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Sorting...
Full Text Search...
dasel/plucky 2.8.1-1 arm64
  Query, update and convert data structures from the command line (program)

fq/plucky 0.9.0-2 arm64
  jq for binary formats (program)

gojq/plucky 0.12.13-1 arm64
  pure Go implementation of jq (program)
ali@ironhack:~$ sudo apt remove -y tree > /dev/null && sudo apt install -y > /dev/null

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.


WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

ali@ironhack:~$
```

![Packages with APT](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-extra-lab/packages-with-apt.png)

## 4) Processes & Job Control

```bash
ali@ironhack:~$ # Processes & Job Control
ali@ironhack:~$ ps aux | head -3
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.1  0.4  25080 14268 ?        Ss   07:35   0:03 /sbin/init splash noprompt noshell automatic-ubiquity crashkernel=2G-4G:320M,4G-32G:512M,32G-64G:1024M,64G-128G:2048M,128G-:4096M vt.handoff=7
root           2  0.0  0.0      0     0 ?        S    07:35   0:00 [kthreadd]
ali@ironhack:~$ sleep 300 &
[1] 15451
ali@ironhack:~$ jobs
[1]+  Running                 sleep 300 &
ali@ironhack:~$ fg %1
sleep 300
^C
ali@ironhack:~$
```

![Processes & Job Control](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-extra-lab/processes-and-job-control.png)

## 5) Services with systemd

```bash
ali@ironhack:~$ # Services with systemd
ali@ironhack:~$ sudo systemctl list-units --type=service | head -2
  UNIT                                                  LOAD   ACTIVE SUB     DESCRIPTION
  accounts-daemon.service                               loaded active running Accounts Service
ali@ironhack:~$ sudo systemctl list-units --type=service | head -3
  UNIT                                                  LOAD   ACTIVE SUB     DESCRIPTION
  accounts-daemon.service                               loaded active running Accounts Service
  alsa-restore.service                                  loaded active exited  Save/Restore Sound Card State
ali@ironhack:~$ sudo systemctl status ssh || sudo systemctl status sshd
○ ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/usr/lib/systemd/system/ssh.service; disabled; preset: enabled)
     Active: inactive (dead)
TriggeredBy: ● ssh.socket
       Docs: man:sshd(8)
             man:sshd_config(5)
○ ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/usr/lib/systemd/system/ssh.service; disabled; preset: enabled)
     Active: inactive (dead)
TriggeredBy: ● ssh.socket
       Docs: man:sshd(8)
             man:sshd_config(5)
ali@ironhack:~$ sudo systemctl start cron && sudo systemctl enable cron && sudo systemctl status cron
Synchronizing state of cron.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
Executing: /usr/lib/systemd/systemd-sysv-install enable cron
● cron.service - Regular background program processing daemon
     Loaded: loaded (/usr/lib/systemd/system/cron.service; enabled; preset: enabled)
     Active: active (running) since Sun 2025-09-07 07:34:02 UTC; 55min ago
 Invocation: 031f5698fab0495a90a4f4fe43abe12c
       Docs: man:cron(8)
   Main PID: 1143 (cron)
      Tasks: 1 (limit: 3920)
     Memory: 536K (peak: 2.1M)
        CPU: 183ms
     CGroup: /system.slice/cron.service
             └─1143 /usr/sbin/cron -f -P

Sep 07 08:05:01 ironhack CRON[6780]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
Sep 07 08:05:01 ironhack CRON[6780]: pam_unix(cron:session): session closed for user root
Sep 07 08:15:01 ironhack CRON[9315]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
Sep 07 08:15:01 ironhack CRON[9315]: pam_unix(cron:session): session closed for user root
Sep 07 08:17:01 ironhack CRON[15319]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
Sep 07 08:17:01 ironhack CRON[15320]: (root) CMD (cd / && run-parts --report /etc/cron.hourly)
Sep 07 08:17:01 ironhack CRON[15319]: pam_unix(cron:session): session closed for user root
Sep 07 08:25:01 ironhack CRON[15424]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
Sep 07 08:25:01 ironhack CRON[15425]: (root) CMD (command -v debian-sa1 > /dev/null && debian-sa1 1 1)
Sep 07 08:25:01 ironhack CRON[15424]: pam_unix(cron:session): session closed for user root
ali@ironhack:~$
```

![Services with systemd](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-extra-lab/services-with-systemd.png)

## 6) Networking Basics

```bash
ali@ironhack:~$ # Networking Basics
ali@ironhack:~$ ip addr show | head -20
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute
       valid_lft forever preferred_lft forever
2: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:2b:64:c2 brd ff:ff:ff:ff:ff:ff
    altname enx0800272b64c2
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic noprefixroute enp0s8
       valid_lft 84574sec preferred_lft 84574sec
    inet6 fe80::a00:27ff:fe2b:64c2/64 scope link proto kernel_ll
       valid_lft forever preferred_lft forever
3: br-1e01d094e097: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default
    link/ether ba:bd:c6:3a:82:77 brd ff:ff:ff:ff:ff:ff
    inet 172.18.0.1/16 brd 172.18.255.255 scope global br-1e01d094e097
       valid_lft forever preferred_lft forever
    inet6 fc00:f853:ccd:e793::1/64 scope global nodad
       valid_lft forever preferred_lft forever
    inet6 fe80::b8bd:c6ff:fe3a:8277/64 scope link proto kernel_ll
ali@ironhack:~$ ip route show
default via 10.0.2.2 dev enp0s8 proto dhcp src 10.0.2.15 metric 100
10.0.2.0/24 dev enp0s8 proto kernel scope link src 10.0.2.15 metric 100
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown
172.18.0.0/16 dev br-1e01d094e097 proto kernel scope link src 172.18.0.1
ali@ironhack:~$ ping -c 3 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=255 time=78.1 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=255 time=77.0 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=255 time=77.0 ms

--- 8.8.8.8 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 76.954/77.367/78.145/0.550 ms
ali@ironhack:~$ host google.com || nslookup google.com || dig google.com
google.com has address 172.217.19.142
google.com has IPv6 address 2a00:1450:4006:80e::200e
google.com mail is handled by 10 smtp.google.com.
ali@ironhack:~$ ss -tlnp | grep :22 || echo "SSH service disabled/not available"
LISTEN 0      4096         0.0.0.0:22         0.0.0.0:*
LISTEN 0      4096            [::]:22            [::]:*
ali@ironhack:~$
```

![Networking Basics](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-extra-lab/networking-basics.png)

## 7) Disk & Filesystems

```bash
ali@ironhack:~$ # Disk & Filesystems
ali@ironhack:~$ lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0    7:0    0  68.9M  1 loop /snap/core22/2115
loop1    7:1    0     4K  1 loop /snap/bare/5
loop2    7:2    0  68.9M  1 loop /snap/core22/1912
loop3    7:3    0 119.8M  1 loop /snap/docker/3267
loop4    7:4    0 228.4M  1 loop /snap/firefox/6039
loop5    7:5    0  11.4M  1 loop /snap/desktop-security-center/60
loop6    7:6    0 493.5M  1 loop /snap/gnome-42-2204/201
loop7    7:7    0  91.7M  1 loop /snap/gtk-common-themes/1535
loop8    7:8    0 231.7M  1 loop /snap/firefox/6736
loop9    7:9    0  13.1M  1 loop /snap/prompting-client/105
loop10   7:10   0    10M  1 loop /snap/snap-store/1271
loop11   7:11   0  38.7M  1 loop /snap/snapd/23772
loop12   7:12   0  44.2M  1 loop /snap/snapd/25205
loop13   7:13   0   544K  1 loop /snap/snapd-desktop-integration/255
loop14   7:14   0   552K  1 loop /snap/snapd-desktop-integration/316
sda      8:0    0  20.4G  0 disk
├─sda1   8:1    0   973M  0 part /boot/efi
└─sda2   8:2    0  19.5G  0 part /
sr0     11:0    1   3.6G  0 rom  /media/ali/Ubuntu 25.04 arm64
ali@ironhack:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           339M  1.8M  337M   1% /run
/dev/sda2        19G   11G  7.7G  58% /
tmpfs           1.7G     0  1.7G   0% /dev/shm
efivarfs        256K  7.5K  249K   3% /sys/firmware/efi/efivars
tmpfs           5.0M  8.0K  5.0M   1% /run/lock
tmpfs           1.7G   24K  1.7G   1% /tmp
tmpfs           1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
tmpfs           1.0M     0  1.0M   0% /run/credentials/systemd-resolved.service
/dev/sda1       972M  6.4M  965M   1% /boot/efi
tmpfs           339M  132K  339M   1% /run/user/1000
/dev/sr0        3.7G  3.7G     0 100% /media/ali/Ubuntu 25.04 arm64
ali@ironhack:~$ du -sh ~
495M	/home/ali
ali@ironhack:~$ mkdir -p ~/lab/storage
ali@ironhack:~$ dd if=/dev/zero of=~/lab/storage/bigfile bs=1M count=50
50+0 records in
50+0 records out
52428800 bytes (52 MB, 50 MiB) copied, 0.124671 s, 421 MB/s
ali@ironhack:~$ du -sh ~/lab/storage/
51M	/home/ali/lab/storage/
ali@ironhack:~$ rm -rf ~/lab/storage/
ali@ironhack:~$
```

![Disk & Filesystems](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-extra-lab/disk-and-fs.png)

## 8) Logs & Quick Troubleshooting

```bash
ali@ironhack:~$ # Logs & Quick troubleshooting
ali@ironhack:~$ journalctl -n 10
Hint: You are currently not seeing messages from other users and the system.
      Users in groups 'adm', 'systemd-journal' can see all messages.
      Pass -q to turn off this notice.
Sep 07 08:33:39 ironhack pipewire[4493]: spa.alsa: front:0p: (46 suppressed) snd_pcm_avail after recover: Broken pipe
Sep 07 08:33:41 ironhack pipewire[4493]: spa.alsa: front:0p: (46 suppressed) snd_pcm_avail after recover: Broken pipe
Sep 07 08:33:43 ironhack pipewire[4493]: spa.alsa: front:0p: (46 suppressed) snd_pcm_avail after recover: Broken pipe
Sep 07 08:33:45 ironhack pipewire[4493]: spa.alsa: front:0p: (46 suppressed) snd_pcm_avail after recover: Broken pipe
Sep 07 08:33:47 ironhack pipewire[4493]: spa.alsa: front:0p: (46 suppressed) snd_pcm_avail after recover: Broken pipe
Sep 07 08:33:49 ironhack pipewire[4493]: spa.alsa: front:0p: (46 suppressed) snd_pcm_avail after recover: Broken pipe
Sep 07 08:33:51 ironhack pipewire[4493]: spa.alsa: front:0p: (46 suppressed) snd_pcm_avail after recover: Broken pipe
Sep 07 08:33:53 ironhack pipewire[4493]: spa.alsa: front:0p: (46 suppressed) snd_pcm_avail after recover: Broken pipe
Sep 07 08:33:55 ironhack pipewire[4493]: spa.alsa: front:0p: (46 suppressed) snd_pcm_avail after recover: Broken pipe
Sep 07 08:33:57 ironhack pipewire[4493]: spa.alsa: front:0p: (46 suppressed) snd_pcm_avail after recover: Broken pipe
ali@ironhack:~$ journalctl -u ssh -n 10
Hint: You are currently not seeing messages from other users and the system.
      Users in groups 'adm', 'systemd-journal' can see all messages.
      Pass -q to turn off this notice.
-- No entries --
ali@ironhack:~$ journalctl -u sshd
Hint: You are currently not seeing messages from other users and the system.
      Users in groups 'adm', 'systemd-journal' can see all messages.
      Pass -q to turn off this notice.
-- No entries --
ali@ironhack:~$
```

![Logs & Quick Troubleshooting](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-extra-lab/logs-and-troubleshooting.png)

## 9) Archiving & Transfer

```bash
ali@ironhack:~$ # Archiving & Transfer
ali@ironhack:~$ mkdir -p ~/lab/project && echo "index" > ~/lab/project/index.txt
ali@ironhack:~$ tar -czf ~/lab/project.tar.gz -C ~/lab project
ali@ironhack:~$ ls -lh ~/lab/project.tar.gz
-rw-rw-r-- 1 ali ali 161 Sep  7 08:36 /home/ali/lab/project.tar.gz
ali@ironhack:~$ mkdir -p ~/lab/unpack && tar -xzf ~/lab/project.tar.gz -C ~/lab/unpack
ali@ironhack:~$ tree ~/lab/unpack/
Command 'tree' not found, but can be installed with:
sudo snap install tree  # version 2.1.3+pkg-5852, or
sudo apt  install tree  # version 2.1.1-2ubuntu3
See 'snap info tree' for additional versions.
ali@ironhack:~$ sudo apt install tree -y > /dev/null

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

ali@ironhack:~$ tree ~/lab/unpack/
/home/ali/lab/unpack/
└── project
    └── index.txt

2 directories, 1 file
ali@ironhack:~$
```

![Archiving & Transfer](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-extra-lab/archiving-and-transfer.png)

## 10) Schedueling with cron

```bash
ali@ironhack:~$ # Schedueling with cron
ali@ironhack:~$ crontab -e
no crontab for ali - using an empty one
Select an editor.  To change later, run select-editor again.
  1. /bin/nano        <---- easiest
  2. /usr/bin/vim.basic
  3. /usr/bin/vim.tiny
  4. /usr/bin/code
  5. /bin/ed

Choose 1-5 [1]: 2
crontab: installing new crontab
ali@ironhack:~$ tail -f -1 ~/lab/cron.log
tail: option used in invalid context -- 1
ali@ironhack:~$ tail -n 1 -f ~/lab/cron.log
Sun Sep  7 08:39:01 AM UTC 2025
^C
ali@ironhack:~$ tail -f ~/lab/cron.log
Sun Sep  7 08:39:01 AM UTC 2025
^C
ali@ironhack:~$ crontab -e
crontab: installing new crontab
ali@ironhack:~$
```

![Schedueling with cron](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-extra-lab/schedueling-with-cron.png)

## 11) One-Command Health Report

```bash
ali@ironhack:~$ # One-Command Health Report
ali@ironhack:~$ mkdir -p ~/lab/scripts
ali@ironhack:~$ vim hs.sh
ali@ironhack:~$ chmod +x hs.sh && ./hs.sh
=== QUICK HEALTH REPORT ===
Date: Sun Sep  7 08:41:23 AM UTC 2025

[System]
OS: Ubuntu 25.04
Kernel: 6.14.0-29-generic  Arch: aarch64  User: ali

[Resources]
               total        used        free      shared  buff/cache   available
Mem:           3.3Gi       1.8Gi       215Mi        52Mi       1.5Gi       1.5Gi
Swap:             0B          0B          0B

[Disks]
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           339M  1.8M  337M   1% /run
/dev/sda2        19G   11G  7.7G  58% /
tmpfs           1.7G     0  1.7G   0% /dev/shm
efivarfs        256K  7.5K  249K   3% /sys/firmware/efi/efivars
tmpfs           5.0M  8.0K  5.0M   1% /run/lock
tmpfs           1.7G   24K  1.7G   1% /tmp
tmpfs           1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
tmpfs           1.0M     0  1.0M   0% /run/credentials/systemd-resolved.service
/dev/sda1       972M  6.4M  965M   1% /boot/efi

[Network]
lo               UNKNOWN        127.0.0.1/8 ::1/128
enp0s8           UP             10.0.2.15/24 fe80::a00:27ff:fe2b:64c2/64
br-1e01d094e097  UP             172.18.0.1/16 fc00:f853:ccd:e793::1/64 fe80::b8bd:c6ff:fe3a:8277/64
docker0          DOWN           172.17.0.1/16
veth248461d@if2  UP             fe80::8a9:66ff:fe8a:452d/64
Default route: default via 10.0.2.2 dev enp0s8 proto dhcp src 10.0.2.15 metric 100
DNS servers:
127.0.0.53
Internet: OK

[Services]
inactive
ssh: inactive/not-found
inactive
sshd: inactive/not-found
active
cron: active
ali@ironhack:~$
```

![One-Command Health Report](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-extra-lab/one-command-health-report.png)
