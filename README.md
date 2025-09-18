 <div align="center">
  <h1>RoboSense 2025 – Social Navigation (Track 2)</h1>
  <h3>
    Team Contribution: Adding RGB to Depth-only Setup (RGB-D)
  </h3>

  <p>
    <a href="https://github.com/Zeying-Gong/Falcon">Base Project (Falcon)</a> |
    <a href="https://github.com/facebookresearch/habitat-sim">Habitat-Sim</a> |
    <a href="https://github.com/facebookresearch/habitat-lab">Habitat-Lab</a>
  </p>

  <!-- Badges -->
  <p>
    <img src="https://img.shields.io/badge/Framework-Falcon-green.svg" alt="Falcon Framework Badge">
    <img src="https://img.shields.io/badge/Simulator-HabitatSim-blue.svg" alt="HabitatSim Badge">
    <img src="https://img.shields.io/badge/Datasets-SocialHM3D%20|%20SocialMP3D-orange.svg" alt="Datasets Badge">
  </p>
</div>


## :sparkles: Overview

This repository is based on **Falcon**, a reinforcement learning framework for socially-aware navigation.  
Our main modification is the addition of an **RGB camera** to the original depth-only setup, creating an **RGB-D sensor configuration**.  
This aims to enrich perception and improve navigation performance in crowded environments.  

---

## :hammer_and_wrench: Requirements

- [Habitat-Sim](https://github.com/facebookresearch/habitat-sim) (v0.3.1 with Bullet & headless support)  
- [Habitat-Lab](https://github.com/facebookresearch/habitat-lab)  
- **Social-HM3D** and **Social-MP3D** datasets (as provided by the organizers)  
- Pretrained weights (if required by the config, placed in the root directory)  

---

## :arrow_forward: Evaluation

Run evaluation with the RGB-D configuration:  

```bash
python -u -m habitat-baselines.habitat_baselines.run \
--config-name=social_nav_v2/falcon_rgbd_<dataset>.yaml

## Example (Social-HM3D):

thon -u -m habitat-baselines.habitat_baselines.run \
--config-name=social_nav_v2/falcon_rgbd_hm3d.yaml

(Optional) Add the following argument to save videos:

Copy code
habitat_baselines.eval.video_option=["disk"]

## :rocket: Training

To retrain the agent with the RGB-D setup:

python -u -m habitat-baselines.habitat_baselines.run \
--config-name=social_nav_v2/falcon_rgbd_hm3d_train.yaml


Training follows the same pipeline as the original Falcon, with sensor configs adapted for RGB-D.

## :pray: Acknowledgments

This work builds upon the original Falcon repository:
https://github.com/Zeying-Gong/Falcon
