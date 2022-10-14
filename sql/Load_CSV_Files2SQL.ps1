try
{
    # Code fragment from
    # https://octopus.com/blog/sql-server-powershell
    # This is a simple user/pass connection string.
    # Feel free to substitute "Integrated Security=True" for system logins.
    $connString = "Data Source=SQLSERVER\EXPRESS;Database=DBAMONITOR;User ID=DBAMONITOR;Password=******"

    #Create a SQL connection object
    $conn = New-Object System.Data.SqlClient.SqlConnection $connString

    #Attempt to open the connection
    $conn.Open()
    if($conn.State -eq "Open")
    {
        # We have a successful connection here
        # Notify of successful connection
        Write-Host "Test connection successful"
        $conn.Close()
    }
    # We could not connect here
    # Notify connection was not in the "open" state
}
catch
{
    # We could not connect here
    # Notify there was an error connecting to the database
}





$Folder = './'

$curDir = Get-Location

#Lets make an Ingest folder where csv files will be placed for ingestion to sql server
mkdir Ingest

foreach($file in Get-ChildItem $curDir -Filter *.txt)
{

#convierte los txt en CSV


    $FileIn = $file.Basename + $file.Extension


    $FileOut= $FileIn.Replace( 'txt','csv')
    $FileOut = ".\ingest\" + $FileOut

    
#elimina la ultima fila ya que tiene un txto que genera dbamonitor

    $x = @(Get-Content -Path $FileIn)
    ($x[0..($x.Length - 2)]) | Out-File -FilePath $FileOut


    $FileSQL = $FileOut.Replace( 'csv','csv.sql')


#crea el archivo con el query sql

    New-item -Path . -Name $FileSQL -ItemType "file" -Value ""


    Add-Content $FileSQL "BULK INSERT DBAMONITOR.dbo.Datalogging FROM "
    Add-Content $FileSQL "'" -NoNewline 
    Add-Content $FileSQL $curDir -NoNewline 
    Add-Content $FileSQL "\\" -NoNewline 
    Add-Content $FileSQL $FileOut -NoNewline 
    Add-Content $FileSQL "'" 
    Add-Content $FileSQL "   WITH ( CODEPAGE = '65001'"
    Add-Content $FileSQL "  , DATAFILETYPE = 'char'"
    Add-Content $FileSQL "  , FIRSTROW = 5"
    Add-Content $FileSQL "  , FIELDTERMINATOR = ','"
    Add-Content $FileSQL "  , ROWTERMINATOR = '0x0a');"


#ejecuta el query sql

    Invoke-Sqlcmd -InputFile $FileSQL -ServerInstance "SQLSERVER\EXPRESS" -Database DBAMONITOR

}



    if($conn.State -eq "Open")
    {
        # We have a successful connection here
        # Notify of successful connection
        Write-Host "Cerrando conecciona base de datos"
        $conn.Close()
    }
