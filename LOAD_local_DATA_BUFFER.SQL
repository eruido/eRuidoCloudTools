--Assumed your local sql server database is named ERUIDO

USE ERUIDO
BEGIN TRANSACTION
	insert into NPS2012 select * from NPS2016
	delete from NPS2016
COMMIT
