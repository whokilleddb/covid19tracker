#!/bin/bash
echo -e '\033[1mFetching Packages\033[0m'
echo ""
sudo apt-get install -y figlet.
sudo apt-get install ruby	
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
cd lolcat-master/bin
sudo gem install lolcat
echo ""
echo -e '\033[1mAlmost There....\033[0m'
echo ""
cd ../../

sudo chmod 777 covid.sh
sudo cp covid.sh /usr/bin/
mv /usr/bin/covid.sh /usr/bin/covid19
echo -e '\033[1mInstallation Complete\033[0m'
