# eRuidoCloudTools
Friendly Cloud scripts  to sincronize your eRuido Noise Station to cloud services

This scripts are writtem for you to:

Upload eRuido Noise Monitoring Solution device data to a SQL server.
Upload Audio files to your web server or CDN. 
Included are examples for FTP and Azure Blob Storage

Upload you device Statistics to your cloud provider

iN ORDER TO TAKE ADVANTAGE OF these scripts you will nedd the following third party tools,

dBAMonitor R8or higher (get it at www.eruido.og)
  eRuido sonometric software properly configured. (Not a database admin tool)
  You can download from www.eruido.org. It will run for 24 hours each time. Full featured.

SQL Server Express with SQLCMD enabled
  Needed to store data captured by dBAMonitor in a local SQL server instance. It will actas a data buffer before sending noise measurements to the cloud.
  
Notepadd++ or text editor
  Usefull to edit some configuration files
  
WinSCP FTP Command line
  Needed to run Audio file upload scripts. Send your files to your web server automatically via FTP.
  
AZCopy
  Microsoft Azure copy utility to send your audios to your blob storage account

FFMPEG Comand line executable
  FFMPeg is an open source package wich will allow our scripts to compress .WAV files captured by dBAMonitor into a lighter format like ogg, acc, flac or mp3.
  
  
