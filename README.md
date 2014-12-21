## Introduction

This work is being done for the Coursera "Getting and Cleaning Data" course project.

I have written an R script, named "run_analysis.R", to merge and tidy data gathered from an experiment that was collecting data from the accelerometers Samsung Galaxy S smartphones.

## Files

**README.md** : this file.

**CodeBook.md** describes the variables, the data, and all the steps performed to clean up the data.

**run_analysis.R** contains all the code to perform the transformations required for this project.

**tidy.txt** contains the tidy output of the script. As per the project instructions, this file has not been uploaded to GitHub but to the project submission page.

## Running the script

1. Download my **run_analysis.R** script file.
2. Save it in the project directory "UCI_HAR_Datset" you created for this course project. This directory must contain the project raw data downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
3. Run the script run_analysis.R using RStudio.

## Checking my tidy output data
1. Download my **tidy.txt** file.
4. Read it using something like: tidy <- read.table("./tidy.txt", header = TRUE)

## Processing steps to produce the tidy data
A detailed explanation of all the processing can be found in the [Cookbook](https://github.com/karim3461/GaCD_Project/blob/master/Cookbook.md) file.
