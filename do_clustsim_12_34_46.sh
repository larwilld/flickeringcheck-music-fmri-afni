#!/bin/bash

# getting the k cluster value for each group of n=12, n=34, and n=46 via three main steps
    # based on the "newer method" from the 3dClustSim help file and referenced the following link as well
    # https://afni.nimh.nih.gov/pub/dist/doc/htmldoc/programs/alpha/3dFWHMx_sphx.html
# assumes all results folders are in the directory Checkerboard_BIDS
cd ~/Desktop/Checkerboard_BIDS



## step 1 -- make a mask for each of the groups
3dmask_tool -input sub-35.results/full_mask.sub-35+tlrc \
                   sub-36.results/full_mask.sub-36+tlrc \
                   sub-37.results/full_mask.sub-37+tlrc \
                   sub-38.results/full_mask.sub-38+tlrc \
                   sub-39.results/full_mask.sub-39+tlrc \
                   sub-40.results/full_mask.sub-40+tlrc \
                   sub-41.results/full_mask.sub-41+tlrc \
                   sub-42.results/full_mask.sub-42+tlrc \
                   sub-43.results/full_mask.sub-43+tlrc \
                   sub-44.results/full_mask.sub-44+tlrc \
                   sub-45.results/full_mask.sub-45+tlrc \
                   sub-46.results/full_mask.sub-46+tlrc \
                   -prefix mask_n12_new -frac 0.8           # set frac at 0.8 to align with previous masks used

3dmask_tool -input sub-01.results/full_mask.sub-01+tlrc \
                   sub-02.results/full_mask.sub-02+tlrc \
                   sub-03.results/full_mask.sub-03+tlrc \
                   sub-04.results/full_mask.sub-04+tlrc \
                   sub-05.results/full_mask.sub-05+tlrc \
                   sub-06.results/full_mask.sub-06+tlrc \
                   sub-07.results/full_mask.sub-07+tlrc \
                   sub-08.results/full_mask.sub-08+tlrc \
                   sub-09.results/full_mask.sub-09+tlrc \
                   sub-10.results/full_mask.sub-10+tlrc \
                   sub-11.results/full_mask.sub-11+tlrc \
                   sub-12.results/full_mask.sub-12+tlrc \
                   sub-13.results/full_mask.sub-13+tlrc \
                   sub-14.results/full_mask.sub-14+tlrc \
                   sub-15.results/full_mask.sub-15+tlrc \
                   sub-16.results/full_mask.sub-16+tlrc \
                   sub-17.results/full_mask.sub-17+tlrc \
                   sub-18.results/full_mask.sub-18+tlrc \
                   sub-19.results/full_mask.sub-19+tlrc \
                   sub-20.results/full_mask.sub-20+tlrc \
                   sub-21.results/full_mask.sub-21+tlrc \
                   sub-22.results/full_mask.sub-22+tlrc \
                   sub-23.results/full_mask.sub-23+tlrc \
                   sub-24.results/full_mask.sub-24+tlrc \
                   sub-25.results/full_mask.sub-25+tlrc \
                   sub-26.results/full_mask.sub-26+tlrc \
                   sub-27.results/full_mask.sub-27+tlrc \
                   sub-28.results/full_mask.sub-28+tlrc \
                   sub-29.results/full_mask.sub-29+tlrc \
                   sub-30.results/full_mask.sub-30+tlrc \
                   sub-31.results/full_mask.sub-31+tlrc \
                   sub-32.results/full_mask.sub-32+tlrc \
                   sub-33.results/full_mask.sub-33+tlrc \
                   sub-34.results/full_mask.sub-34+tlrc \
            -prefix mask_n34_old -frac 0.8

3dmask_tool -input sub-01.results/full_mask.sub-01+tlrc \
                   sub-02.results/full_mask.sub-02+tlrc \
                   sub-03.results/full_mask.sub-03+tlrc \
                   sub-04.results/full_mask.sub-04+tlrc \
                   sub-05.results/full_mask.sub-05+tlrc \
                   sub-06.results/full_mask.sub-06+tlrc \
                   sub-07.results/full_mask.sub-07+tlrc \
                   sub-08.results/full_mask.sub-08+tlrc \
                   sub-09.results/full_mask.sub-09+tlrc \
                   sub-10.results/full_mask.sub-10+tlrc \
                   sub-11.results/full_mask.sub-11+tlrc \
                   sub-12.results/full_mask.sub-12+tlrc \
                   sub-13.results/full_mask.sub-13+tlrc \
                   sub-14.results/full_mask.sub-14+tlrc \
                   sub-15.results/full_mask.sub-15+tlrc \
                   sub-16.results/full_mask.sub-16+tlrc \
                   sub-17.results/full_mask.sub-17+tlrc \
                   sub-18.results/full_mask.sub-18+tlrc \
                   sub-19.results/full_mask.sub-19+tlrc \
                   sub-20.results/full_mask.sub-20+tlrc \
                   sub-21.results/full_mask.sub-21+tlrc \
                   sub-22.results/full_mask.sub-22+tlrc \
                   sub-23.results/full_mask.sub-23+tlrc \
                   sub-24.results/full_mask.sub-24+tlrc \
                   sub-25.results/full_mask.sub-25+tlrc \
                   sub-26.results/full_mask.sub-26+tlrc \
                   sub-27.results/full_mask.sub-27+tlrc \
                   sub-28.results/full_mask.sub-28+tlrc \
                   sub-29.results/full_mask.sub-29+tlrc \
                   sub-30.results/full_mask.sub-30+tlrc \
                   sub-31.results/full_mask.sub-31+tlrc \
                   sub-32.results/full_mask.sub-32+tlrc \
                   sub-33.results/full_mask.sub-33+tlrc \
                   sub-34.results/full_mask.sub-34+tlrc \
                   sub-35.results/full_mask.sub-35+tlrc \
                   sub-36.results/full_mask.sub-36+tlrc \
                   sub-37.results/full_mask.sub-37+tlrc \
                   sub-38.results/full_mask.sub-38+tlrc \
                   sub-39.results/full_mask.sub-39+tlrc \
                   sub-40.results/full_mask.sub-40+tlrc \
                   sub-41.results/full_mask.sub-41+tlrc \
                   sub-42.results/full_mask.sub-42+tlrc \
                   sub-43.results/full_mask.sub-43+tlrc \
                   sub-44.results/full_mask.sub-44+tlrc \
                   sub-45.results/full_mask.sub-45+tlrc \
                   sub-46.results/full_mask.sub-46+tlrc \
            -prefix mask_n46 -frac 0.8



## step 2 -- acf from residuals
# set some variables
sub_n12=(35 36 37 38 39 40 41 42 43 44 45 46)
sub_n34=(01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34)
sub_n46=(01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46)
# make arrays for later storage
    # for help with bash arrays https://www.gnu.org/software/bash/manual/bash.html#Arrays
declare -A a_values
declare -A b_values
declare -A c_values

# function to estimate and average ACF
    # I'm more confident in R, so referenced this for help with bash for loops
    # https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_01.html
estimate_acf() {
  group_name=$1 # this means the first input is the group
  output_file=$2 # this means the second input will be the output file name
  shift 2 # basically ignore the first two inputs
  subjects=("$@") # the rest is subject numbers

  > $output_file # create or clear out this file/variable

  for subj in "${subjects[@]}"; do
    # 3dClustSim reccomends using -acf over -fwhm
        # taking a look at the eerts output for each subject in the group
        # mask to each subject, then append a,b,c to output
    3dFWHMx -acf \
      -input sub-${subj}.results/errts.sub-${subj}_REML+tlrc \
      -mask sub-${subj}.results/full_mask.sub-${subj}+tlrc >> $output_file
    rm -f 3dFWHMx.1D 3dFWHMx.1D.png # remove these junk files to avoid errors

  done

  read a b c <<< $(awk '{a+=$1; b+=$2; c+=$3} END {print a/NR, b/NR, c/NR}' $output_file) # keep track of the a, b, c output
  means=$(awk '{a+=$1; b+=$2; c+=$3} END {print a/NR, b/NR, c/NR}' $output_file)
    # referenced https://stackoverflow.com/questions/3122442/how-do-i-calculate-the-mean-of-a-column
  read a b c <<< "$means"
  
  # Save values in the arrays from before
  a_values[$group_name]=$a
  b_values[$group_name]=$b
  c_values[$group_name]=$c
  
}

# acf estimation for next step
estimate_acf n12 acf_n12.txt "${sub_n12[@]}"
estimate_acf n34 acf_n34.txt "${sub_n34[@]}"
estimate_acf n46 acf_n46.txt "${sub_n46[@]}"



# step 2.5 -- save values in case step 3 crashes, definitely not from experience
echo "${a_values[n12]} ${b_values[n12]} ${c_values[n12]}" > saved_acf_n12.txt
echo "${a_values[n34]} ${b_values[n34]} ${c_values[n34]}" > saved_acf_n34.txt
echo "${a_values[n46]} ${b_values[n46]} ${c_values[n46]}" > saved_acf_n46.txt



## step 3 -- 3dClustSim!
3dClustSim -acf ${a_values[n12]} ${b_values[n12]} ${c_values[n12]} -mask mask_n12_new+tlrc -prefix ClustSim_n12
3dClustSim -acf ${a_values[n34]} ${b_values[n34]} ${c_values[n34]} -mask mask_n34_old+tlrc -prefix ClustSim_n34
3dClustSim -acf ${a_values[n46]} ${b_values[n46]} ${c_values[n46]} -mask mask_n46+tlrc     -prefix ClustSim_n46


# I will be referencing the outputs:
    # ClustSim_n12.NN2_bisided
    # ClustSim_n34.NN2_bisided
    # ClustSim_n46.NN2_bisided
