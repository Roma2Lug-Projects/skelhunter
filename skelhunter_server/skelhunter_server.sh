#!/bin/bash
#Skelhunter - Roma2LUG 

###[SERVER CONFIG]###

#	spath: 		Origin path
spath="/opt/"

#	srvlist:	Server listfile output
srvlist="/var/www/skelhunter.list"


if [ $(id -u) -ne 0 ];
	then echo -e "\n\t[ERR]\tSkelhunter needs root permissions. \n\n\t\t<<Perché io so' io>> - March. Onofrio Del Grillo\n"
	exit 1;
fi;

echo -e "\n\t[INF]\tSkelhunter server invoked, proceeding!"

echo -e "\n\t[INF]\tEntering path"
cd $spath

echo -e "\n\t[INF]\tUpdating skelhunter.list"
md5sum *.tar > $srvlist

echo -e "\n\t[INF]\tSkelhunter server script ended successfully, cya!"
