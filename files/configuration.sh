#!/bin/bash


#Configuration
function Configuration() {

echo `clear`


	while true; do
		clear
		
		echo -e "${Blank}                                                                                  ${Normal}"
		echo -e "${Title}                              Configuration                                       ${Normal}"
		echo -e "${Blank}                                                                                  ${Normal}"
		echo -e ""
		echo -e "     Press 1: Set the network CNV data folder path "
		echo -e "     Press 2: Display the network CNV data folder path "
		echo -e ""
		echo -e "     Press R: Return back to menu"
		echo -e ""
		echo -e "${Blank}                                                                                  ${Normal}"
		echo "                             "
		echo -e "${Red}Enter your choice:${Normal}"
		read -p "" choice
		case "$choice" in
			1) cnvpath
				;;
			2) displaycnvpath
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

#1

#Store the CNV folder path

function cnvpath() {

	# Define the path where the "cnvpath.csv" file will be created
	output_directory="/home/serviceengineer/menucnv"

	# Ensure the specified directory exists
	if [ ! -d "$output_directory" ]; then
	  mkdir -p "$output_directory"
	fi

	# Prompt the user to enter the CNV folder path
	echo "Enter the path for the CNV folder:"
	read cnv_path

	# Create the "cnvpath.csv" file and save the path in cell A1
	echo "$cnv_path" > "$output_directory/cnvpath.csv"

	echo "Path saved to $output_directory/cnvpath.csv in cell A1."
	displaycnvpath

}



#Display CNV path

function displaycnvpath() {

	# Define the path to the "cnvpath.csv" file
	csv_file="/home/serviceengineer/menucnv/cnvpath.csv"

	# Check if the file exists
	if [ -f "$csv_file" ]; then
	  # Display the content of cell A1
	  content=$(awk -F',' 'NR==1 {print $1}' "$csv_file")
	  
	  if [ -n "$content" ]; then
		echo "Path recorded is:"
		echo "$content"
	  else
		echo "Cell A1 is empty in $csv_file."
	  fi
	else
	  echo "File not found: $csv_file"
	fi
WaitEnter
}