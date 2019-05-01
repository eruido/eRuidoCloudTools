DECLARE	@return_value int

EXEC	@return_value = [ERUIDO].[dbo].[Carga_LEQ60D38]

SELECT	'Return Value' = @return_value
