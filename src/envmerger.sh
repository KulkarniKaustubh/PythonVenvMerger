#!/usr/bin/bash

check_absolute_path() {
	echo "Looking for the environments to be added..."

	for env in "$@"
	do
		if [ ${env:0:1} != '/' ]
		then
			echo "$env ====> not an absolute path"
			echo "Provide only absolute paths to your environment."
			exit
		fi
	done
}

check_valid_envs() {
	for env in "$@"
	do
		if [ ! -d $env ] || [ ! -f "$env/bin/activate" ]
		then
			echo "$env ====> does not exist/is not a virtual environment"
			exit
		fi
	done

	echo "Found environments!"
}

update_python_path() {
	echo "Adding packages..."

	for env in "$@"
	do
		python_version=`ls "$env/lib" | grep -i python3.`
		export PYTHONPATH="$env/lib/$python_version/site-packages:$PYTHONPATH"
		echo -e "Added `basename $env` -> $python_version packages to current venv"
	done
}

echo "You are in virtual environment ====> `basename $VIRTUAL_ENV`"
check_absolute_path $@
check_valid_envs $@
update_python_path $@
