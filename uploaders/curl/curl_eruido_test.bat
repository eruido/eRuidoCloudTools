set localdir=./
set ftphost=ftpserver:port
set ftpuser=ftpusername
set ftppass=ftppass
set ftpdir=mp3
set sentdir=./sent

setlocal enableDelayedExpansion

  set FILENAME=%1%

	echo %1%

  curl  ftp://%ftphost%/%ftpdir%/ --user "%ftpuser%:%ftppass%" -T "readme.txt" 

	IF %ERRORLEVEL% NEQ 0 goto :abajo
	move %localdir%\!FILENAME! %sentdir%\!FILENAME!


:abajo

curl -k -T "readme.txt" --ftp-ssl --ftp-pasv -u "%ftpuser%:%ftppass%" ftp://%ftphost%/

curl -k -T "readme.txt" --ftp-ssl --ftp-pasv -u "%ftpuser%:%ftppass%" ftp://%ftphost%/%ftpdir%/

TIMEOUT /T 1
