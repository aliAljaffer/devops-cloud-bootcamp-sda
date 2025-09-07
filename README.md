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
- [حلول اللابات](#حلول-اللابات)
  - [حل اسبوع ١ - يوم ١](#حل-اسبوع-١---يوم-١)
  - [حل اسبوع ١ - يوم ٢](#حل-اسبوع-١---يوم-٢)
  - [حل اسبوع ١ - يوم ٣](#حل-اسبوع-١---يوم-٣)
  - [حل اسبوع ١ - يوم ٤](#حل-اسبوع-١---يوم-٤)
  - [حل اسبوع ١ - يوم ٥](#حل-اسبوع-١---يوم-٥)

## شروحات يوتوب

### اسبوع ١ - يوم ٣

**الموضوع**: Git & GitHub

**الشرح**: [devops week1 day3 git and github](https://youtu.be/SuwatQrKlZE)

#### اسبوع ١ - يوم ٤

**الموضوع**: Linux commands, Azure VMs

**الشرح**: [devops week1 day4 linux + azure](https://youtu.be/G-hi9-YCluA)

#### اسبوع ١ - يوم ٥

**الموضوع**: process vs service vs program, helpful bash stuff, alias

**الشرح**: [devops week1 day5 process vs service vs program, helpful bash stuff, alias](https://youtu.be/K-oZHxQqi20)

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

#### Extra Lab: Practicing Linux Commands

موجود هنا [الحل](./w2-d1-extra-lab.md)
