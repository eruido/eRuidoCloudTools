set localdir=d:\ERUIDO\AUDIO\mp3
set ftphost=ftpserver:port
set ftpuser=ftpusername
set ftppass=ftppass
set ftpdir=mp3
set sentdir=d:\ERUIDO\AUDIO\mp3\sent

setlocal enableDelayedExpansion

  set FILENAME=%1%

	echo %1%

  curl  ftp://%ftphost%/%ftpdir%/ --user "%ftpuser%:%ftppass%" -T %1% 

	IF %ERRORLEVEL% NEQ 0 goto :abajo
	move %localdir%\!FILENAME! %sentdir%\!FILENAME!


:abajo


TIMEOUT /T 1
