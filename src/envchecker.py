#!/usr/bin/env python3.

import os
import sys
import shlex
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
			continue

		if env[0]!='/':
			not_invalid = False
			print(f'\"{env}\"  ====> is not an absolute path')
			continue

	return not_invalid

def check_in_venv():
	try:
		curr_env = os.environ['VIRTUAL_ENV']
		return str(curr_env.split('/')[-1])
	except:
		print("You are not in a virtual environment. Please enter a virtual environment and retry.")
		exit()

# def add_venvs(envs):
# 	# export PYTHONPATH=Envs/test/lib/python3.8/site-packages:$PYTHONPATH
#
# 	# try:
# 	# 	python_path = os.environ['PYTHONPATH']
# 	# except:
# 	# 	os.environ['PYTHONPATH'] = ''
# 	#
# 	# for env in envs:
# 	# 	os.environ['PYTHONPATH'] += f'{env}/lib/python3.8/site-packages:'
# 	#
# 	# print(os.environ['PYTHONPATH'])
#
# 	# command = shlex.split("env -i bash -c 'source init_env && env'")
# 	# proc = subprocess.Popen(command, stdout=subprocess.PIPE)
# 	# for line in proc.stdout:
# 	# 	(key, _, value) = line.partition("=")
# 	# 	os.environ[key] = value
# 	# proc.communicate()
#
# 	# /home/kaustubh/Stuff/PythonVenvMerger/src/change_env_var.sh
#
# 	for env in envs:
# 		print(env)
# 		# exec(open('change_env_var.sh').read())
# 		# out = get_shell_output(['source', 'changevar.sh', f'{env}'])
# 		# file = "change_env_var.sh"
# 		# exec(compile(open(file).read(), file, 'exec'))
# 		# subprocess.call(['source', 'changevar.sh', f'{env}'])
# 		# exec(f'changevar.sh {env}')
# 		# os.execl("/bin/bash", "-c", "source changevar.sh")
# 		# print(out)
#
# 	return

def main(argv):
	envs = argv

	print(f'You are in the virtual environment named ====> {check_in_venv()}')

	print("Looking for the specified environments...")

	if is_valid_venvs(envs):
		print("Found environments!")
		# print("Adding all environment packages...")
		# add_venvs(envs)
	else:
		print("Enter the absolute path to the virtual environment OR correct the paths to the environments and retry.")
		exit()

if __name__ == '__main__':
	main(sys.argv[1:])
