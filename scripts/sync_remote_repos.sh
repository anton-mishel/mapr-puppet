#!/bin/bash
CONF_FILE="/root/scripts/sync_remote_repos.conf"
exec 5<"${CONF_FILE}"
while read CONFLINE <&5 ;do
        [[ $CONFLINE = \#* ]] || [[ -z $CONFLINE ]] && continue #skip newlines and comments
        #split conf file 
	linearray=($CONFLINE)
        REMOTEREPO=${linearray[0]}
        LOCALREPO=${linearray[1]}
	#sync and update the repository
	echo "`date`---- syncing: ${REMOTEREPO} to: ${LOCALREPO} ----"
	reposync -r ${REMOTEREPO} -p ${LOCALREPO}
	createrepo --update ${LOCALREPO}
done
