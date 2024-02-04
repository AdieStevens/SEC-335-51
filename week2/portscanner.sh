#!/bin/bash

# I worked on this script off of one that was given to me adding certain enhancements throughout it with the help from StackOverflow and Chatgpt
# This defines a function that I named usage that will be called if there is an error in the script
#it prints a usage message and exits the script with a status of 1.
usage() {
  echo "Usage: $0 <hostfile> <portfile>"
  exit 1
}

# Check if the correct number of arguments is provided if not it will call the usage function and exit 
if [ "$#" -ne 2 ]; then
  echo "Error: Invalid number of arguments."
  usage
fi

#Assigning arguments to variables
#These lines assign the first and second command-line arguments to the variables
hostfile="$1"
portfile="$2"

# Check if the hostfile and portfile exist if not it will produce an error message
if [ ! -e "$hostfile" ] || [ ! -e "$portfile" ]; then
  echo "Error: Hostfile or portfile not found"
  usage
fi

#this line just prints the header for the csv output
echo "host,port"

# Loop through hosts and ports
# This for loop read each line from the hostfile and portfile, within the loops it uses netcat (nc)
# to attempt connection to the specified host and port if connection is successful it prints 
# If not successful the '2>/dev/nul' part redirects any error message from nc to /dev/null so
# We cannot see it in the output 
for host in $(cat "$hostfile"); do
  for port in $(cat "$portfile"); do   
 
    nc -z -w 1 "$host" "$port" 2>/dev/null && echo "$host,$port"
  done
done
       
