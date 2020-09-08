rem Delete old audio  files
rem Older than 45 days will be deleted

f:
cd eruido/_audios

forfiles /p "F:\eruido/_audios/wavs/processed" /S /m *.wav /c "cmd /c if @isdir==FALSE echo del @file &  del @file" /d -45
forfiles /p "F:\eruido/_audios/mp3/sent/" /S /m *.mp3 /c "cmd /c if @isdir==FALSE echo del @file &  del @file" /d -45


