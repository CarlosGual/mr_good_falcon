RoboSense 2025 – Social Navigation (Track 2)
:sparkles: Overview

This repository is based on Falcon
, a reinforcement learning framework for socially-aware navigation.

Our main modification is the addition of an RGB camera to the original depth-only setup, aiming to enrich perception and improve navigation performance in crowded environments.

:hammer_and_wrench: Requirements

To reproduce our results, you will need:

Habitat-Sim
 (v0.3.1 with Bullet and headless support)

Habitat-Lab

The Social-HM3D and Social-MP3D datasets provided by the organizers

:arrow_forward: Evaluation

After installing dependencies and downloading the datasets, you can evaluate the model with:

python -u -m habitat-baselines.habitat_baselines.run \
--config-name=social_nav_v2/falcon_rgbd_<dataset>.yaml


Example for Social-HM3D:

python -u -m habitat-baselines.habitat_baselines.run \
--config-name=social_nav_v2/falcon_rgbd_hm3d.yaml

:rocket: Training

To retrain the agent with the added RGB camera:

python -u -m habitat-baselines.habitat_baselines.run \
--config-name=social_nav_v2/falcon_rgbd_hm3d_train.yaml

:pray: Acknowledgments

This work builds upon the original Falcon repository:
https://github.com/Zeying-Gong/Falcon
