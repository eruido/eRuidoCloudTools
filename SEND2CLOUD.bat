print "eRuido Cloud Connector"
print "Starting in 120 seconds"
TIMEOUT /T 60
print "Starting in 60 seconds"
TIMEOUT /T 50
print "Starting in 10 seconds"
TIMEOUT /T 10
print "Starting now"

:next

	sqlcmd -S MY_MSSQLSERVEREXPRESS_SERVER_NAME -i LOAD_local_DATA_BUFFER.SQL

	sqlcmd -S MY_MSSQLSERVEREXPRESS_SERVER_NAME -i send2cloud.sql

	sqlcmd -S MY_MSSQLSERVEREXPRESS_SERVER_NAME -i LOAD_local_LEQ60.sql

	sqlcmd -S MY_MSSQLSERVEREXPRESS_SERVER_NAME -i Send2Cloud_Stats.sql

	TIMEOUT /T 1

	
goto next
