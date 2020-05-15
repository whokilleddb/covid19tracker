#!/bin/bash
updatedb
locate covid19tracker >results.txt
x=$(cat results.txt | sed -n '1p')
rm -rf $x/covid19
rm -rf $x/install.sh
rm -rf $x/Images
rm -rf $x/lolcat-master
rm -rf $x/master.zip
rm -rf $x/README.md
rm results.txt
rm /usr/bin/covid19
rm -- "$0"
