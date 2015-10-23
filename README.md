##Pre-install

Create file ansible/grop_vars/private in standard Ansible-dictionary format:

```
#Tomcat's manager web-app password
tomcat_admin_pwd: XXXXXXXX

#SMTP server username/password
mail_smtp_username: XXXXXXXX
mail_smtp_password: XXXXXXXX

#mysql root user password
mysql_root_password: XXXXXXXX
#mysql indaba user password
mysql_indaba_password: XXXXXXXX

#Indaba dmin password
admin_pwd: XXXXXXXX
```

Set variables in  ansible/grop_vars/all to desired values.

#Deployment to amazon EC2 server

Change ansible/hosts file content to match your paramters. Execute command

```
ansible-playbook playbook.yml -i ./hosts
```
from ansible folder.

##Post-install

Centos 7 use SELinux which prevent some non-standard configurations. You should login to you host and run followinf commands to fix that.

```
sudo semanage fcontext -a -t httpd_sys_content_t "/apps/prod/apache(/.*)?"
sudo semanage fcontext -a -t httpd_log_t "/apps/prod/apache/logs(/.*)?"
sudo restorecon -Rv /apps/prod/apache
```

See http://www.serverlab.ca/tutorials/linux/web-servers-linux/configuring-selinux-policies-for-apache-web-servers/ for detailed explanations.

Permit Apache to connect to mysql over tcp/ip
```
sudo setsebool -P httpd_can_network_connect 1
```

Create self-signed certivicate to test SSL connection. Run
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout your_host_name.key -out your_host_name.crt
```
from /etc/ssl/certs folder. Make sure that pathes to key and crt files in /etc/httpd/conf.d/indaba.conf are correct.

From AWS contol panel permit access to default SSL port 443.

Replace php-mysql to php-mysqlnd.

```
sudo yum remove php-mysql
sudo yum install php-mysqlnd
```

Restart servises.
```
sudo service tomcat restart
sudo service tomcat_wf restart
sudo service httpd restart
```

Admin should respond on host's http://your_host_name/indaba_admin

http://your_host_name/cp - ControlPanel

http://your_host_name/indaba - FM31

http://your_host_name/ids - Publisher



#Deployment to local VM (using Vagarant)

You may need to:

```
sudo apt-get install python-mysqldb
```
on local machne.


##Vagrant Instructions

Navigate to /vagrant folder of this directory, and type:

```
vagrant up
```

Vagrant will automatically execute the Ansible script and deploy the instance locally.

You can access the box via ssh by typing: 

```
vagrant ssh
```

##Post-install

Almost same as for EC2, but SELinux is, normally, disabled on VMs.

Login to a local machine.
```
vagrant ssh
```

Create self-signed certivicate to test SSL connection. Run
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout your_host_name.key -out your_host_name.crt
```
from /etc/ssl/certs folder. Make sure that pathes to key and crt files in /etc/httpd/conf.d/indaba.conf are correct.

Replace php-mysql to php-mysqlnd.

```
sudo yum remove php-mysql
sudo yum install php-mysqlnd
```

Restart servises.
```
sudo service tomcat restart
sudo service tomcat_wf restart
sudo service httpd restart
```

Admin should respond on host's http://localhost:8443/indaba_admin

http://localhost:8443/cp - ControlPanel

http://localhost:8443/indaba - FM31

http://localhost:8443/ids - Publisher
