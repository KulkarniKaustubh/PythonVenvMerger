#!/usr/bin/bash

echo "Checking for the prerequisites..."

pwd=`pwd`

install() {
	echo "Installing..."
	sudo cp ./src/environment_merge_utility.sh /usr/local/bin/envmerger
	sudo chmod 755 /usr/local/bin/envmerger
	shell=`basename $SHELL`
	shell_config=`echo "/home/$USER/."$shell"rc"`
	echo "Adding alias to ====> $shell_config"
	if [[ -f $shell_config ]]
	then
		echo "Please restart your shell to complete installation."
		echo "Once you restart, you can call envmerger -h to see the help menu."
	else
		echo "$shell_config does not exist. Please add the alias given below to your shell config file."
		echo "alias envmerger=\"source envmerger\""
		echo "Stopping installation"
	fi
}

if [[ ! -d "$pwd/src" ]] || [[ ! -f "$pwd/src/environment_merge_utility.sh" ]]
then
	echo -e "Please check if the repo has been cloned correctly and try again."
	return
fi

if [[ -f "/usr/local/bin/envmerger" ]]
then
	echo -n "You are re-installing/updating envmerger. Do you wish to proceed? [Y/n]: "
	read choice

	if [[ "$choice" == "Y" ]] || [[ "$choice" == "y" ]]
	then
		install
	else
		echo "Stopping installation"
	fi
else
	echo -n "Do you wish to proceed with the installation of envmerger? [Y/n]: "
	read choice

	if [[ "$choice" == "Y" ]] || [[ "$choice" == "y" ]]
	then
		install
		echo "alias envmerger=\"source envmerger\"" >> $shell_config
	else
		echo "Stopping installation"
	fi
fi
