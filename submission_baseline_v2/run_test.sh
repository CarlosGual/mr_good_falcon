#!/bin/bash
set -e

# 初始化 Conda
source /opt/conda/etc/profile.d/conda.sh

# 激活 Conda 环境
conda activate falcon

# Go back to main Falcon folder
cd app/Falcon
echo "Current directory: $(pwd)"

# 设置 PYTHONPATH（确保 habitat_baselines 可import）
export PYTHONPATH=$(pwd)

# 运行主脚本
python -u -m habitat-baselines.habitat_baselines.eval --config-name=falcon_hm3d_minival.yaml
