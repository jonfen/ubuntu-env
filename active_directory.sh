#!/bin/bash

# https://help.ubuntu.com/lts/serverguide/sssd-ad.html.en
# http://www.itadmintools.com/2011/07/creating-kerberos-keytab-files.html
# https://wiki.samba.org/index.php/Troubleshooting_Samba_Domain_Members
# https://askubuntu.com/questions/1048641/18-04-ignoring-dhcp-provided-dns-server
# https://help.gnome.org/admin/system-admin-guide/stable/login-enterprise.html.en
# https://www.freedesktop.org/software/realmd/docs/guide-active-directory.html
# https://help.ubuntu.com/community/ActiveDirectoryHowto
# https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-active-directory-authentication?view=sql-server-2017
# https://docs.microsoft.com/en-us/sql/azure-data-studio/enable-kerberos?view=sql-server-2017

echo Enter Domain in UPPERCASE [ex: DOMAIN.LOCAL]: 
read domain_name
echo Enter Active Directory Server [ex: ADS-SLC]:
read ads_server
echo Enter Domain Username [ex: first.last]: 
read username

sudo apt -y install realmd software-properties-common packagekit samba sssd chrony
sudo apt -y install krb5-user

# Join the Active Directory
sudo systemctl restart chrony.service
sudo systemctl restart smbd.service nmbd.service 
sudo systemctl start sssd.service
sudo kinit $username 
sudo klist
# sudo net ads join -k
sudo net ads join -k -S $ads_server
sudo realm join $domain_name -U '$username@$domain_name' -v

realm list
realm discover $domain_name 
realm join $domain_name 
sudo net getdomainsid
