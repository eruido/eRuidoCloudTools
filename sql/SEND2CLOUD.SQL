declare @maxmax as datetime
declare @maxtid as datetime
declare @maxtid_2 as datetime


 select @maxtid= MAX(TIMEID_BIN)

 FROM  [<sql server, port>].[<my eruido id>].[dbo].[NPS2012]

 select @maxtid_2= MAX(TIMEID_BIN)
 FROM  [<sql server, port>].[<my eruido id>].[dbo].[NPS2016]

IF (@maxtid IS NULL AND @maxtid_2 IS NULL )
    SELECT @maxmax='2018-10-01T00:00:00';
ELSE
IF (@maxtid IS NULL AND @maxtid_2 IS NOT NULL )
    SELECT @maxmax=@maxtid_2;
ELSE
IF (@maxtid IS NOT NULL AND @maxtid_2 IS NULL )
    SELECT @maxmax=@maxtid;
ELSE
IF (@maxtid >@maxtid_2 )
    SELECT @maxmax=@maxtid;
ELSE 
IF (@maxtid <=@maxtid_2 )
    SELECT @maxmax=@maxtid_2;


INSERT INTO [<sql server, port>].[<my eruido id>].[dbo].[NPS2016]
           ([TIMEID]
           ,[UNIDAD]
           ,[NPS]
           ,[CLIPPING]
           ,[NPS_BIN]
           ,[TIMEID_BIN]
           ,[NPS_CORREGIDO_DISTANCIA]
           ,[LEQ60]
           ,[LEQ60CLIPPING]
           ,[LEQ300]
           ,[LMAX]
           ,[LEQ180])

SELECT TOP (1000) *
  FROM [<my eruido id>].[dbo].[NPS2012]
  WHERE TIMEID_BIN>@maxmax
  order by TIMEID_BIN ASC


'We move detail data to indexed table asyncronously
EXEC	[<sql server, port>].[<my eruido id>].[dbo].[Load_NPS2012] @Unidad = '<my eruido id>'

'Now we make Leq pre calculations
EXEC	[<sql server, port>].[<my eruido id>].[dbo].[CARGA_LEQ60D38]

'Finally we populate waves table with new wavs arrived
EXEC	[<sql server, port>].[<my eruido id>].[dbo].[Carga_Waves]
