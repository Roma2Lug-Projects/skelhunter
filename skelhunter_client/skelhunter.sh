#!/bin/bash
#Skelhunter - Roma2LUG 

###[CLIENT CONFIG]###

#	spath: 		Destination path
cpath="/opt/"

#	srvlist:	Server listfile
clist="http://10.0.0.1/skelhunter.list"

###[SERVER CONFIG]###

#	spath: 		Origin path
spath="/opt/"

#	slist:	Server listfile
slist="/var/www/skelhunter.list"


if [ $(id -u) -ne 0 ];
	then echo -e "\n\t[ERR]\tSkelhunter needs root permissions. \n\n\t\t<<Perché io so' io>> - March. Onofrio Del Grillo\n"
	exit 1;
fi;

function client {
	case "$2" in
        init)
            echo -e "\n\t[INF]\tSkelhunter invoked as client, proceeding!"
            echo -e "\n\t[INF]\tClient init"
            mkdir -p $cpath 2> /dev/null
			cd $cpath
			wget $clist -O skelhunter.llist
			
			#cat prova |  awk -v var="$mycol_new" -F $'\t' 'BEGIN {OFS = FS} {$2 = var; print}'
	
            ;;
         
        update)
            echo -e "\n\t[INF]\tSkelhunter invoked as client, proceeding!"
            echo -e "\n\t[INF]\tClient update"
            ;;
         
        *)
            echo -e "\n\t[ERR]\tInvoke using $0 {client|server} {init|update}\n"
            exit 1
	esac
	
	
	
}

function server {
	echo -e "\n\t[INF]\tSkelhunter invoked as server, proceeding!"
	
	case "$2" in
        init)        
            echo -e "server init"
            for i in $( cat prova ); do
				echo item: $i
			done
            ;;
         
        update)
            echo -e "server update"
            ;;
         
        *)
            echo -e "\n\t[ERR]\tInvoke using $0 {client|server} {init|update}\n"
            exit 1
 esac
 
}
	
	
	case "$1" in
        client)
			client
			;;
			
        server)
            server
            ;;
         
        *)
            echo -e "\n\t[ERR]\tInvoke using $0 {client|server} {init|update}\n"
            exit 1
 esac
 



