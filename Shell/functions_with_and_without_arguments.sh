#!/bin/bash
###############################################################################################
# Date : 29th May 2016                                                                        #
# Author : Ramachandraiah Nikadi                                                              #
# Languge : Shell Scripting                                                                   #
# Script name : functions_with_and_without_arguments.sh                                       #
# Description :	This script demonstrates how to create functions, call with & without parameters # 
# usage :                                    #
###############################################################################################

hello () {
 echo "Hello, Guest!"
 return "Guest!"
}

hello_with_parms () {
 echo "Hello $1 $2"
 return "$1"
}

hello
hello_with_parms Ram Nikadi


info () {
   echo "INFO :: `date` :: $*" 
}

error () {
   echo "ERROR :: `date` :: $1"
}

info This is a error message
echo "Return message from info function : $?"
error "ERRihdpofd[dpf"
echo "Return message from error function : $?"

