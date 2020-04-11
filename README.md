## Zabbix 4.4 Version on Ubuntu 18.04
İnstallation Shell Script。

DBname : zabbix
DBuser : zabbix

DB Default Password : Zab0ubn

### Custom Password

If you will change the Password, you need to open Computer/root/Zabbix-Shell/install.sh open with text editor

change to DBPassword:your pass and IDENTIFIED BY 'your pass';

save and exit.


### Step 1:

 Open Terminal

  sudo su - root
  
### Step 2:

apt install git    
 
git clone https://github.com/ozntrkkn/Zabbix-Shell.git

### Step 3:

cd Zabbix-Shell

sh install.sh

### Step 4:
Type Password.


### Step 4:
Open Browser 

http://localhost/zabbix 


Special Thanks to @BensonRUEI
