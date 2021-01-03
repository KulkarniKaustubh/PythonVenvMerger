#!/usr/bin/bash

if [[ ! -f "/usr/local/bin/envmerger" ]]
then
	echo "No installation found."
else
	sudo rm /usr/local/bin/envmerger

	shell=`basename $SHELL`
	shell_config=`echo "/home/$USER/."$shell"rc"`

	if [[ -f $shell_config ]]
	then
		# sed -i 's/alias envmerger=.*//' $shell_config
		sed -i '/alias envmerger=.*/d' $shell_config
	else
		echo -e "Make sure to remove the alias in your ~/.`basename $SHELL`rc file!"
	fi

	echo "Succesfully uninstalled."
fi
