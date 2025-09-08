# devops-cloud-bootcamp-sda

## مقدمة

Resources for DevOps &amp; Cloud Bootcamp delivered by IronHack

هنا راح ارفق حلول وشروحات المواضيع المقدمة في معسكر العمليات البرمجية (DevOps) و الحوسبة السحابية (Cloud) للفائدة وكمرجع لي وللطلاب في المستقبل.

الحلول فقط سكرين شوت للمطلوبات من كل لاب اللي سلمتها بنفسي. ممكن بعضها ما كنت اتبع القايد حق اللاب نفسه لكن كلها راح تطابق الـLearning Objectives اللي مكتوبة لكل لاب.

أفضل طريقة عشان تستفيد إنك تحل بنفسك قدر المستطاع, ولما تخلص او تعلق في شي تشوف الحل اللي انا كاتبه. طبعاً كل لاب بالعادة بيكون فيه اكثر من طريقة حل واحدة.

لأي سؤال بكون موجود فالدسكورد: bigshoes

او الايميل: [ahjfr@icloud.com](mailto:ahjfr@icloud.com)

## فهرس

- [شروحات يوتوب](#شروحات-يوتوب)
  - [اسبوع ١ - يوم ٣](#اسبوع-١---يوم-٣)
  - [اسبوع ١ - يوم ٤](#اسبوع-١---يوم-٤)
  - [اسبوع ١ - يوم ٥](#اسبوع-١---يوم-٥)
  - [اسبوع ٢ - يوم ١](#اسبوع-٢---يوم-١)
  - [اسبوع ٢ - يوم ٢](#اسبوع-٢---يوم-٢)
- [حلول اللابات](#حلول-اللابات)
  - [حل اسبوع ١ - يوم ١](#حل-اسبوع-١---يوم-١)
  - [حل اسبوع ١ - يوم ٢](#حل-اسبوع-١---يوم-٢)
  - [حل اسبوع ١ - يوم ٣](#حل-اسبوع-١---يوم-٣)
  - [حل اسبوع ١ - يوم ٤](#حل-اسبوع-١---يوم-٤)
  - [حل اسبوع ١ - يوم ٥](#حل-اسبوع-١---يوم-٥)
  - [حل اسبوع ٢ - يوم ١](#حل-اسبوع-٢---يوم-١)

## شروحات يوتوب

### اسبوع ١ - يوم ٣

**الموضوع**: Git & GitHub

**الشرح**: [devops week1 day3 git and github](https://youtu.be/SuwatQrKlZE)

### اسبوع ١ - يوم ٤

**الموضوع**: Linux commands, Azure VMs

**الشرح**: [devops week1 day4 linux + azure](https://youtu.be/G-hi9-YCluA)

### اسبوع ١ - يوم ٥

**الموضوع**: process vs service vs program, helpful bash stuff, alias

**الشرح**: [devops week1 day5 process vs service vs program, helpful bash stuff, alias](https://youtu.be/K-oZHxQqi20)

### اسبوع ٢ - يوم ١

**الموضوع**: bash scripting and accepting command arguments as input

**الشرح**: [devops week 2 day 1 bash scripting](https://youtu.be/OSCbi_X-1bU)

### اسبوع ٢ - يوم ٢

**الموضوع**: fixing lab 2 step 6's workflow

**الشرح**: [devops week2 day2 lab 2 step 6 workflow fix](https://www.youtube.com/watch?v=EagDQUUbEC0)

## حلول اللابات

### حل اسبوع ١ - يوم ١

No labs

### حل اسبوع ١ - يوم ٢

Group work on Miro

### حل اسبوع ١ - يوم ٣

#### Lab 1: Git Installation and Setup

![Git Installation and Setup](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/git-installation-and-setup.png)

#### Lab 2: Git Workflow

![Git Workflow](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/git-workflow.png)

#### Lab 3: Branches

![Git Branches](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/git-branches.png)

#### Lab 4: Collaborating with Remote

![Collaborating with Remote](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/collaborating-with-remote.png)

### حل اسبوع ١ - يوم ٤

#### Lab 1: Setup Linux Machine in Azure Cloud

في الصورة ظاهر اني مسوي كونكت عالـVM وفي الويندو اللي ورا ظاهر انها شغالة تمام, عشان كذا حسيت صورة وحدة كافية

![Setup Linux Machine in Azure Cloud](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/setup-linux-machine-azure-cloud.png)

#### Lab 2: Basic Navigation Commands in Linux

![Basic Navigation Commands in Linux](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/basic-navigation-commands-in-linux.png)

#### Lab 3: File Permissions in Linux

![File Permissions in Linux](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/file-permissions-in-linux.png)

#### Lab 4: Editing Files with vi / vim

![Editing Files with vi / vim](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/editing-files-with-vi-vim.png)

### حل اسبوع ١ - يوم ٥

#### Lab 1: Working with Web Servers

```bash
azureuser@server:~$ sudo apt install -y apache2 > /dev/null # install apache2 and do not show the output

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Scanning processes...
Scanning linux images...
azureuser@server:~$ sudo systemctl enable apache2 # enable the apache2 service
Synchronizing state of apache2.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
Executing: /usr/lib/systemd/systemd-sysv-install enable apache2
azureuser@server:~$ sudo systemctl status apache2 # check the status of apache2 to make sure it's enabled
● apache2.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/apache2.service; enabled; preset: >
     Active: active (running) since Thu 2025-09-04 07:25:52 UTC; 40s ago
       Docs: https://httpd.apache.org/docs/2.4/
   Main PID: 4049 (apache2)
      Tasks: 55 (limit: 9449)
     Memory: 5.1M (peak: 5.4M)
        CPU: 38ms
     CGroup: /system.slice/apache2.service
             ├─4049 /usr/sbin/apache2 -k start
             ├─4052 /usr/sbin/apache2 -k start
             └─4053 /usr/sbin/apache2 -k start

Sep 04 07:25:52 server systemd[1]: Starting apache2.service - The Apache HTTP S>
Sep 04 07:25:52 server systemd[1]: Started apache2.service - The Apache HTTP Se>
azureuser@server:~$ echo "<h1>Hi my name is Ali</h1>" | sudo tee /var/www/html/index.html > /dev/null # print the string into the index.html file, then do not display the output
azureuser@server:~$ curl http://localhost # check if I can reach the web page
<h1>Hi my name is Ali</h1>
azureuser@server:~$ echo "Done!"
Done!
azureuser@server:~$ _
```

![Working with Web Servers](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/working-with-web-servers.png)

### حل اسبوع ٢ - يوم ١

#### Lab 1: File Management with Shell Scripting

```bash
ali@ironhack:~$ # Lab 1
ali@ironhack:~$ cd lab1/
ali@ironhack:~/lab1$ vim file_manage.sh
ali@ironhack:~/lab1$ ./file_manage.sh
Creating directory lab1_test ...
Creating a sample file in lab1_test ...
Listing files in lab1_test:
total 4
-rw-rw-r-- 1 ali ali 30 Sep  7 10:38 sample.txt
Creating backup directory lab1_backup ...
Copying sample.txt to backup directory...
Renaming sample.txt to sample_renamed.txt ...
Moving sample_renamed.txt into a new subdirectory...
Deleting the file in subdirectory...
Cleaning up directories...
File operations complete. Backup copy is in lab1_backup.
ali@ironhack:~/lab1$ ls -lah
total 16K
drwxrwxr-x  3 ali ali 4.0K Sep  7 10:38 .
drwxr-x--- 20 ali ali 4.0K Sep  7 10:38 ..
-rwxrwxr-x  1 ali ali 1.9K Sep  7 10:38 file_manage.sh
drwxrwxr-x  2 ali ali 4.0K Sep  7 10:38 lab1_backup
ali@ironhack:~/lab1$ ls -lah lab1_backup/
total 12K
drwxrwxr-x 2 ali ali 4.0K Sep  7 10:38 .
drwxrwxr-x 3 ali ali 4.0K Sep  7 10:38 ..
-rw-rw-r-- 1 ali ali   30 Sep  7 10:38 sample.txt
ali@ironhack:~/lab1$
```

![Lab 1: File Management with Shell Scripting](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-lab1.png)

#### Lab 2: Process Monitoring with Shell Scripting

```bash
ali@ironhack:~$ # Lab 2
ali@ironhack:~$ ps
    PID TTY          TIME CMD
   6607 pts/0    00:00:01 bash
  19333 pts/0    00:00:00 vim
  19351 pts/0    00:00:00 ps
ali@ironhack:~$ vim check_process.sh
ali@ironhack:~$ chmod +x check_process.sh
ali@ironhack:~$ ./check_process.sh
cron is running
ali@ironhack:~$ vim check_process.sh
ali@ironhack:~$ ./check_process.sh
ssh is NOT running
ali@ironhack:~$
```

![Process Monitoring with Shell Scripting](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-lab2.png)

#### Lab 3: Backup Files & Folders with Shell Scripting

```bash
ali@ironhack:~$ mkdir lab3
ali@ironhack:~$ cd lab3/
ali@ironhack:~/lab3$ mkdir ../backup
ali@ironhack:~/lab3$ touch ../backup/file_{1..5}.txt
ali@ironhack:~/lab3$ vim backup.sh
ali@ironhack:~/lab3$ vim backup.sh
ali@ironhack:~/lab3$ chmod +x backup.sh
ali@ironhack:~/lab3$ ./backup.sh
Starting backup of /home/ali/backup to /home/ali/my-backups/myfolder_backup_20250907.tar.gz ...
tar: Removing leading `/' from member names
Backup completed successfully! ✅
Backup file created: /home/ali/my-backups/myfolder_backup_20250907.tar.gz
ali@ironhack:~/lab3$ ls -lah ~/my-backups/
total 12K
drwxrwxr-x  2 ali ali 4.0K Sep  7 10:54 .
drwxr-x--- 24 ali ali 4.0K Sep  7 10:54 ..
-rw-rw-r--  1 ali ali  188 Sep  7 10:54 myfolder_backup_20250907.tar.gz
ali@ironhack:~/lab3$ tar -tf ../my-backups/myfolder_backup_20250907.tar.gz
home/ali/backup/
home/ali/backup/file_4.txt
home/ali/backup/file_3.txt
home/ali/backup/file_2.txt
home/ali/backup/file_5.txt
home/ali/backup/file_1.txt
ali@ironhack:~/lab3$
```

![Backup Files & Folders with Shell Scripting](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-lab3.png)

#### Lab 4: Log Parsing with Shell Scripting

ملاحظة: عدلت الكود اللي من عنده في هذا اللاين

```bash
KEYWOARD="ERROR"
```

وخليته كذا

```bash
KEYWOARD=$1
```

كذا يصير بس اعطيه الكلمة اللي يبحث عنها دايركت بدل ما كل مرة اغير الكود

`$1` يعني خذ اول ارقيومنت من الكوماند

```bash
ali@ironhack:~$ vim parse_logs.sh
ali@ironhack:~$ chmod +x parse_logs.sh
ali@ironhack:~$ ./parse_logs.sh ding
grep: /var/log/syslog: Permission denied
grep: /var/log/syslog: Permission denied
Found  lines containing "ding" in /var/log/syslog.
Extracted those lines to error_lines.log.
ali@ironhack:~$ sudo !!
sudo ./parse_logs.sh ding
Found 137 lines containing "ding" in /var/log/syslog.
Extracted those lines to error_lines.log.
ali@ironhack:~$ sudo ./parse_logs.sh error
Found 4 lines containing "error" in /var/log/syslog.
Extracted those lines to error_lines.log.
```

![Log Parsing with Shell Scripting](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-lab4.png)

#### Lab 5: Task Schedueling with Shell Scripting

```bash
ali@ironhack:~$ vim heartbeat.sh
ali@ironhack:~$ chmod +x heartbeat.sh
ali@ironhack:~$ ./heartbeat.sh
ali@ironhack:~$ cat heartbeat.log
Heartbeat: 2025-09-07 11:30:07
ali@ironhack:~$ crontab # Ctrl+C to exit if stuck
^Cali@ironhack:~$ !! -e
crontab -e
crontab: installing new crontab
ali@ironhack:~$ cat heartbeat.log
Heartbeat: 2025-09-07 11:30:07
ali@ironhack:~$ cat heartbeat.log
Heartbeat: 2025-09-07 11:30:07
Heartbeat: 2025-09-07 11:32:01
ali@ironhack:~$
```

![Task Schedueling with Shell Scripting](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d1-lab5.png)

#### Extra Lab: Practicing Linux Commands

موجود هنا [الحل](./w2-d1-extra-lab.md)

### حل اسبوع ٢ - يوم ٢

#### Lab 1: Provisioning Windows VM in Azure

VMCeption. Mac RDP'd to Windows SSH'd to Ubuntu SSH'd to RedHat Enterprise Linux.

![Lab 1](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d2/lab1.png)

#### Lab 2: Provisioning a Web App in Azure

![Lab 2](https://ali-aljaffer-devops-labs.s3.me-south-1.amazonaws.com/w2d2/lab2.png)
