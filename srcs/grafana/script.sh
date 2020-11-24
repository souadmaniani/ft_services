
if [[ $(ps | grep -v "grep" | grep -c "grafana") == 0 ]]
then
        exit 1
else
        exit 0
fi