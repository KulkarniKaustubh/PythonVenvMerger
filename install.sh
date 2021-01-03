#!/usr/bin/bash

echo "Checking for the prerequisites..."

pwd=`pwd`
echo $pwd

if [[ ! -d "$pwd/src" ]] || [[ ! -f "$pwd/src/environment_merge_utility.sh" ]]
then
	echo -e "Please check if the repo has been cloned correctly and try again."
	return
fi

echo -n "Do you wish to proceed with installation? [Y/n]: "
read choice

if [[ "$choice" == "Y" ]] || [[ "$choice" == "y" ]]
then
	echo "Installing..."
	sudo cp ./src/environment_merge_utility.sh /usr/local/bin/envmerger
	sudo chmod 755 /usr/local/bin/envmerger
	shell=`basename $SHELL`
	shell_config=`echo "/home/$USER/."$shell"rc"`
	echo "Adding alias to ====> $shell_config"
	if [[ -f $shell_config ]]
	then
		echo "alias envmerger=\"source envmerger\"" >> $shell_config
		echo "Please restart your shell to complete installation."
		echo "Once you restart, you can call envmerger -h to see the help menu."
	else
		echo "$shell_config does not exist. Please add the alias given below to your shell config file."
		echo "alias envmerger=\"source envmerger\""
		echo "Stopping installation"
	fi
else
	echo "Stopping installation"
fi