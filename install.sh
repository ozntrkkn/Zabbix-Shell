
#Ubuntu 18.04 Version installation Script



#You need to change only Password and end of the script you will enter your changed below Password. 


sudo apt install -y net-tools git
ip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.2.0.1'`


sudo add-apt-repository universe -y
sudo apt update -y

sudo apt -y install apache2 libapache2-mod-php
sudo apt -y install mysql-server
sudo apt -y install php php-mbstring php-gd php-xml php-bcmath php-ldap php-mysql

echo date.timezone = \"Europe/Istanbul\" >> /etc/php/7.2/apache2/php.ini


wget https://repo.zabbix.com/zabbix/4.4/debian/pool/main/z/zabbix-release/zabbix-release_4.4-1+stretch_all.deb
sudo dpkg -i zabbix-release_4.4-1+stretch_all.deb

sudo apt -y update
sudo apt -y install zabbix-server-mysql zabbix-frontend-php zabbix-agent

mysql -u root <<EOF
	CREATE DATABASE zabbix character set utf8 collate utf8_bin;
	CREATE USER 'zabbix'@'localhost' IDENTIFIED BY 'Password';
	GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'localhost' WITH GRANT OPTION;
	FLUSH PRIVILEGES;
	exit
EOF


cd /usr/share/doc/zabbix-server-mysql

zcat create.sql.gz | mysql -u zabbix -p zabbix



echo  DBHost=localhost\ >> /etc/zabbix/zabbix_server.conf 

echo  DBPassword=Password\ >> /etc/zabbix/zabbix_server.conf 

sudo service apache2 restart
sudo service zabbix-server restart



echo "Zabbix Setup Link: http://"$ip"/zabbix"
