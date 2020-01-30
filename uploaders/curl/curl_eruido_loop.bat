c:


:start1

ECHO "Iniciando envio de audio a ftp server usando curl"

TIMEOUT /T 10
cd c:\ERUIDO\AUDIO\mp3


forfiles /p "." /m *.mp3  /c "CMD /c c:\ERUIDO\audio\eruido_curl/curleruido_parameter.bat  @file"
IF %ERRORLEVEL% NEQ 0 goto :START1


goto :start1


