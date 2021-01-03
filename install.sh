#!/usr/bin/bash

echo "Checking for the prerequisites..."

pwd=`pwd`

install() {
	sudo cp ./src/environment_merge_utility.sh /usr/local/bin/envmerger
	sudo chmod 755 /usr/local/bin/envmerger
}

add_alias() {
	shell=`basename $SHELL`
	shell_config=`echo "/home/$USER/."$shell"rc"`
	# echo "Adding alias to ====> $shell_config"
	if [[ ! -f $shell_config ]]
	then
		echo "$shell_config does not exist. Please add the alias given below to your shell config file."
		echo "alias envmerger=\"source envmerger\""
		echo "Stopping installation"
	else
		echo "alias envmerger=\"source envmerger\"" >> $shell_config
		eval $SHELL
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
		echo -e "Updating..."
		install
		echo -e "Succesfully updated."
	else
		echo "Stopping installation"
	fi
else
	echo -n "Do you wish to proceed with the installation of envmerger? [Y/n]: "
	read choice

	if [[ "$choice" == "Y" ]] || [[ "$choice" == "y" ]]
	then
		echo -e "Installing..."
		install
		echo -e "Succesfully installed."
		add_alias
	else
		echo "Stopping installation"
	fi
fi
