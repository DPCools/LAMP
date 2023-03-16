#!/bin/bash

echo -e
echo -e "The script may require root user"
echo -e
echo -e "LAMP installer for Ubuntu & Debian"
echo -e "What OS are you using?"
echo -e "1) Ubuntu 14.04"
echo -e "2) Ubuntu 16.04"
echo -e "3) Debian 8"
echo "4) Debian 11"
read os

while [[ $os != @(1|2|3|4) ]]
do
	echo "Please insert a valid number."
	read os
done

if [ $os -eq 1 ]; then
	apt-get update
	apt-get install curl -y
	apt-get install apache2 -y
	apt-get install mysql-server php5-mysql -y
	mysql_secure_installation
	apt-get install php5 libapache2-mod-php5 php5-mcrypt php5-cli php5-curl php5-ssh2 php-mbstring php-gettext -y
	service apache2 restart
	apt-get install phpmyadmin -y
    ln -s /usr/share/phpmyadmin /var/www/html/
    echo -e "Installation finished."
elif [ $os -eq 2  ]; then
	apt-get update
	apt-get install curl -y
	apt-get install apache2 -y
	apt-get install mysql-server
	mysql_secure_installation
	apt-get install php libapache2-mod-php php-mcrypt php-mysql php-cli php-curl php-ssh2 php-mbstring php-gettext -y
	service apache2 restart
	apt-get install phpmyadmin -y
    ln -s /usr/share/phpmyadmin /var/www/html/
    echo -e "Installation finished."
elif [ $os -eq 3 ]; then
	apt-get update
	apt-get install curl -y
	apt-get install apache2 apache2-doc -y
	apt-get install mysql-server php5-mysql -y
	mysql_secure_installation
	apt-get install php5-common libapache2-mod-php5 php5-cli php5-curl php5-ssh2 php-mbstring php-gettext -y
	service apache2 restart
	apt-get install phpmyadmin -y
    ln -s /usr/share/phpmyadmin /var/www/html/
    echo -e "Installation finished."
elif [ $os -eq 4 ]; then
	apt-get update  
	apt -y install lsb-release apt-transport-https ca-certificates wget 
	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg 
	echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list 
	apt-get update 
	apt-get install curl -y 
	apt-get install apache2 -y 
	apt install mariadb-server -y 
	mysql_secure_installation 
	apt install php8.1 libapache2-mod-php8.1 -y 
	apt install php8.1-{bcmath,fpm,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi} -y 
	systemctl restart apache2 
	apt-get install phpmyadmin -y 
	sudo a2enmod php8.1 
    ln -s /usr/share/phpmyadmin /var/www/html/ 
	systemctl enable apache2 
    echo -e "Installation finished."
fi
