# eRuido IOT CloudTools
Friendly Cloud scripts  to sincronize your eRuido Noise Station to cloud services

This scripts are written for you to:

Upload eRuido Noise Monitoring Solution device data to a SQL server.
Upload Audio files to your web server or CDN. 
Included are examples for FTP and Azure Blob Storage

Upload you device Statistics to your cloud provider

In order to make the best use of these scripts you will need the following third party tools,

dBAMonitor R8or higher (get it at www.eruido.og)
  eRuido sonometric software properly configured.
  You can download from www.eruido.org. Please send
  Contact form. 

  It will run for 24 hours each time. Full featured.

  dBAMonitor R9 Release candidate 1
Is READY  for download. 

SQL Server Express with SQLCMD enabled
  Needed to store data captured by dBAMonitor in a local SQL server instance. 
It will act as local data buffer before sending noise measurements to the cloud.
Local data buffer can store 10 years of data
In a 256GB SSD Drive. And 100 years of audio clip
In a Single 1TB HDD. 
  
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

You can also try eRuido Cloud Tools. Send us an
eMail and we will send you a demo
License. 
