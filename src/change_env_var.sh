#!/usr/bin/bash

ABS_PATH="/home/kaustubh/Envs/cv_old/"

# ABS_PATH=$1

export PYTHONPATH=$ABS_PATH/lib/python3.8/site-packages:$PYTHONPATH

echo -e "Added `basename $ABS_PATH` to current venv"
