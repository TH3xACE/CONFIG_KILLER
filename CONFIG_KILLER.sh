#!/bin/sh
# This script was to developed to  get the path of juicy config + dump juicy config files + get loot from them + 
# Version="version 0.1"
# Date : 07/12/2018
# @TH3_ACE - BLAIS David

# Future updates :
# 
#
#


##### (Cosmetic) Colour output
RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal

TARGET="Serveur Linux `uname -n`"
BASEDIR="/tmp/config.killer"


rm -r $BASEDIR
mkdir $BASEDIR

if [ 1 -eq 0 ]; then
if [ -e $OUTPUT_FILE ]; then
    echo "${BOLD}${RED}[!] Output file ${OUTPUT_FILE} already exists. Exit."
    exit
fi
fi

##### help function
usage () 
{
#####  echo -e " $version \n"
printf " $version \n"
echo -e " Example: ./config_killer.sh -c -r report.txt -e /tmp/  \n"

		echo "OPTIONS:"
		echo "-k	Enter keyword"
		echo "-e	Enter export location"
#		echo "-t	Include thorough (lengthy) tests"
		echo "-r	Enter report name" 
		echo "-h	Displays this help text"
		echo -e "\n"
		echo "Running with no options = limited scans/no output file"
		
echo -e " ######################################################### "
}


header() 
{

#echo "${BOLD}${RED}[*#################### CONFIG_KILLER is running ;) #######################*] \n"

cat << "EOF"
       _..._       .-'''-.                                                                                                                 
    .-'_..._''.   '   _    \                                                                 .---.---.                                     
  .' .'      '.\/   /` '.   \    _..._            .--.                             .     .--.|   |   |     __.....__                       
 / .'          .   |     \  '  .'     '.     _.._ |__| .--./)                    .'|     |__||   |   | .-''         '.                     
. '            |   '      |  '.   .-.   .  .' .._|.--./.''\\                   .'  |     .--.|   |   |/     .-''"'-.  `. .-,.--.           
| |            \    \     / / |  '   '  |  | '    |  | |  | |                 <    |     |  ||   |   /     /________\   \|  .-. |          
| |             `.   ` ..' /  |  |   |  |__| |__  |  |\`-' /                   |   | ____|  ||   |   |                  || |  | |          
. '                '-...-'`   |  |   |  |__   __| |  |/("'`                    |   | \ .'|  ||   |   \    .-------------'| |  | |          
 \ '.          .              |  |   |  |  | |    |  |\ '---.                  |   |/  . |  ||   |   |\    '-.____...---.| |  '-           
  '. `._____.-'/              |  |   |  |  | |    |__| /'""'.\ ________________|    /\  \|__||   |   | `.             .' | |               
    `-.______ /               |  |   |  |  | |        ||     ||________________|   |  \  \   '---'---'   `''-...... -'   | |               
             `                |  |   |  |  | |        \'. __//                 '    \  \  \                              |_|               
                              '--'   '--'  |_|         `'---'                 '------'  '---'                                    

EOF
#echo "\n"
echo "${BLUE} @TH3_ACE - BLAIS David"
echo "${BLUE} Contribute and collaborate to the KILLER project @ https://github.com/TH3xACE/"
echo "\n"


echo "${BOLD}${YELLOW}[~] Services currently being checked${RESET}"
echo "Apache"
echo "mongodb"
echo "mysql"
echo "nginx"
echo "OpenLDAP"
echo "OpenVPN"
echo "Oracle"
echo "WebLogic"
echo "PHP"
echo "Postfix"
echo "Postgresql"
echo "Tomcat"

}


run_this()
{
# echo "Running the following: $COMMAND"
echo "Target : $TARGET" >> $OUTFILE
echo "Description : $DESCRIPTION" >> $OUTFILE
echo "Command : $COMMAND" >> $OUTFILE

echo "Date `date`" >> $OUTFILE
$COMMAND >> $OUTFILE 2>&1
echo $STARTEND >> $OUTFILE
#echo " $COMMAND ran successfully"
}




# Apache and httpd
apache()
{

echo "\n${BOLD}${YELLOW}[~] Apache ${RESET}"

# Check for default directory 

mkdir -p $BASEDIR/apache

SERVERROOT="/var/www/"
HTTPDCONF="/etc/httpd"
APACHECONF="/etc/apache2"

# to find all .htaccess on the server
# find / -name ".htaccess" -print 2>/dev/null
COMMAND="nice -19 find $SERVERROOT -name .htaccess -exec echo $SEPARATOR {} ; -exec ls -ailL {} ; -exec cat {} ;"
DESCRIPTION="The config list of .htaccess"
OUTFILE=$BASEDIR/apache/htaccess.txt
run_this

COMMAND="find -L $APACHECONF ( -type l -o -type f ) -exec echo $SEPARATOR {} ; -exec ls -ailL {} ; -exec cat {} ;"
DESCRIPTION="The config list of Apache"
OUTFILE=$BASEDIR/apache/Apache.txt
run_this

# to find all .htpasswd on the server
# find / -name ".htpasswd" -print 2>/dev/null
COMMAND="find / -name ".htpasswd" -print ;"
DESCRIPTION="The config list of .htpasswd"
OUTFILE=$BASEDIR/apache/htpasswd.txt
run_this

COMMAND="tar -cvzf $BASEDIR/apache/apache.tar.gz $APACHECONF"
DESCRIPTION="Configuration file of Apache"
OUTFILE=$BASEDIR/apache/Apache.tar.txt
run_this

COMMAND="find -L $HTTPDCONF ( -type l -o -type f ) -exec echo $SEPARATOR {} ; -exec ls -ailL {} ; -exec cat {} ;"
DESCRIPTION="Configuration file of HTTPD"
OUTFILE=$BASEDIR/apache/httpd.txt
run_this

COMMAND="tar -cvzf $BASEDIR/apache/httpd.tar.gz $HTTPDCONF"
DESCRIPTION="Config Files of httpd"
OUTFILE=$BASEDIR/apache/httpd.tar.txt
run_this

COMMAND="/usr/sbin/apache2 -v"
DESCRIPTION="Apache version"
OUTFILE=$BASEDIR/apache/version_apache.txt
run_this

COMMAND="httpd -V"
DESCRIPTION="httpd version"
OUTFILE=$BASEDIR/apache/version_httpd.txt
run_this


COMMAND="ls -lR $APACHECONF "
DESCRIPTION="Files that exists in Apache"
OUTFILE=$BASEDIR/apache/ls.all_apache.txt
run_this

COMMAND="ls -lR $HTTPDCONF "
DESCRIPTION="Files that exists in httpd"
OUTFILE=$BASEDIR/apache/ls.all_httpd.txt
run_this

COMMAND="ls -lR $SERVERROOT "
DESCRIPTION="Files that exists in www"
OUTFILE=$BASEDIR/apache/ls.all_www.txt
run_this

echo "${BOLD} Scan completed ${GREEN} successfully ${RESET}, please find outputs there: $BASEDIR/apache/"


}


# # mongodb
# mongodb()
# {

# }

# # mysql
# mysql()
# {

# }

# # nginx
# nginx()
# {

# }

# # OpenLDAP
# OpenLDAP()
# {

# }

# # OpenVPN
# OpenVPN()
# {

# }

# # Oracle
# Oracle()
# {

# }

# # WebLogic
# WebLogic()
# {

# }

# # PHP
# PHP()
# {

# }

# # Postfix
# Postfix()
# {

# }

# # Postgresql
# Postgresql()
# {

# }


# # Tomcat
# Tomcat()
# {

# }





while getopts "h:k:r:e:t" option; do
 case "${option}" in
    k) keyword=${OPTARG};;
    r) report=${OPTARG}"-"`date +"%d-%m-%y"`;;
    e) export=${OPTARG};;
  #  t) thorough=1;;
    h) usage; exit;;
    *) usage; exit;;
 esac
done

call_each()
{
  header
 # usage
  apache
}

call_each | tee -a $report 2> /dev/null
