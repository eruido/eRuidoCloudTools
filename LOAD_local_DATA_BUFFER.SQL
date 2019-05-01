-- Call this script connected to your database server
-- dBAMonitor: Settings->Database->Config Connection to actually connect to database server.

-- Assumed your database is called ERUIDO.
-- Tables NPS2012, NPS2016 must be created
-- Tables can be created from dBAMonitor at 
-- Settings->Database->CreateTable, to create table.
-- Data being inserted into NPS2016 is transferred
-- to NPS2012. 
-- NPS2016 have no indexes. It works like an input buffer
-- with no extra processing. Just insert records into it.
-- NPS2012 table, gets data recordss from NPOS2016 input buffer
-- and theh applies indexing and optimizactions for fast access
-- then, it will start integrating diferent time lapses
-- producing LAEQ60, LEQ180, LEQ300, LEQ3600, Percentile,  or
-- whatever integration you may want to obtain.

USE ERUIDO
BEGIN TRANSACTION
	insert into NPS2012 select * from NPS2016
	delete from NPS2016
COMMIT
