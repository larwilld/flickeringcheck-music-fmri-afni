#!/bin/bash

# looking at the ROI from the group:task intereaction
cd ~/Desktop/Checkerboard_BIDS

# list of subjects contained in subjList_flicker_all.txt

for subj in `cat subjList_flicker_all.txt`; do 3dROIstats -1DRformat -mask MVM_output/MVM_Interaction_p.001_k10_mask+tlrc ${subj}.results/stats.${subj}_REML+tlrc'[1,4]' >> MVM_interaction_p.001_k10_means.txt; done

# note: change directory to folder name of where MVM output mask is stored at its name for future renditions

for subj in `cat subjList_flicker_all.txt`; do 3dROIstats -1DRformat -mask MVM_output/MVM_Interaction_p.001_k10_sex_task_mask+tlrc ${subj}.results/stats.${subj}_REML+tlrc'[1,4]' >> MVM_interaction_p.001_k10_sex_task_means.txt; done
