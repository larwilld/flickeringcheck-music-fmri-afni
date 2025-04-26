#!/bin/bash


#Check whether the file subjList_flicker.txt exists; if not, create it
if [ ! -f subjList_flicker.txt ]; then
    ls | grep ^sub- > subjList_flicker.txt
fi

#Loop over all subjects and format timing files into FSL format
for subj in `cat subjList_flicker.txt`; do
    cd $subj/func
    cat ${subj}_task-FlickeringCheckerBoard_run-1_events.tsv | awk '{if ($3=="Checkerboard") {print $1, $2, 1}}' > Checkerboard_run1.txt
    cat ${subj}_task-FlickeringCheckerBoard_run-1_events.tsv | awk '{if ($3=="Music") {print $1, $2, 1}}' > Music_run1.txt

#Now convert to AFNI format
    timing_tool.py -fsl_timing_files Checkerboard_run1.txt -write_timing Checkerboard.1D
    timing_tool.py -fsl_timing_files Music_run1.txt -write_timing Music.1D

    cd ../..

done
