
declare @maxtid_cloud as datetime
declare @maxtid_local as datetime


 select @maxtid_cloud= MAX(TIMEID_BIN)
 FROM  [<sql server, port>].[<my eruido id>].[dbo].[NPS2012]

 select @maxtid_local= MAX(TIMEID_BIN)
 FROM [<my eruido id>].[dbo].[NPS2012]


print "Max Record Time Cloud : "  
print @maxtid_cloud

print "Max record Time Time Local : " 
print @maxtid_local
