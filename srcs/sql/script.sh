if [[ $(ps | grep -v "grep" | grep -c "mysqld") == 0 ]]
then
        exit 1
else
        exit 0
fi