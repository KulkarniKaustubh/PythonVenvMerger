#!/usr/bin/zsh

check_absolute_path() {
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
		# echo $env
		if [ ! -d $env ] || [ ! -f "$env/bin/activate" ]
		then
			echo "$env ====> does not exist/is not a virtual environment"
			exit
		fi
	done
}

echo "You are in virtual environment ====> `basename $VIRTUAL_ENV`"
echo "Looking for the environments to be added..."
check_absolute_path $@
check_valid_envs $@
echo "Found environments!"

# ABS_PATH="/home/kaustubh/Envs/cv_old/"
#
# # ABS_PATH=$1
#
# export PYTHONPATH=$ABS_PATH/lib/python3.8/site-packages:$PYTHONPATH
#
# echo -e "Added `basename $ABS_PATH` to current venv"
