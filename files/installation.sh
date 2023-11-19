#!/bin/bash



#Fonction wait and see
function WaitEnter(){
  echo ""
  echo -e "Press enter ${Blue}ENTER${Normal} to continue"
  read
}


#Installation
function Installation() {

echo `clear`


	while true; do
		clear
		
		echo -e "${Blank}                                                                                  ${Normal}"
		echo -e "${Title}                              Installation                                        ${Normal}"
		echo -e "${Blank}                                                                                  ${Normal}"
		echo -e ""
		echo -e "     Press 1: Install CNV Analyser v1.0"
		echo -e ""
		echo -e "     Press R: Return back to menu"
		echo -e ""
		echo -e "${Blank}                                                                                  ${Normal}"
		echo "                             "
		echo -e "${Red}Enter your choice:${Normal}"
		read -p "" choice
		case "$choice" in
			1) Install
				;;
			"r"|"R") echo "Return back to menu";
		echo `clear`
			break;
			  ;;
				#If wrong choice, display wrong choice
			*) echo "Wrong choice"
		esac

	done

}



#Install CNV Analyser V1.0
function Install(){
  echo ""
  echo -e "Press enter ${Blue}ENTER${Normal} to continue"
  read
}