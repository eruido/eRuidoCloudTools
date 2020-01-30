Vitglobal.com

Plataforma eRuido 2020

Scripts de envio de archivos de audio a servidor FTP

Ejecutar 

curleruido_parameter_LOOP.bat

en el startup del sistema operativo

Problemas conocidos:
	No funciona con contraseñas ftp que incluyan caracteres especiales

Parametrizacion
	
En 
	curleruido_parameter_caller.bat	

Defina en la linea siguiente la carpeta de audios para enviar

	echo "Abriendo carpeta de audios para enviar"
	cd C:\dBAMonitor_prd\_AUDIOS\mp3

Luego en 
	curleruido_parameter.bat

	Defina los valores

		set localdir=C:\dBAMonitor_prd\_AUDIOS\mp3
		set ftphost=audio.ruido.net:2021
		set ftpuser=eruido_nnnn
		set ftppass=*****
		set ftpdir=mp3
		set sentdir=C:\dBAMonitor_prd\_AUDIOS\mp3\sent
