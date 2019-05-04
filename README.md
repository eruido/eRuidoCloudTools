# eRuido IOT CloudTools
Friendly Devops Cloud scripts  to sincronize your eRuido Noise Station to cloud services

This scripts are written for you to:

Upload eRuido Noise Monitoring Solution device data to a SQL server.
Upload Audio files to your web server or CDN. 
Included are examples for FTP and Azure Blob Storage

Upload you device Statistics to your cloud provider

In order to make the best use of these scripts you will need the following third party tools,

dBAMonitor R8 or higher (get it at www.eruido.og)
  eRuido sonometric software properly configured. 
  You can download from www.eruido.org. 
It will run for 24 hours each time. Full featured.

  dBAMonitor R9 Release candidate 1
Is READY  for Download. 

Please have installed 
SQL Server Express
SSMS Sql server managment studio. 
Open and Connect SSMS to you local 
Sql server instance. 
And create a database for eRuido. 
Name it ERUIDO. 

Open dBAMonitor, eait it to start
Measuring and Stop it. 
Go to Settings/Database and 
click Config. Set values for your Database
Connection.

Click on Create Table. A new 
table called NPS2012 will be
created in your database ERUIDO. 

We will store data captured by 
dBAMonitor in our local SQL 
server instance

To send our local database data
to cloud server We will use a tool called 
SQLCMD to run SQL scripts that 
do the magic. And to host 
SQLCMD we will use simple .BAT 
Windows files.

Your database will act as local 
data buffer. 

And from there we will be sending
 noise measurements to the cloud.

Send2cloud.sql holds the T-SQL
Sentence to keep local data sincronized
To the cloud. 

It will check timestamps and send
only newer data to public cloud database 
server. 

It is necessary to create a linked server
Under server objects, in SSMS pointing 
to your real cloud sql server.

Linked server names are CASE Sensitive

Finally you have to go through sql 
Files 
send2cloud. Sql, 
load_nps. Sql
Load_local_leq60. Sql

And replace your real values for
[linked server, port] 
    Your linked server dns name and port. 
[local pc name.] 
     Your local pc name as it shows at
     Server Properties in SSMS. 

Notepadd++ or text editor
  Usefull to edit some configuration files
  
WinSCP FTP Command line
  Needed to run Audio file upload scripts. Send your files to your web server automatically via FTP.
  
AZCopy
  Microsoft Azure copy utility to send your audios to your blob storage account

FFMPEG Comand line executable
  FFMPeg is an open source package wich will allow you to compress .WAV files captured by dBAMonitor into a lighter format like ogg, acc, flac or mp3.
  
Backup and FTP, to 
Backup database and send to cloud server. 


Data can be sent to any cloud provider, please consider
Using our service and hrlp us grow our solutions
to help make a quieter planet! 

Stay tunned! 
