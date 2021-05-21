#!/usr/bin/env bash

# For debugging
# set -x

apt update

# Install  l2tp  manager  for  gnome 

function installVPN () {
    apt-get -y install network-manager-l2tp network-manager-l2tp-gnome
}

# Install  inventory agent for GLPI 

function installFusAgent() {
   apt-get -y install dmidecode hwdata ucf hdparm perl libuniversal-require-perl libwww-perl libparse-edid-perl \
   libproc-daemon-perl libfile-which-perl libhttp-daemon-perl libxml-treepp-perl libyaml-perl libnet-cups-perl libnet-ip-perl \
   libdigest-sha-perl libsocket-getaddrinfo-perl libtext-template-perl libxml-xpath-perl libyaml-tiny-perl \
   libnet-snmp-perl libcrypt-des-perl libnet-nbname-perl libdigest-hmac-perl libfile-copy-recursive-perl libparallel-forkmanager-perl \
   libwrite-net-perl wget 
   wget https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.5.2/fusioninventory-agent_2.5.2-1_all.deb
   dpkg -i fusioninventory-agent_2.5.2-1_all.deb
   
}

# Configure FusionInventory agent

function configureFusAgent() {
    # some code here  
   echo  $pwd
   mv agent.cfg /etc/fusioninventory/
   apt-get --fix-broken install
   pkill -USR1 -f -P 1 fusioninventory-agent

}

installVPN
installFusAgent
configureFusAgent


