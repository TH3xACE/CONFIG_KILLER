# CONFIG_KILLER

This script was written to retrive the configuration files of the following services on a linux system :

Currently in progress:
- Apache

To-do list
- mongodb
- mysql
- nginx
- OpenLDAP
- OpenVPN
- Oracle
- WebLogic
- PHP
- Postfix
- Postgresql
- Tomcat

This sometimes might contains some loot :) , yes low hanging fruits isn't it ????

# What does the script do
- Looks for default directories of the different services 
- List the directories (ls)
- Dump the config + compressed and put them in /tmp/{service}
- Create a text files with the different files that the compressed files contains
- Look for the config files of the different services in non-default directories


# Disclaimer
This script is for Educational purpose ONLY. Do not use it without permission. The usual disclaimer applies, especially the fact that me (TH3xACE) is not liable for any damages caused by direct or indirect use of the information or functionality provided by these programs. The author or any Internet provider bears NO responsibility for content or misuse of these programs or any derivatives thereof. By using these programs you accept the fact that any damage (dataloss, system crash, system compromise, etc.) caused by the use of the script is not my responsibility.
