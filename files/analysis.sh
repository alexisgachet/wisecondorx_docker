#!/bin/bash


#Analysis
function Analysis() {

echo `clear`


	while true; do
		clear
		
		echo -e "${Blank}                                                                                  ${Normal}"
		echo -e "${Title}                              Analysis                                            ${Normal}"
		echo -e "${Blank}                                                                                  ${Normal}"
		echo -e ""
		echo -e "     Press 1: Local analysis"
		echo -e ""
		echo -e "     Press R: Return back to menu"
		echo -e ""
		echo -e "${Blank}                                                                                  ${Normal}"
		echo "                             "
		echo -e "${Red}Enter your choice:${Normal}"
		read -p "" choice
		case "$choice" in
			1) LocalA
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


#Clean the results
function Cleanr() {
	
	# to remove if not working
	rm -rf /home/serviceengineer/menucnv/results/*
	echo "Folders cleaned"
}

#Conversion
function Conversion() {

	# Rename files in /home/serviceengineer/menucnv/bam_input
	cd /home/serviceengineer/menucnv/bam_input
	rename 's/AlignmentResults_//' *
	

	cd /home/serviceengineer/menucnv
	parallel -j 4 ./wisecondor_convert_multi-par ::: bam_input/*.bam
}

#Predict
function Predict() {
	
	# Use 'parallel' to run a command in parallel on multiple files
	cd /home/serviceengineer/menucnv
	parallel -j 4 --verbose ./wisecondor_predict_multi-par ::: npz_output/*.npz
	
}



#Clean the folders
function Cleanf() {
	
	# to remove if not working
	rm -rf /home/serviceengineer/menucnv/bam_input/*
	rm -rf /home/serviceengineer/menucnv/npz_output/*
	#echo "Folders cleaned"
}

#Local analysis
function LocalA() {
	
	clear
	Cleanr
	Conversion
	Predict
	Cleanf
	clear
	echo "Analyse finished"
	WaitEnter
}