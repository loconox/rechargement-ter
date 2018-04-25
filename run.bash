#!/bin/bash

URL="https://www.ter.ritmx.sncf.com/ter/html/MVC/index.jsp?choixTypeSupport=0&modeIntegre=1&region=07"
EXE_FILENAME="setup-rechargement-SNCF-TER-v1_10-x32.exe"
EXE_URL="https://www.ter.ritmx.sncf.com/cache/installer/$EXE_FILENAME"
JAR_FILENAME="app/app/clientDomter-jfx.jar"

function dependenciesCheck() {
	# curl
	if command -v curl >/dev/null 2>&1 ; then
	    printf "curl \e[32mfound\e[0m\n"
	else
	    printf "curl \e[31mnot found\e[0m\n"
	    echo "Please install curl yourself"
		exit 1
	fi
	
	# java
	if command -v java >/dev/null 2>&1 ; then
	    printf "java \e[32mfound\e[0m\n"
	else
	    printf "java \e[31mnot found\e[0m\n"
		echo "Please install java yourself"
		exit 1
	fi
	
	# innoextract
	if command -v innoextract >/dev/null 2>&1 ; then
	    printf "innoextract \e[32mfound\e[0m\n"
	else
	    printf "innoextract \e[31mnot found\e[0m\n"
		echo "Please install innoextract yourself"
		exit 1
	fi
}

echo "Dependencies check ..."
dependenciesCheck

echo -e "\nDownloading .exe app from website ..."
curl -O $EXE_URL
if [ $? -gt 0 ]; then
	printf "Download \e[31mfailed\e[0m\n"
	exit 1
fi

echo -e "\nExtracting .exe assets ..."
innoextract $EXE_FILENAME
if [ $? -gt 0 ]; then
	printf "Application extraction \e[31mfailed\e[0m\n"
	exit 1
fi

echo -e "\nRun the application ..."
java -jar $JAR_FILENAME
if [ $? -gt 0 ]; then
	printf "Application launch \e[31mfailed\e[0m\n"
	exit 1
fi