#!/bin/bash
#Skelhunter - Client
#Roma2LUG 

###[CLIENT CONFIG]###

#	cpath: 		Destination path
cpath="/opt/"

#	clist:	Server listfile
clist="http://10.0.0.1/skelhunter.list"

#	csrvip:		Server IP address
csrvip="10.0.0.1"

if [ $(id -u) -ne 0 ];
	then echo -e "\n\t[ERR]\tSkelhunter needs root permissions. \n\n\t\t<<Perché io so' io>> - March. Onofrio Del Grillo\n"
	exit 1;
fi;

function init {
            echo -e "\n\t[INF]\tSkelhunter client invoked for init, proceeding!"
            
            mkdir -p $cpath 2> /dev/null
			cd $cpath
			wget $clist -O skelhunter.llist
			        
			for i in $( cat skelhunter.llist |  awk -v var="$mycol_new" -F $'\t' 'BEGIN {OFS = FS} {$1 = var; print}' | awk '{print $1 $2}' ); do
				wget "http://""$csrvip""/""$i"
				tar -xvf "$i"
			done
			
			mv skelhunter.llist skelhunter.list
			#cat prova |  awk -v var="$mycol_new" -F $'\t' 'BEGIN {OFS = FS} {$1 = var; print}' | awk '{print $1 $2}'	filename
			#cat prova |  awk -v var="$mycol_new" -F $'\t' 'BEGIN {OFS = FS} {$2 = var; print}' | awk '{print $1 $2}'	md5sum
}
	   
function update {
	echo -e "\n\t[INF]\tSkelhunter client invoked for update, proceeding!"
	
			cd $cpath
			wget $clist -O skelhunter.llist
			sldiff=$(diff skelhunter.llist skelhunter.list)
			if [ "$sldiff" != "" ] 
				then
					echo -e "\n\t[INF]\tLocal Skelhunter listfile differs from server, updating!"
					
					for i in $( cat skelhunter.llist |  awk -v var="$mycol_new" -F $'\t' 'BEGIN {OFS = FS} {$1 = var; print}' | awk '{print $1 $2}' ); do
						elem_local=$(cat skelhunter.list | grep $i | awk -v var="$mycol_new" -F $'\t' 'BEGIN {OFS = FS} {$2 = var; print}' | awk '{print $1 $2}' )
						elem_remot=$(cat skelhunter.llist | grep $i | awk -v var="$mycol_new" -F $'\t' 'BEGIN {OFS = FS} {$2 = var; print}' | awk '{print $1 $2}' )
						if [ "$sldiff" != "" ] 
							then
							echo -e "\n\t[INF]\tUpdating package $i"
							
							echo -e "\n\t[INF]\tRemoving old package"
							rm -rf "$i"
							
							echo -e "\n\t[INF]\tDownloading new package"
							wget "http://""$csrvip""/""$i"
							
							echo -e "\n\t[INF]\tUncompressing new package"
							tar -xvf "$i"
							
							echo -e "\n\t[INF]\tPackage $i is up to date!"
							else
							echo -e "\n\t[INF]\tPackage $i is already up to date, ignoring!"
						fi
							
					done
					
			
				else
					echo -e "\n\t[INF]\tSkelhunter client found nothing to update, cya!"
				fi


 
}
	
	
	case "$1" in
        init)
			init
			;;
			
        update)
            update
            ;;
         
        *)
            echo -e "\n\t[ERR]\tInvoke using $0 {init|update}\n"
            exit 1
 esac
 



