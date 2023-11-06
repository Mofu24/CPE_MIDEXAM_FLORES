2023-11-06 11:52:48,035 p=4476 u=flores n=ansible | PLAY [all] *********************************************************************
2023-11-06 11:52:48,062 p=4476 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 11:52:50,391 p=4476 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 11:52:51,510 p=4476 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 11:52:51,522 p=4476 u=flores n=ansible | TASK [Installing dnf and epel-release name=['epel-release', 'dnf']] ************
2023-11-06 11:52:51,561 p=4476 u=flores n=ansible | skipping: [192.168.164.6]
2023-11-06 11:53:03,787 p=4476 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 11:53:03,793 p=4476 u=flores n=ansible | TASK [Update and upgrade remote CentOS server update_cache=True, name=*, state=latest] ***
2023-11-06 11:53:03,818 p=4476 u=flores n=ansible | skipping: [192.168.164.6]
2023-11-06 11:53:59,111 p=4476 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 11:53:59,117 p=4476 u=flores n=ansible | TASK [Installing Installations Dependencies name=['wget'], state=latest] *******
2023-11-06 11:53:59,133 p=4476 u=flores n=ansible | skipping: [192.168.164.10]
2023-11-06 11:54:01,571 p=4476 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 11:54:01,580 p=4476 u=flores n=ansible | TASK [Dpkg Fix in Ubuntu Servers _raw_params=dpkg --configure -a
] **************
2023-11-06 11:54:01,615 p=4476 u=flores n=ansible | skipping: [192.168.164.10]
2023-11-06 11:54:03,183 p=4476 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 11:54:03,189 p=4476 u=flores n=ansible | TASK [Update and Upgrade Remote in Ubuntu Servers update_cache=True, upgrade=True] ***
2023-11-06 11:54:03,212 p=4476 u=flores n=ansible | skipping: [192.168.164.10]
2023-11-06 11:54:12,949 p=4476 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 11:54:12,971 p=4476 u=flores n=ansible | PLAY [elk_centos] **************************************************************
2023-11-06 11:54:12,981 p=4476 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 11:54:15,406 p=4476 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 11:54:15,423 p=4476 u=flores n=ansible | TASK [elk_centos : Downloading the Source File of Elasticsearch url=https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.4.3-x86_64.rpm, dest=/tmp/elasticsearch-8.4.3-x86_64.rpm] ***
2023-11-06 11:58:13,903 p=4476 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 11:58:13,910 p=4476 u=flores n=ansible | TASK [elk_centos : Installing the Elasticsearch name=/tmp/elasticsearch-8.4.3-x86_64.rpm, state=present] ***
2023-11-06 11:59:10,871 p=4476 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 11:59:10,879 p=4476 u=flores n=ansible | TASK [elk_centos : Enabling the Elasticsearch Service name=elasticsearch, enabled=True] ***
2023-11-06 11:59:13,697 p=4476 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 11:59:13,703 p=4476 u=flores n=ansible | TASK [elk_centos : Modifying service file path=/usr/lib/systemd/system/elasticsearch.service, regexp=TimeoutStartSec=75, replace=TimeoutStartSec=300] ***
2023-11-06 11:59:15,720 p=4476 u=flores n=ansible | [0;31m--- before: /usr/lib/systemd/system/elasticsearch.service[0m
[0;31m[0m[0;32m+++ after: /usr/lib/systemd/system/elasticsearch.service[0m
[0;32m[0m[0;36m@@ -62,7 +62,7 @@[0m
[0;36m[0m SuccessExitStatus=143
 
 # Allow a slow startup before the systemd notifier module kicks in to extend the timeout
[0;31m-TimeoutStartSec=75[0m
[0;31m[0m[0;32m+TimeoutStartSec=300[0m
[0;32m[0m 
 [Install]
 WantedBy=multi-user.target


2023-11-06 11:59:15,721 p=4476 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 11:59:15,726 p=4476 u=flores n=ansible | TASK [elk_centos : Opening Port for Elasticsearch _raw_params=sudo firewall-cmd --permanent --zone=public --add-port=9200/tcp
sleep 10
sudo firewall-cmd --reload
] ***
2023-11-06 11:59:29,081 p=4476 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 11:59:29,088 p=4476 u=flores n=ansible | TASK [elk_centos : Enabling Elasticsearch Service _raw_params=systemctl enable elasticsearch.service
sleep 10
systemctl start elasticsearch.service
] ***
2023-11-06 11:59:56,816 p=4476 u=flores n=ansible | fatal: [192.168.164.10]: FAILED! => {"changed": true, "cmd": "systemctl enable elasticsearch.service\nsleep 10\nsystemctl start elasticsearch.service\n", "delta": "0:00:24.711931", "end": "2023-11-05 22:59:56.383871", "msg": "non-zero return code", "rc": 1, "start": "2023-11-05 22:59:31.671940", "stderr": "Job for elasticsearch.service failed because the control process exited with error code. See \"systemctl status elasticsearch.service\" and \"journalctl -xe\" for details.", "stderr_lines": ["Job for elasticsearch.service failed because the control process exited with error code. See \"systemctl status elasticsearch.service\" and \"journalctl -xe\" for details."], "stdout": "", "stdout_lines": []}
2023-11-06 11:59:56,816 p=4476 u=flores n=ansible | ...ignoring
2023-11-06 11:59:56,821 p=4476 u=flores n=ansible | TASK [elk_centos : Downloading and installing public signing key state=present, key=https://artifacts.elastic.co/GPG-KEY-elasticsearch] ***
2023-11-06 11:59:59,892 p=4476 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 11:59:59,900 p=4476 u=flores n=ansible | TASK [elk_centos : Creeating a Repo File for Logstash src=logstash.repo, dest=/etc/yum.repos.d/logstash.repo, owner=root, group=root, mode=511] ***
2023-11-06 12:00:01,289 p=4476 u=flores n=ansible | An exception occurred during task execution. To see the full traceback, use -vvv. The error was: If you are using a module and expect the file to exist on the remote, see the remote_src option
2023-11-06 12:00:01,290 p=4476 u=flores n=ansible | fatal: [192.168.164.10]: FAILED! => {"changed": false, "msg": "Could not find or access 'logstash.repo'\nSearched in:\n\t/home/flores/CPE_MIDEXAM_FLORES/roles/elk_centos/files/logstash.repo\n\t/home/flores/CPE_MIDEXAM_FLORES/roles/elk_centos/logstash.repo\n\t/home/flores/CPE_MIDEXAM_FLORES/roles/elk_centos/tasks/files/logstash.repo\n\t/home/flores/CPE_MIDEXAM_FLORES/roles/elk_centos/tasks/logstash.repo\n\t/home/flores/CPE_MIDEXAM_FLORES/files/logstash.repo\n\t/home/flores/CPE_MIDEXAM_FLORES/logstash.repo on the Ansible Controller.\nIf you are using a module and expect the file to exist on the remote, see the remote_src option"}
2023-11-06 12:00:01,291 p=4476 u=flores n=ansible | PLAY RECAP *********************************************************************
2023-11-06 12:00:01,291 p=4476 u=flores n=ansible | 192.168.164.10             : ok=11   changed=8    unreachable=0    failed=1    skipped=3    rescued=0    ignored=1   
2023-11-06 12:00:01,291 p=4476 u=flores n=ansible | 192.168.164.6              : ok=4    changed=1    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
2023-11-06 12:10:35,773 p=4870 u=flores n=ansible | PLAY [all] *********************************************************************
2023-11-06 12:10:35,803 p=4870 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 12:10:37,976 p=4870 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 12:10:38,605 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:10:38,612 p=4870 u=flores n=ansible | TASK [Installing dnf and epel-release name=['epel-release', 'dnf']] ************
2023-11-06 12:10:38,663 p=4870 u=flores n=ansible | skipping: [192.168.164.6]
2023-11-06 12:10:40,697 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:10:40,703 p=4870 u=flores n=ansible | TASK [Update and upgrade remote CentOS server update_cache=True, name=*, state=latest] ***
2023-11-06 12:10:40,753 p=4870 u=flores n=ansible | skipping: [192.168.164.6]
2023-11-06 12:12:19,258 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:12:19,266 p=4870 u=flores n=ansible | TASK [Installing Installations Dependencies name=['wget'], state=latest] *******
2023-11-06 12:12:19,292 p=4870 u=flores n=ansible | skipping: [192.168.164.10]
2023-11-06 12:12:21,600 p=4870 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 12:12:21,608 p=4870 u=flores n=ansible | TASK [Dpkg Fix in Ubuntu Servers _raw_params=dpkg --configure -a
] **************
2023-11-06 12:12:21,648 p=4870 u=flores n=ansible | skipping: [192.168.164.10]
2023-11-06 12:12:23,295 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:12:23,304 p=4870 u=flores n=ansible | TASK [Update and Upgrade Remote in Ubuntu Servers update_cache=True, upgrade=True] ***
2023-11-06 12:12:23,332 p=4870 u=flores n=ansible | skipping: [192.168.164.10]
2023-11-06 12:12:27,807 p=4870 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 12:12:27,836 p=4870 u=flores n=ansible | PLAY [elk_centos] **************************************************************
2023-11-06 12:12:27,854 p=4870 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 12:12:30,588 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:12:30,609 p=4870 u=flores n=ansible | TASK [elk_centos : Downloading the Source File of Elasticsearch url=https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.4.3-x86_64.rpm, dest=/tmp/elasticsearch-8.4.3-x86_64.rpm] ***
2023-11-06 12:12:32,844 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:12:32,852 p=4870 u=flores n=ansible | TASK [elk_centos : Installing the Elasticsearch name=/tmp/elasticsearch-8.4.3-x86_64.rpm, state=present] ***
2023-11-06 12:12:34,810 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:12:34,817 p=4870 u=flores n=ansible | TASK [elk_centos : Enabling the Elasticsearch Service name=elasticsearch, enabled=True] ***
2023-11-06 12:12:37,604 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:12:37,612 p=4870 u=flores n=ansible | TASK [elk_centos : Modifying service file path=/usr/lib/systemd/system/elasticsearch.service, regexp=TimeoutStartSec=75, replace=TimeoutStartSec=300] ***
2023-11-06 12:12:40,355 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:12:40,363 p=4870 u=flores n=ansible | TASK [elk_centos : Opening Port for Elasticsearch _raw_params=sudo firewall-cmd --permanent --zone=public --add-port=9200/tcp
sleep 10
sudo firewall-cmd --reload
] ***
2023-11-06 12:12:52,815 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:12:52,823 p=4870 u=flores n=ansible | TASK [elk_centos : Enabling Elasticsearch Service _raw_params=systemctl enable elasticsearch.service
sleep 10
systemctl start elasticsearch.service
] ***
2023-11-06 12:13:16,520 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:13:16,527 p=4870 u=flores n=ansible | TASK [elk_centos : Downloading and installing public signing key state=present, key=https://artifacts.elastic.co/GPG-KEY-elasticsearch] ***
2023-11-06 12:13:20,989 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:13:20,998 p=4870 u=flores n=ansible | TASK [elk_centos : Creeating a Repo File for Logstash src=logstash.repo, dest=/etc/yum.repos.d/logstash.repo, owner=root, group=root, mode=511] ***
2023-11-06 12:13:27,802 p=4870 u=flores n=ansible | [0;31m--- before[0m
[0;31m[0m[0;32m+++ after: /home/flores/CPE_MIDEXAM_FLORES/files/logstash.repo[0m
[0;32m[0m[0;36m@@ -0,0 +1,8 @@[0m
[0;36m[0m[0;32m+[logstash-8.x][0m
[0;32m[0m[0;32m+name=Elastic repository for 8.x packages[0m
[0;32m[0m[0;32m+baseurl=https://artifacts.elastic.co/packages/8.x/yum[0m
[0;32m[0m[0;32m+gpgcheck=1[0m
[0;32m[0m[0;32m+gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch[0m
[0;32m[0m[0;32m+enabled=1[0m
[0;32m[0m[0;32m+autorefresh=1[0m
[0;32m[0m[0;32m+type=rpm-md[0m
[0;32m[0m

2023-11-06 12:13:27,803 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:13:27,808 p=4870 u=flores n=ansible | TASK [elk_centos : Updating Repo update_cache=True] ****************************
2023-11-06 12:14:52,941 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:14:52,948 p=4870 u=flores n=ansible | TASK [elk_centos : Installing Logstash and its Dependencies name=['logstash'], state=latest] ***
2023-11-06 12:17:37,139 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:17:37,147 p=4870 u=flores n=ansible | TASK [elk_centos : Opening Port for Logstash _raw_params=sudo firewall-cmd --permanent --zone=public --add-port=9600/tcp
sleep 10
sudo firewall-cmd --reload
] ***
2023-11-06 12:17:51,988 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:17:51,995 p=4870 u=flores n=ansible | TASK [elk_centos : Logstash is Started and Enabled name=logstash, state=restarted, enabled=True] ***
2023-11-06 12:17:54,583 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:17:54,590 p=4870 u=flores n=ansible | TASK [elk_centos : Downloading and Installing Public Signing Key state=present, key=https://artifacts.elastic.co/GPG-KEY-elasticsearch] ***
2023-11-06 12:17:57,087 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:17:57,097 p=4870 u=flores n=ansible | TASK [elk_centos : Adding Kibana to the RPM repository src=kibana.repo, dest=/etc/yum.repos.d/kibana.repo, owner=root, group=root, mode=777] ***
2023-11-06 12:18:04,952 p=4870 u=flores n=ansible | [0;31m--- before[0m
[0;31m[0m[0;32m+++ after: /home/flores/CPE_MIDEXAM_FLORES/files/kibana.repo[0m
[0;32m[0m[0;36m@@ -0,0 +1,8 @@[0m
[0;36m[0m[0;32m+[kibana-8.x][0m
[0;32m[0m[0;32m+name=Kibana repository for 8.x packages[0m
[0;32m[0m[0;32m+baseurl=https://artifacts.elastic.co/packages/8.x/yum[0m
[0;32m[0m[0;32m+gpgcheck=1[0m
[0;32m[0m[0;32m+gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch[0m
[0;32m[0m[0;32m+enabled=1[0m
[0;32m[0m[0;32m+autorefresh=1[0m
[0;32m[0m[0;32m+type=rpm-md[0m
[0;32m[0m

2023-11-06 12:18:04,952 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:18:04,960 p=4870 u=flores n=ansible | TASK [elk_centos : Updating the Repository name=['kibana'], state=latest] ******
2023-11-06 12:22:22,562 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:22:22,568 p=4870 u=flores n=ansible | TASK [elk_centos : Opening port for Kibana port=5601/tcp, zone=public, permanent=True, state=enabled] ***
2023-11-06 12:22:26,349 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:22:26,358 p=4870 u=flores n=ansible | TASK [elk_centos : Kibana is Started and Enabled name=kibana, state=restarted, enabled=True] ***
2023-11-06 12:22:29,634 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:22:29,662 p=4870 u=flores n=ansible | PLAY [elk_ubuntu] **************************************************************
2023-11-06 12:22:29,671 p=4870 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 12:22:31,472 p=4870 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 12:22:31,490 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Installing Dependencies name=['apt-transport-https', 'openjdk-8-jdk'], state=latest] ***
2023-11-06 12:23:01,778 p=4870 u=flores n=ansible | The following package was automatically installed and is no longer required:
  libllvm7
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
  openjdk-8-jdk-headless openjdk-8-jre openjdk-8-jre-headless
Suggested packages:
  openjdk-8-demo openjdk-8-source visualvm fonts-ipafont-gothic
  fonts-ipafont-mincho fonts-wqy-microhei fonts-wqy-zenhei
The following NEW packages will be installed:
  apt-transport-https openjdk-8-jdk openjdk-8-jdk-headless openjdk-8-jre
  openjdk-8-jre-headless
0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.
2023-11-06 12:23:01,778 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:23:01,786 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Downloading in the Logstash Package url=https://artifacts.elastic.co/downloads/logstash/logstash-8.4.3-amd64.deb, dest=/tmp/logstash-8.4.3-amd64.deb] ***
2023-11-06 12:25:21,295 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:25:21,304 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Installing Package deb=/tmp/logstash-8.4.3-amd64.deb] *******
2023-11-06 12:25:43,276 p=4870 u=flores n=ansible | (Reading database ... 251417 files and directories currently installed.)
Preparing to unpack /tmp/logstash-8.4.3-amd64.deb ...
Unpacking logstash (1:8.4.3-1) over (1:7.17.14-1) ...
Setting up logstash (1:8.4.3-1) ...
Installing new version of config file /etc/logstash/jvm.options ...
2023-11-06 12:25:43,276 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:25:43,283 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Reloading the Daemon _raw_params=/bin/systemctl daemon-reload] ***
2023-11-06 12:25:45,136 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:25:45,145 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Starting and Enabling the Service for Logstash name=logstash, state=restarted, enabled=True] ***
2023-11-06 12:25:46,970 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:25:46,978 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Downloading in the Kibana Package url=https://artifacts.elastic.co/downloads/kibana/kibana-8.4.3-amd64.deb, dest=/tmp/kibana-8.4.3-amd64.deb] ***
2023-11-06 12:27:48,518 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:27:48,527 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Installing Kibana deb=/tmp/kibana-8.4.3-amd64.deb] **********
2023-11-06 12:29:10,047 p=4870 u=flores n=ansible | (Reading database ... 250256 files and directories currently installed.)
Preparing to unpack /tmp/kibana-8.4.3-amd64.deb ...
Stopping kibana service... OK
Unpacking kibana (8.4.3) over (7.17.14) ...
Setting up kibana (8.4.3) ...
Installing new version of config file /etc/default/kibana ...
Installing new version of config file /etc/kibana/kibana.yml ...
Installing new version of config file /etc/kibana/node.options ...
Restarting kibana service... OK
2023-11-06 12:29:10,047 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:29:10,058 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Reloading the Daemon _raw_params=/bin/systemctl daemon-reload] ***
2023-11-06 12:29:13,256 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:29:13,263 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Kibana service is Started and Enabled name=kibana, state=restarted, enabled=True] ***
2023-11-06 12:29:17,085 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:29:17,091 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Downloading in the Elasticsearch Package url=https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.4.3-amd64.deb, dest=/tmp/elasticsearch-8.4.3-amd64.deb] ***
2023-11-06 12:33:17,042 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:33:17,050 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Installing Package deb=/tmp/elasticsearch-8.4.3-amd64.deb] ***
2023-11-06 12:33:42,711 p=4870 u=flores n=ansible | (Reading database ... 250577 files and directories currently installed.)
Preparing to unpack .../elasticsearch-8.4.3-amd64.deb ...
Unpacking elasticsearch (8.4.3) over (7.17.14) ...
Setting up elasticsearch (8.4.3) ...
Installing new version of config file /etc/elasticsearch/jvm.options ...
Installing new version of config file /etc/elasticsearch/log4j2.properties ...
Installing new version of config file /etc/default/elasticsearch ...
Created elasticsearch keystore in /etc/elasticsearch/elasticsearch.keystore
2023-11-06 12:33:42,712 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:33:42,720 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Enabling Elasticsearch Service name=elasticsearch, enabled=True] ***
2023-11-06 12:33:45,489 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:33:45,496 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Modifying the Service File path=/usr/lib/systemd/system/elasticsearch.service, regexp=TimeoutStartSec=75, replace=TimeoutStartSec=500] ***
2023-11-06 12:33:47,341 p=4870 u=flores n=ansible | [0;31m--- before: /usr/lib/systemd/system/elasticsearch.service[0m
[0;31m[0m[0;32m+++ after: /usr/lib/systemd/system/elasticsearch.service[0m
[0;32m[0m[0;36m@@ -62,7 +62,7 @@[0m
[0;36m[0m SuccessExitStatus=143
 
 # Allow a slow startup before the systemd notifier module kicks in to extend the timeout
[0;31m-TimeoutStartSec=75[0m
[0;31m[0m[0;32m+TimeoutStartSec=500[0m
[0;32m[0m 
 [Install]
 WantedBy=multi-user.target


2023-11-06 12:33:47,341 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:33:47,349 p=4870 u=flores n=ansible | TASK [elk_ubuntu : Starting and Enabling Daemon _raw_params=sudo systemctl enable elasticsearch.service
sleep 10
sudo systemctl start elasticsearch.service
] ***
2023-11-06 12:34:38,166 p=4870 u=flores n=ansible | fatal: [192.168.164.6]: FAILED! => {"changed": true, "cmd": "sudo systemctl enable elasticsearch.service\nsleep 10\nsudo systemctl start elasticsearch.service\n", "delta": "0:00:47.551601", "end": "2023-11-06 12:34:36.727994", "msg": "non-zero return code", "rc": 1, "start": "2023-11-06 12:33:49.176393", "stderr": "Synchronizing state of elasticsearch.service with SysV service script with /lib/systemd/systemd-sysv-install.\nExecuting: /lib/systemd/systemd-sysv-install enable elasticsearch\nJob for elasticsearch.service failed because the control process exited with error code.\nSee \"systemctl status elasticsearch.service\" and \"journalctl -xe\" for details.", "stderr_lines": ["Synchronizing state of elasticsearch.service with SysV service script with /lib/systemd/systemd-sysv-install.", "Executing: /lib/systemd/systemd-sysv-install enable elasticsearch", "Job for elasticsearch.service failed because the control process exited with error code.", "See \"systemctl status elasticsearch.service\" and \"journalctl -xe\" for details."], "stdout": "", "stdout_lines": []}
2023-11-06 12:34:38,167 p=4870 u=flores n=ansible | ...ignoring
2023-11-06 12:34:38,203 p=4870 u=flores n=ansible | PLAY [nagios_centos] ***********************************************************
2023-11-06 12:34:38,224 p=4870 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 12:34:42,199 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:34:42,213 p=4870 u=flores n=ansible | TASK [nagios_centos : Installing nagios dependecies and libraries name=['gcc', 'glibc', 'glibc-common', 'perl', 'httpd', 'php', 'wget', 'gd', 'gd-devel', 'openssl-devel', 'gcc', 'glibc', 'glibc-common', 'make', 'gettext', 'automake', 'autoconf', 'wget', 'openssl-devel', 'net-snmp', 'net-snmp-utils', 'python2-pip'], state=latest] ***
2023-11-06 12:35:53,820 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:35:53,827 p=4870 u=flores n=ansible | TASK [nagios_centos : Install passlib python package name=passlib] *************
2023-11-06 12:35:59,345 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:35:59,355 p=4870 u=flores n=ansible | TASK [nagios_centos : Creating a directory (where the downloaded files will be stored) path=~/nagios, state=directory] ***
2023-11-06 12:36:03,250 p=4870 u=flores n=ansible | [0;31m--- before[0m
[0;31m[0m[0;32m+++ after[0m
[0;32m[0m[0;36m@@ -1,4 +1,4 @@[0m
[0;36m[0m {
     "path": "/root/nagios",
[0;31m-    "state": "absent"[0m
[0;31m[0m[0;32m+    "state": "directory"[0m
[0;32m[0m }


2023-11-06 12:36:03,251 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:36:03,261 p=4870 u=flores n=ansible | TASK [nagios_centos : Downloading and extracting Nagios src=https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.6.tar.gz, dest=~/nagios, remote_src=True, mode=511, owner=root, group=root] ***
2023-11-06 12:36:14,686 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:36:14,695 p=4870 u=flores n=ansible | TASK [nagios_centos : Compiling, installing, and adding users and groups in nagios _raw_params=cd ~/nagios/nagioscore-**
./configure
make all
make install-groups-users
usermod -a -G nagios apache
make install
make install-daemoninit
make install-commandmode
make install-config
make install-webconf
] ***
2023-11-06 12:37:04,238 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:37:04,243 p=4870 u=flores n=ansible | TASK [nagios_centos : Downloading and extracting Nagios plugins src=https://github.com/nagios-plugins/nagios-plugins/archive/release-2.3.3.tar.gz, dest=~/nagios, remote_src=True, mode=511, owner=root, group=root] ***
2023-11-06 12:37:12,743 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:37:12,751 p=4870 u=flores n=ansible | TASK [nagios_centos : Compiling and installing plugins _raw_params=cd ~/nagios/nagios-plugins*
./tools/setup
./configure
make
make install
] ***
2023-11-06 12:39:15,907 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:39:15,913 p=4870 u=flores n=ansible | TASK [nagios_centos : Add a user to a password file and ensure permissions are set path=/usr/local/nagios/etc/htpasswd.users, name=adminnagios, password=server12345] ***
2023-11-06 12:39:19,543 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:39:19,556 p=4870 u=flores n=ansible | TASK [nagios_centos : Making sure that nagios is started and enabled name=nagios, state=restarted, enabled=True] ***
2023-11-06 12:39:24,615 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:39:24,622 p=4870 u=flores n=ansible | TASK [nagios_centos : Making sure that httpd is started and enabled name=httpd, state=restarted, enabled=True] ***
2023-11-06 12:39:28,947 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:39:28,974 p=4870 u=flores n=ansible | PLAY [igp_centos] **************************************************************
2023-11-06 12:39:28,986 p=4870 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 12:39:33,255 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:39:33,270 p=4870 u=flores n=ansible | TASK [igp_centos : Copying the Influxdb Repository File src=https://dl.influxdata.com/influxdb/releases/influxdb2-2.4.0-linux-amd64.tar.gz, dest=/tmp/, remote_src=True, mode=511, owner=root, group=root] ***
2023-11-06 12:40:42,757 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:40:42,763 p=4870 u=flores n=ansible | TASK [igp_centos : Adding the Executables to the PATH _raw_params=cd /tmp/influxdb2* sudo cp influxdb2-2.4.0-linux-amd64/influxd /usr/local/bin/] ***
2023-11-06 12:40:46,069 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:40:46,077 p=4870 u=flores n=ansible | TASK [igp_centos : Downloading Grafana Package url=https://dl.grafana.com/enterprise/release/grafana-enterprise-9.2.2-1.x86_64.rpm, dest=/tmp/grafana-enterprise-9.2.2-1.x86_64.rpm] ***
2023-11-06 12:41:41,629 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:41:41,640 p=4870 u=flores n=ansible | TASK [igp_centos : Installing Grafana name=/tmp/grafana-enterprise-9.2.2-1.x86_64.rpm] ***
2023-11-06 12:42:04,223 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:42:04,231 p=4870 u=flores n=ansible | TASK [igp_centos : Enabling Grafana Service name=grafana-server, enabled=True] ***
2023-11-06 12:42:08,906 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:42:08,914 p=4870 u=flores n=ansible | TASK [igp_centos : Modifying Service File path=/usr/lib/systemd/system/grafana-server.service, regexp=TimeoutStartSec=75, replace=TimeoutStartSec=500] ***
2023-11-06 12:42:11,674 p=4870 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:42:11,680 p=4870 u=flores n=ansible | TASK [igp_centos : Grafana Service is Started and Enabled name=grafana-server, enabled=True, state=started] ***
2023-11-06 12:42:23,688 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:42:23,695 p=4870 u=flores n=ansible | TASK [igp_centos : Creating a directory for Prometheus package path=~/prometheus, state=directory] ***
2023-11-06 12:42:26,993 p=4870 u=flores n=ansible | [0;31m--- before[0m
[0;31m[0m[0;32m+++ after[0m
[0;32m[0m[0;36m@@ -1,4 +1,4 @@[0m
[0;36m[0m {
     "path": "/root/prometheus",
[0;31m-    "state": "absent"[0m
[0;31m[0m[0;32m+    "state": "directory"[0m
[0;32m[0m }


2023-11-06 12:42:26,993 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:42:27,005 p=4870 u=flores n=ansible | TASK [igp_centos : Downloading and extracting Prometheus src=https://github.com/prometheus/prometheus/releases/download/v2.39.1/prometheus-2.39.1.linux-amd64.tar.gz, dest=~/prometheus, remote_src=True, mode=511, owner=root, group=root] ***
2023-11-06 12:43:13,051 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:43:13,059 p=4870 u=flores n=ansible | TASK [igp_centos : Stopping the Prometheus service if exists _raw_params=sudo systemctl stop prometheus >> /dev/null] ***
2023-11-06 12:43:15,710 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:43:15,723 p=4870 u=flores n=ansible | TASK [igp_centos : Adding the Prometheus executables to a PATH _raw_params=cd ~/prometheus/prometheus*
cp -r . /usr/local/bin/prometheus
] ***
2023-11-06 12:43:19,130 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:43:19,143 p=4870 u=flores n=ansible | TASK [igp_centos : Copying the Prometheus service file src=prometheus.service, dest=/etc/systemd/system/, owner=root, group=root, mode=777] ***
2023-11-06 12:43:27,292 p=4870 u=flores n=ansible | [0;31m--- before[0m
[0;31m[0m[0;32m+++ after: /home/flores/CPE_MIDEXAM_FLORES/files/prometheus.service[0m
[0;32m[0m[0;36m@@ -0,0 +1,10 @@[0m
[0;36m[0m[0;32m+[Unit][0m
[0;32m[0m[0;32m+Description=Prometheus Service[0m
[0;32m[0m[0;32m+After=network.target[0m
[0;32m[0m[0;32m+[0m
[0;32m[0m[0;32m+[Service][0m
[0;32m[0m[0;32m+Type=simple[0m
[0;32m[0m[0;32m+ExecStart=/usr/local/bin/prometheus/prometheus --config.file=/usr/local/bin/prometheus/prometheus.yml[0m
[0;32m[0m[0;32m+[0m
[0;32m[0m[0;32m+[Install][0m
[0;32m[0m[0;32m+WantedBy=multi-user.target[0m
[0;32m[0m

2023-11-06 12:43:27,293 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:43:27,301 p=4870 u=flores n=ansible | TASK [igp_centos : Prometheus service is started and enabled name=prometheus, state=restarted, enabled=True] ***
2023-11-06 12:43:31,522 p=4870 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 12:43:31,539 p=4870 u=flores n=ansible | PLAY [igp_ubuntu] **************************************************************
2023-11-06 12:43:31,561 p=4870 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 12:43:34,329 p=4870 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 12:43:34,346 p=4870 u=flores n=ansible | TASK [igp_ubuntu : Installing dependencies name=['apt-transport-https', 'software-properties-common', 'wget'], state=latest] ***
2023-11-06 12:43:39,526 p=4870 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 12:43:39,533 p=4870 u=flores n=ansible | TASK [igp_ubuntu : Adding Influxdb in the repository _raw_params=wget -q https://repos.influxdata.com/influxdb.key
sleep 5
echo '23a1c8836f0afc5ed24e0486339d7cc8f6790b83886c4c96995b88a061c5bb5d influxdb.key' | sha256sum -c && cat influxdb.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdb.gpg > /dev/null
sleep 5
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdb.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list
] ***
2023-11-06 12:43:53,290 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:43:53,296 p=4870 u=flores n=ansible | TASK [igp_ubuntu : Installing Influxdb name=['influxdb']] **********************
2023-11-06 12:44:11,782 p=4870 u=flores n=ansible | The following package was automatically installed and is no longer required:
  libllvm7
Use 'sudo apt autoremove' to remove it.
The following NEW packages will be installed:
  influxdb
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
2023-11-06 12:44:11,783 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:44:11,790 p=4870 u=flores n=ansible | TASK [igp_ubuntu : Influxdb is enabled and started name=influxdb, state=started, enabled=True] ***
2023-11-06 12:44:13,965 p=4870 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 12:44:13,972 p=4870 u=flores n=ansible | TASK [igp_ubuntu : Adding Grafana Repo _raw_params=sudo wget -q -O /usr/share/keyrings/grafana.key https://packages.grafana.com/gpg.key
] ***
2023-11-06 12:44:15,885 p=4870 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 12:44:15,893 p=4870 u=flores n=ansible | TASK [igp_ubuntu : Update repo _raw_params=sudo apt-get update
] ****************
2023-11-06 12:44:21,362 p=4870 u=flores n=ansible | fatal: [192.168.164.6]: FAILED! => {"changed": true, "cmd": "sudo apt-get update\n", "delta": "0:00:03.363797", "end": "2023-11-06 12:44:20.969959", "msg": "non-zero return code", "rc": 100, "start": "2023-11-06 12:44:17.606162", "stderr": "W: GPG error: https://repos.influxdata.com/debian stable InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY D8FF8E1F7DF8B07E\nE: The repository 'https://repos.influxdata.com/debian stable InRelease' is not signed.", "stderr_lines": ["W: GPG error: https://repos.influxdata.com/debian stable InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY D8FF8E1F7DF8B07E", "E: The repository 'https://repos.influxdata.com/debian stable InRelease' is not signed."], "stdout": "Hit:1 https://packages.grafana.com/oss/deb stable InRelease\nHit:2 http://ph.archive.ubuntu.com/ubuntu bionic InRelease\nHit:3 https://artifacts.elastic.co/packages/7.x/apt stable InRelease\nHit:4 http://ph.archive.ubuntu.com/ubuntu bionic-updates InRelease\nHit:5 http://ph.archive.ubuntu.com/ubuntu bionic-backports InRelease\nHit:6 http://security.ubuntu.com/ubuntu bionic-security InRelease\nGet:7 https://repos.influxdata.com/debian stable InRelease [6,901 B]\nErr:7 https://repos.influxdata.com/debian stable InRelease\n  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY D8FF8E1F7DF8B07E\nReading package lists...", "stdout_lines": ["Hit:1 https://packages.grafana.com/oss/deb stable InRelease", "Hit:2 http://ph.archive.ubuntu.com/ubuntu bionic InRelease", "Hit:3 https://artifacts.elastic.co/packages/7.x/apt stable InRelease", "Hit:4 http://ph.archive.ubuntu.com/ubuntu bionic-updates InRelease", "Hit:5 http://ph.archive.ubuntu.com/ubuntu bionic-backports InRelease", "Hit:6 http://security.ubuntu.com/ubuntu bionic-security InRelease", "Get:7 https://repos.influxdata.com/debian stable InRelease [6,901 B]", "Err:7 https://repos.influxdata.com/debian stable InRelease", "  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY D8FF8E1F7DF8B07E", "Reading package lists..."]}
2023-11-06 12:44:21,363 p=4870 u=flores n=ansible | PLAY RECAP *********************************************************************
2023-11-06 12:44:21,363 p=4870 u=flores n=ansible | 192.168.164.10             : ok=46   changed=32   unreachable=0    failed=0    skipped=3    rescued=0    ignored=0   
2023-11-06 12:44:21,364 p=4870 u=flores n=ansible | 192.168.164.6              : ok=25   changed=18   unreachable=0    failed=1    skipped=2    rescued=0    ignored=1   
2023-11-06 12:50:37,163 p=5914 u=flores n=ansible | PLAY [all] *********************************************************************
2023-11-06 12:50:37,184 p=5914 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 12:50:40,422 p=5914 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 12:50:42,083 p=5914 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:50:42,093 p=5914 u=flores n=ansible | TASK [Installing dnf and epel-release name=['epel-release', 'dnf']] ************
2023-11-06 12:50:42,142 p=5914 u=flores n=ansible | skipping: [192.168.164.6]
2023-11-06 12:50:45,535 p=5914 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:50:45,541 p=5914 u=flores n=ansible | TASK [Update and upgrade remote CentOS server update_cache=True, name=*, state=latest] ***
2023-11-06 12:50:45,588 p=5914 u=flores n=ansible | skipping: [192.168.164.6]
2023-11-06 12:53:26,851 p=5914 u=flores n=ansible |  [ERROR]: User interrupted execution

2023-11-06 12:53:31,747 p=6109 u=flores n=ansible | PLAY [all] *********************************************************************
2023-11-06 12:53:31,766 p=6109 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 12:53:34,918 p=6109 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 12:53:37,533 p=6109 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:53:37,542 p=6109 u=flores n=ansible | TASK [Installing dnf and epel-release name=['epel-release', 'dnf']] ************
2023-11-06 12:53:37,591 p=6109 u=flores n=ansible | skipping: [192.168.164.6]
2023-11-06 12:53:41,056 p=6109 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 12:53:41,064 p=6109 u=flores n=ansible | TASK [Update and upgrade remote CentOS server update_cache=True, name=*, state=latest] ***
2023-11-06 12:53:41,090 p=6109 u=flores n=ansible | skipping: [192.168.164.6]
2023-11-06 12:53:46,195 p=6109 u=flores n=ansible |  [ERROR]: User interrupted execution

2023-11-06 13:00:05,527 p=6359 u=flores n=ansible | ERROR! conflicting action statements: hosts, tasks

The error appears to be in '/home/flores/CPE_MIDEXAM_FLORES/roles/igp_ubuntu/tasks/main.yml': line 2, column 3, but may
be elsewhere in the file depending on the exact syntax problem.

The offending line appears to be:

---
- hosts: all
  ^ here

2023-11-06 13:00:38,462 p=6396 u=flores n=ansible | PLAY [all] *********************************************************************
2023-11-06 13:00:38,477 p=6396 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 13:00:41,662 p=6396 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 13:00:42,827 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:00:42,836 p=6396 u=flores n=ansible | TASK [Installing dnf and epel-release name=['epel-release', 'dnf']] ************
2023-11-06 13:00:42,872 p=6396 u=flores n=ansible | skipping: [192.168.164.6]
2023-11-06 13:00:46,041 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:00:46,047 p=6396 u=flores n=ansible | TASK [Update and upgrade remote CentOS server update_cache=True, name=*, state=latest] ***
2023-11-06 13:00:46,071 p=6396 u=flores n=ansible | skipping: [192.168.164.6]
2023-11-06 13:04:00,101 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:04:00,108 p=6396 u=flores n=ansible | TASK [Installing Installations Dependencies name=['wget'], state=latest] *******
2023-11-06 13:04:00,141 p=6396 u=flores n=ansible | skipping: [192.168.164.10]
2023-11-06 13:04:03,478 p=6396 u=flores n=ansible | ok: [192.168.164.6]
2023-11-06 13:04:03,488 p=6396 u=flores n=ansible | TASK [Dpkg Fix in Ubuntu Servers _raw_params=dpkg --configure -a
] **************
2023-11-06 13:04:03,516 p=6396 u=flores n=ansible | skipping: [192.168.164.10]
2023-11-06 13:04:05,862 p=6396 u=flores n=ansible | changed: [192.168.164.6]
2023-11-06 13:04:05,869 p=6396 u=flores n=ansible | TASK [Update and Upgrade Remote in Ubuntu Servers update_cache=True, upgrade=True] ***
2023-11-06 13:04:05,899 p=6396 u=flores n=ansible | skipping: [192.168.164.10]
2023-11-06 13:04:56,886 p=6396 u=flores n=ansible | fatal: [192.168.164.6]: FAILED! => {"changed": false, "msg": "Failed to update apt cache: W:Updating from such a repository can't be done securely, and is therefore disabled by default., W:See apt-secure(8) manpage for repository creation and user configuration details., W:Skipping acquire of configured file 'main/binary-i386/Packages' as repository 'https://packages.grafana.com/oss/deb stable InRelease' doesn't support architecture 'i386', W:GPG error: https://repos.influxdata.com/debian stable InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY D8FF8E1F7DF8B07E, E:The repository 'https://repos.influxdata.com/debian stable InRelease' is not signed."}
2023-11-06 13:04:56,921 p=6396 u=flores n=ansible | PLAY [elk_centos] **************************************************************
2023-11-06 13:04:56,934 p=6396 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 13:05:00,918 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:05:00,929 p=6396 u=flores n=ansible | TASK [elk_centos : Downloading the Source File of Elasticsearch url=https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.4.3-x86_64.rpm, dest=/tmp/elasticsearch-8.4.3-x86_64.rpm] ***
2023-11-06 13:05:04,103 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:05:04,110 p=6396 u=flores n=ansible | TASK [elk_centos : Installing the Elasticsearch name=/tmp/elasticsearch-8.4.3-x86_64.rpm, state=present] ***
2023-11-06 13:05:11,036 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:05:11,042 p=6396 u=flores n=ansible | TASK [elk_centos : Enabling the Elasticsearch Service name=elasticsearch, enabled=True] ***
2023-11-06 13:05:14,322 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:05:14,331 p=6396 u=flores n=ansible | TASK [elk_centos : Modifying service file path=/usr/lib/systemd/system/elasticsearch.service, regexp=TimeoutStartSec=75, replace=TimeoutStartSec=300] ***
2023-11-06 13:05:17,675 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:05:17,682 p=6396 u=flores n=ansible | TASK [elk_centos : Opening Port for Elasticsearch _raw_params=sudo firewall-cmd --permanent --zone=public --add-port=9200/tcp
sleep 10
sudo firewall-cmd --reload
] ***
2023-11-06 13:05:33,583 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:05:33,589 p=6396 u=flores n=ansible | TASK [elk_centos : Enabling Elasticsearch Service _raw_params=systemctl enable elasticsearch.service
sleep 10
systemctl start elasticsearch.service
] ***
2023-11-06 13:05:47,380 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:05:47,389 p=6396 u=flores n=ansible | TASK [elk_centos : Downloading and installing public signing key state=present, key=https://artifacts.elastic.co/GPG-KEY-elasticsearch] ***
2023-11-06 13:05:51,145 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:05:51,154 p=6396 u=flores n=ansible | TASK [elk_centos : Creeating a Repo File for Logstash src=logstash.repo, dest=/etc/yum.repos.d/logstash.repo, owner=root, group=root, mode=511] ***
2023-11-06 13:05:55,679 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:05:55,686 p=6396 u=flores n=ansible | TASK [elk_centos : Updating Repo update_cache=True] ****************************
2023-11-06 13:06:14,966 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:06:14,973 p=6396 u=flores n=ansible | TASK [elk_centos : Installing Logstash and its Dependencies name=['logstash'], state=latest] ***
2023-11-06 13:06:21,638 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:06:21,647 p=6396 u=flores n=ansible | TASK [elk_centos : Opening Port for Logstash _raw_params=sudo firewall-cmd --permanent --zone=public --add-port=9600/tcp
sleep 10
sudo firewall-cmd --reload
] ***
2023-11-06 13:06:36,649 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:06:36,659 p=6396 u=flores n=ansible | TASK [elk_centos : Logstash is Started and Enabled name=logstash, state=restarted, enabled=True] ***
2023-11-06 13:06:40,610 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:06:40,617 p=6396 u=flores n=ansible | TASK [elk_centos : Downloading and Installing Public Signing Key state=present, key=https://artifacts.elastic.co/GPG-KEY-elasticsearch] ***
2023-11-06 13:06:44,150 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:06:44,157 p=6396 u=flores n=ansible | TASK [elk_centos : Adding Kibana to the RPM repository src=kibana.repo, dest=/etc/yum.repos.d/kibana.repo, owner=root, group=root, mode=777] ***
2023-11-06 13:06:49,856 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:06:49,864 p=6396 u=flores n=ansible | TASK [elk_centos : Updating the Repository name=['kibana'], state=latest] ******
2023-11-06 13:07:01,340 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:07:01,349 p=6396 u=flores n=ansible | TASK [elk_centos : Opening port for Kibana port=5601/tcp, zone=public, permanent=True, state=enabled] ***
2023-11-06 13:07:04,243 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:07:04,250 p=6396 u=flores n=ansible | TASK [elk_centos : Kibana is Started and Enabled name=kibana, state=restarted, enabled=True] ***
2023-11-06 13:07:07,652 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:07:07,669 p=6396 u=flores n=ansible | PLAY [elk_ubuntu] **************************************************************
2023-11-06 13:07:07,684 p=6396 u=flores n=ansible | PLAY [nagios_centos] ***********************************************************
2023-11-06 13:07:07,695 p=6396 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 13:07:11,078 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:07:11,089 p=6396 u=flores n=ansible | TASK [nagios_centos : Installing nagios dependecies and libraries name=['gcc', 'glibc', 'glibc-common', 'perl', 'httpd', 'php', 'wget', 'gd', 'gd-devel', 'openssl-devel', 'gcc', 'glibc', 'glibc-common', 'make', 'gettext', 'automake', 'autoconf', 'wget', 'openssl-devel', 'net-snmp', 'net-snmp-utils', 'python2-pip'], state=latest] ***
2023-11-06 13:07:19,231 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:07:19,239 p=6396 u=flores n=ansible | TASK [nagios_centos : Install passlib python package name=passlib] *************
2023-11-06 13:07:22,912 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:07:22,921 p=6396 u=flores n=ansible | TASK [nagios_centos : Creating a directory (where the downloaded files will be stored) path=~/nagios, state=directory] ***
2023-11-06 13:07:25,874 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:07:25,884 p=6396 u=flores n=ansible | TASK [nagios_centos : Downloading and extracting Nagios src=https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.6.tar.gz, dest=~/nagios, remote_src=True, mode=511, owner=root, group=root] ***
2023-11-06 13:07:37,486 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:07:37,495 p=6396 u=flores n=ansible | TASK [nagios_centos : Compiling, installing, and adding users and groups in nagios _raw_params=cd ~/nagios/nagioscore-**
./configure
make all
make install-groups-users
usermod -a -G nagios apache
make install
make install-daemoninit
make install-commandmode
make install-config
make install-webconf
] ***
2023-11-06 13:08:01,620 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:08:01,627 p=6396 u=flores n=ansible | TASK [nagios_centos : Downloading and extracting Nagios plugins src=https://github.com/nagios-plugins/nagios-plugins/archive/release-2.3.3.tar.gz, dest=~/nagios, remote_src=True, mode=511, owner=root, group=root] ***
2023-11-06 13:08:11,401 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:08:11,407 p=6396 u=flores n=ansible | TASK [nagios_centos : Compiling and installing plugins _raw_params=cd ~/nagios/nagios-plugins*
./tools/setup
./configure
make
make install
] ***
2023-11-06 13:09:58,539 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:09:58,547 p=6396 u=flores n=ansible | TASK [nagios_centos : Add a user to a password file and ensure permissions are set path=/usr/local/nagios/etc/htpasswd.users, name=adminnagios, password=server12345] ***
2023-11-06 13:10:04,213 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:10:04,220 p=6396 u=flores n=ansible | TASK [nagios_centos : Making sure that nagios is started and enabled name=nagios, state=restarted, enabled=True] ***
2023-11-06 13:10:07,890 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:10:07,899 p=6396 u=flores n=ansible | TASK [nagios_centos : Making sure that httpd is started and enabled name=httpd, state=restarted, enabled=True] ***
2023-11-06 13:10:15,048 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:10:15,073 p=6396 u=flores n=ansible | PLAY [igp_centos] **************************************************************
2023-11-06 13:10:15,084 p=6396 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 13:10:18,377 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:10:18,393 p=6396 u=flores n=ansible | TASK [igp_centos : Copying the Influxdb Repository File src=https://dl.influxdata.com/influxdb/releases/influxdb2-2.4.0-linux-amd64.tar.gz, dest=/tmp/, remote_src=True, mode=511, owner=root, group=root] ***
2023-11-06 13:11:28,044 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:11:28,053 p=6396 u=flores n=ansible | TASK [igp_centos : Adding the Executables to the PATH _raw_params=cd /tmp/influxdb2* sudo cp influxdb2-2.4.0-linux-amd64/influxd /usr/local/bin/] ***
2023-11-06 13:11:32,359 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:11:32,365 p=6396 u=flores n=ansible | TASK [igp_centos : Downloading Grafana Package url=https://dl.grafana.com/enterprise/release/grafana-enterprise-9.2.2-1.x86_64.rpm, dest=/tmp/grafana-enterprise-9.2.2-1.x86_64.rpm] ***
2023-11-06 13:11:36,205 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:11:36,213 p=6396 u=flores n=ansible | TASK [igp_centos : Installing Grafana name=/tmp/grafana-enterprise-9.2.2-1.x86_64.rpm] ***
2023-11-06 13:11:48,022 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:11:48,031 p=6396 u=flores n=ansible | TASK [igp_centos : Enabling Grafana Service name=grafana-server, enabled=True] ***
2023-11-06 13:11:51,029 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:11:51,034 p=6396 u=flores n=ansible | TASK [igp_centos : Modifying Service File path=/usr/lib/systemd/system/grafana-server.service, regexp=TimeoutStartSec=75, replace=TimeoutStartSec=500] ***
2023-11-06 13:11:54,547 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:11:54,552 p=6396 u=flores n=ansible | TASK [igp_centos : Grafana Service is Started and Enabled name=grafana-server, enabled=True, state=started] ***
2023-11-06 13:11:57,972 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:11:57,982 p=6396 u=flores n=ansible | TASK [igp_centos : Creating a directory for Prometheus package path=~/prometheus, state=directory] ***
2023-11-06 13:12:01,892 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:12:01,898 p=6396 u=flores n=ansible | TASK [igp_centos : Downloading and extracting Prometheus src=https://github.com/prometheus/prometheus/releases/download/v2.39.1/prometheus-2.39.1.linux-amd64.tar.gz, dest=~/prometheus, remote_src=True, mode=511, owner=root, group=root] ***
2023-11-06 13:12:47,654 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:12:47,661 p=6396 u=flores n=ansible | TASK [igp_centos : Stopping the Prometheus service if exists _raw_params=sudo systemctl stop prometheus >> /dev/null] ***
2023-11-06 13:12:50,678 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:12:50,684 p=6396 u=flores n=ansible | TASK [igp_centos : Adding the Prometheus executables to a PATH _raw_params=cd ~/prometheus/prometheus*
cp -r . /usr/local/bin/prometheus
] ***
2023-11-06 13:12:53,823 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:12:53,831 p=6396 u=flores n=ansible | TASK [igp_centos : Copying the Prometheus service file src=prometheus.service, dest=/etc/systemd/system/, owner=root, group=root, mode=777] ***
2023-11-06 13:12:58,963 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:12:58,972 p=6396 u=flores n=ansible | TASK [igp_centos : Prometheus service is started and enabled name=prometheus, state=restarted, enabled=True] ***
2023-11-06 13:13:02,709 p=6396 u=flores n=ansible | changed: [192.168.164.10]
2023-11-06 13:13:02,730 p=6396 u=flores n=ansible | PLAY [igp_ubuntu] **************************************************************
2023-11-06 13:13:02,745 p=6396 u=flores n=ansible | PLAY [ls_centos] ***************************************************************
2023-11-06 13:13:02,753 p=6396 u=flores n=ansible | TASK [Gathering Facts gather_subset=['!hardware', '!facter', '!ohai'], gather_timeout=10] ***
2023-11-06 13:13:06,149 p=6396 u=flores n=ansible | ok: [192.168.164.10]
2023-11-06 13:13:06,161 p=6396 u=flores n=ansible | TASK [ls_centos : Installing Lamp Stack dependencies name=['httpd', 'mariadb-server', 'mariadb', 'php', 'php-mysql'], state=latest] ***
