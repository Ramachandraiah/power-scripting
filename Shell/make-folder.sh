#!/bin/bash
###############################################################################################
# Date : 28th May 2016                                                                        #
# Author : Ramachandraiah Nikadi                                                              #
# Languge : Shell Scripting                                                                   #
# Script name : make-folder.sh                                                                #
# Description : Creates a given folder in the list of sub folders in the given base directory #
# usage : ./make-folder.sh <base_directory> <new_directory>                                   #
###############################################################################################

# Check for number of input parameters and exit if they are not equals to 2
# Also Provide some usage information 
if [ $# != 2 ]
then
	echo "INFO :: Please provide correct number of arguments"
	echo "INFO :: usage : ./make-folder.sh <base_directory> <new_directory>"
	exit 1
fi

# Getting folder names from the command line arguments
base_directory=$1
new_directory=$2
echo "Given base directory: \"$base_directory\""
echo "Given new directory: \"$new_directory\""

#Fidn the directories in the base directory and create new folder in each of them, only if they did't exists already.
# maxdepth option limits the depth of the file search
# http://askubuntu.com/questions/266179/how-to-exclude-ignore-hidden-files-and-directories-in-a-wildcard-embedded-find
# find . \( ! -regex '.*/\..*' \) -type f -name "whatever", works. The regex looks for "anything, then a slash, then a dot, then anything" (i.e. all hidden files and folders including their subfolders), and the "!" negates the regex.

for D in `find $base_directory -maxdepth 1 -mindepth 1 \( ! -regex '.*/\..*' \) -type d`
do
	new_folder_full_path=$D/$new_directory
	if [ -d $new_folder_full_path ]
	then 
		echo "INFO :: folder \"$new_folder_full_path\" already exists"
	else
		echo "INFO :: folder \"$new_folder_full_path\" does't exists, Hence Creating"
		mkdir $new_folder_full_path
	fi
done 


