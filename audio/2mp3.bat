ffmpeg -i %1 -vn -ar 48000 -ac 2 -ab 192k -f mp3 %2 >wav2mp3.log


move %2  ./mp3/%~2
del %1  
