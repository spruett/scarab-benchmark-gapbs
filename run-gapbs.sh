#!/usr/bin/bash

# Scarab Variables
scarab=""     # Path to REPO_ROOT of Scarab Repository
checkpoint="" # Path to location you would like checkpoints to end up 

# Set up environment
cwd=`pwd`
cd ${scarab}/bin
gapbs_program_descriptor=${cwd}/program_descriptor.def

# Checkpoint Name
suite="gapbs"
input="g24_nMIX2_SERIAL_min_taken_brs"
os_version=`uname -r`
checkpoint_name="${suite}__${input}__${os_version}"
checkpoint_output_path="${checkpoint}/${checkpoint_name}"

python3 ./checkpoint/create_checkpoints.py -o ${checkpoint_output_path} -d ${gapbs_program_descriptor}  -f #-ckpt -desc
