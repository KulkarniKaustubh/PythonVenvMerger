#!/usr/bin/bash

helper() {
	if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]
	then
		echo -e "\tOPTIONS:"
		echo -e "\t-h, --help --> Brings up this menu"
		echo -e "\n\tUSAGE: envmerger [ENVS] OR envmerger [OPTIONS]"
		echo -e "\t\tENVS --> Absolute paths to the environments you want to add"
		valid=0
	else
		valid=1
	fi
}

check_absolute_path() {
	for env in "$@"
	do
		if [[ ${env:0:1} != '/' ]]
		then
			echo "$env ====> not an absolute path. Provide only absolute paths to your environment."
			valid=0
			return
		fi
	done
	valid=1
}

check_valid_envs() {
	for env in "$@"
	do
		if [[ ! -d $env ]] || [[ ! -f "$env/bin/activate" ]]
		then
			echo "$env ====> does not exist/is not a virtual environment"
			valid=0
			return
		fi
	done
	valid=1
}

update_python_path() {
	for env in "$@"
	do
		python_version=`ls "$env/lib" | grep -i python3.`
		export PYTHONPATH="$env/lib/$python_version/site-packages:$PYTHONPATH"
		echo -e "Added `basename $env` -> $python_version packages to current venv"
	done
	echo -e "\n"
}

helper $@

if [[ $valid == 1 ]]
then
	echo -e "You are in virtual environment ====> `basename $VIRTUAL_ENV`\n"
	echo "Looking for the environments to be added..."

	check_absolute_path $@
else
	return
fi

if [[ $valid == 1 ]]
then
	check_valid_envs $@
else
	return
fi

if [[ $valid == 1 ]]
then
	echo "Found environments!"
	echo "Adding packages...\n"

	update_python_path $@
else
	return
fi