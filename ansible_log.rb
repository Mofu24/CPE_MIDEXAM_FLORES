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
