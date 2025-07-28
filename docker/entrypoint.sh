#!/bin/bash

. activate habitat
cd code || exit
# Show the current directory
echo "Current directory: $(pwd)"

# Add falcon to Python path
export PYTHONPATH="$(pwd)/falcon:$PYTHONPATH"

# Install challenge specific habitat-lab
pip install -e habitat-lab
pip install -e habitat-baselines
pip install "numpy<2"
bash scripts/dgx/launch_training.sh
