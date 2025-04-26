#!/bin/bash

# Danica's update of Brock's script to do preprocessing and single-subject regression all in one go.
# assumes that you've ran the timing file script so there are timing files for Checkerboard and Music
#    events in the func folders.

# cd into the appropriate directory
cd ~/Desktop/Checkerboard_BIDS

# set subject and group identifiers
subj=sub-18
task=FlickeringCheckerBoard

# set data directories
top_dir=~/Desktop/Checkerboard_BIDS/${subj}
anat_dir=${top_dir}/anat
epi_dir=${top_dir}/func


# run afni_proc.py to create a single subject processing script 
afni_proc.py                                                                    \
    -subj_id                  $subj                                             \
    -script                   proc.$subj                                        \
    -scr_overwrite                                                              \
    -dsets                    ${epi_dir}/${subj}_task-${task}_run-1_bold.nii.gz \
    -copy_anat                ${anat_dir}/${subj}_T1w.nii.gz                    \
    -blocks                   tshift align tlrc volreg mask blur scale regress  \
    -radial_correlate_blocks  tcat volreg                                       \
    -tcat_remove_first_trs    0                                                 \
    -align_unifize_epi        local                                             \
    -align_opts_aea           -cost lpc+ZZ                                      \
                              -ginormous_move                                   \
                              -check_flip                                       \
    -tlrc_base                MNI152_2009_template.nii.gz                       \
    -volreg_align_to          MIN_OUTLIER                                       \
    -volreg_align_e2a                                                           \
    -volreg_tlrc_warp                                                           \
    -volreg_compute_tsnr      yes                                               \
    -mask_epi_anat            yes                                               \
    -blur_size                4.0                                               \
    -regress_stim_times       ${epi_dir}/Checkerboard.1D ${epi_dir}/Music.1D    \
    -regress_stim_labels      Checkerboard Music                                \
    -regress_basis            'BLOCK(20,1)'                                     \
    -regress_opts_3dD         -jobs 2                                           \
                              -gltsym 'SYM: Checkerboard -Music'                \
                              -glt_label 1 Check-Music                          \
    -regress_motion_per_run                                                     \
    -regress_censor_motion    0.3                                               \
    -regress_censor_outliers  0.05                                              \
    -regress_3dD_stop                                                           \
    -regress_reml_exec                                                          \
    -regress_compute_fitts                                                      \
    -regress_make_ideal_sum   sum_ideal.1D                                      \
    -regress_est_blur_epits                                                     \
    -regress_est_blur_errts                                                     \
    -regress_run_clustsim     no                                                \
    -html_review_style        pythonic                                          \
    -execute

#to open QC: open_apqc.py -infiles sub-18.results/QC_sub-18/index.html

