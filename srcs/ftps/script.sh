# grafana
if [[ $(ps | grep -v "grep" | grep -c "pure-ftpd") == 0 ]]
then
        exit 1
else
        exit 0
fi