#!/bin/bash

echo "Starting training script for Falcon..."
# ******************* Setup dirs *************************************************
export CONFIG="social_nav_v2/falcon_hm3d_train.yaml"
export EXP_NAME="falcon_with_RGBD_DGX"
export TENSORBOARD_DIR="data/checkpoints/falcon/hm3d/$EXP_NAME/tensorboard"
export VIDEO_DIR="data/checkpoints/falcon/hm3d/$EXP_NAME/videos"
export CHECKPOINT_FOLDER="data/checkpoints/falcon/hm3d/$EXP_NAME/checkpoints"

mkdir -p "$TENSORBOARD_DIR"
mkdir -p "$VIDEO_DIR"
mkdir -p "$CHECKPOINT_FOLDER"
# ******************* Setup number of cpus and gpus *******************************
NUM_CPUS=$(nproc)
NGPU_PER_NODE=$(nvidia-smi -L | wc -l)
NHOSTS=1

# ******************* Export variables ********************************************
export CONFIG
export GLOG_minloglevel=2
export MAGNUM_LOG=quiet
export HABITAT_SIM_LOG=quiet
export HYDRA_FULL_ERROR=1
export NGPU_PER_NODE
export OMP_NUM_THREADS=$((NUM_CPUS/NGPU_PER_NODE))

# ******************* Run the training script *******************************
echo "Getting number of cpus and cpus per node..."
echo "NUM_CPUS: $NUM_CPUS", "NGPU_PER_NODE: $NGPU_PER_NODE", "CPUS PER GPU: $OMP_NUM_THREADS"


torchrun --nnodes="${NHOSTS}" \
  --nproc_per_node="${NGPU_PER_NODE}" \
  --max_restarts 3 \
    habitat-baselines/habitat_baselines/run.py \
    --config-name="$CONFIG" \
    habitat_baselines.num_environments=36 \
    habitat_baselines.wb.run_name="$EXP_NAME" \
    habitat_baselines.tensorboard_dir="$TENSORBOARD_DIR" \
    habitat_baselines.video_dir="$VIDEO_DIR" \
    habitat_baselines.checkpoint_folder="$CHECKPOINT_FOLDER" \
    habitat_baselines.load_resume_state_config=True
