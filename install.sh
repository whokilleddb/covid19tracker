#!/bin/bash
echo -e '\033[1m"Fetching Packages"\033[0m'
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
mv covid.sh covid19
sudo chmod 777 covid19
sudo cp covid19 /usr/bin/
echo ""
echo -e '\033[1mInstallation Complete\033[0m'

