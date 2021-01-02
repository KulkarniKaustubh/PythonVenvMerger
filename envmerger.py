#!/usr/bin/env python3.

import os
import sys
import subprocess

def get_shell_output(command, inp=''):
	out = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
	output, error = out.communicate()
	if error:
		return error.decode()
	else:
		return output.decode()

def is_valid_venvs(envs):
	not_invalid = True

	for env in envs:
		if not os.path.isfile(f'{env}/bin/activate'):
			not_invalid = False
			print(f'\"{env}\"  ====> does not exist/is not a virtual environment')

	return not_invalid

def check_in_venv():
	try:
		curr_env = os.environ['VIRTUAL_ENV']
		return str(curr_env.split('/')[-1])
	except:
		print("You are not in a virtual environment. Please enter a virtual environment and retry.")
		exit()

def add_venvs(envs):
	# export PYTHONPATH=Envs/test/lib/python3.8/site-packages:$PYTHONPATH

	try:
		python_path = os.environ['PYTHONPATH']
	except:
		os.environ['PYTHONPATH'] = ''

	for env in envs:
		os.environ['PYTHONPATH'] += f'{env}/lib/python3.8/site-packages:'

	return

def main(argv):
	envs = argv

	print(f'Your are in the virtual environment named ==> {check_in_venv()}')

	print("Looking for the specified environments...")

	if is_valid_venvs(envs):
		print("Found environments!")
		print("Adding all environment packages...")
		add_venvs(envs)
	else:
		print("Correct the paths to the environments and retry.")
		exit()

if __name__ == '__main__':
	main(sys.argv[1:])
