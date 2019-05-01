TIMEOUT /T 180

:LABEL1

D:
CD D:\ERUIDO\ERUIDO_AUDIOS

forfiles /m *.wav   /C  "CMD /c 2mp3.bat @file @fname.mp3"


TIMEOUT /T 15

GOTO :LABEL1
