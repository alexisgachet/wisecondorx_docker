#!/bin/bash

#statements
. color.sh
. readme.sh
. installation.sh
. configuration.sh
. analysis.sh



echo `clear`


while true; do
	clear
	
	echo -e "${Blank}                                                                                  ${Normal}"
	echo -e "${Title}                              Yourgene-Health                                     ${Normal}"
	echo -e "${Title}                              CNV Analyser v1.0                                   ${Normal}"
	echo -e "${Title}                              By WisecondorX                                      ${Normal}"
	echo -e "${Blank}                                                                                  ${Normal}"
	echo -e ""
	echo -e "     Press 1: ReadMe"
	echo -e "     Press 2: Installation"
	echo -e "     Press 3: Configuration"
	echo -e "     Press 4: CNV analysis"
	echo -e ""
	echo -e "     Press Q: Quit"
	echo -e ""
	echo -e "${Blank}                                                                                  ${Normal}"
	echo "                             "
	echo -e "${Red}Enter your choice:${Normal}"
	read -p "" choice
	case "$choice" in
		1) ReadMe
			;;
		2) Installation
			;;
		3) Configuration
			;;
		4) Analysis
			;;
		"q"|"Q") echo "Have a good day see you soon ...";
		WaitEnter
    echo `clear`
		break;
		  ;;
			#If wrong choice, display wrong choice
		*) echo "Wrong choice"
	esac

done
