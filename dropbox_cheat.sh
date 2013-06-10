#!/bin/bash

DEST=`pwd`
#enter here your referal link from Dropbox
REFLINK="http://db.tt/FqhxwxP"

download()
{
  echo "Downloading Dropbox distributive..."
  cd
  wget -O dropbox.tar.gz "http://www.dropbox.com/download/?plat=lnx.x86"  
  cd $DEST
}

update_mac()
{
  echo "Update mac address..."
  ifconfig eth0 down
  ifconfig eth0 hw ether `printf '52:54:00:%02X:%02X:%02X\n' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256))`
  ifconfig eth0 up
  dhclient eth0
  ifconfig eth0
  echo "MAC updated..."
}

extract()
{
  echo "Unpack archive"
  rm -rf .dropbox-dist
  tar -tzf dropbox.tar.gz
  tar -xvzf dropbox.tar.gz
}

register()
{
  cd
  echo "Registering new referal..."
  rm -rf .dropbox
  update_mac
  echo "Register new referral... Now enter random Login (like your_gmail_login+blablabla@gmail.com) and Password (like '123456'). Close Firefox after register new user!"
  firefox $REFLINK;
  echo "Choose 'I already have Dropbox account', enter your login and password. Click Next, and close installer. Repeat =)"
  ~/.dropbox-dist/dropboxd
  cd $DEST
}

case $1 in 
  "download" ) download ;;
  "extract"  ) extract ;;
  "register" ) register ;;
  *          ) echo "Usage: Simply execute '$0 download && $0 extract' and than repeat '$0 register' many times as necessary";;
esac

exit 0
