# Introduction

This work is being done for the Coursera "Getting and Cleaning Data" course project.

I have written an R script, named "run_analysis.R", to merge and tidy data gathered from an experiment that was collecting data from the accelerometers Samsung Galaxy S smartphones.


# Running the script

1. Download my run_analysis.R script file.
2. Download my tidy.txt file.
3. Save both of them in the project directory "UCI_HAR_Datset" you created for this project project. This directory must contain the project raw data downloaded from 
3. Download the data source zip file
4. Unzip the source zip file: `unzip getdata-projectfiles-UCI\ HAR\ Dataset.zip`
5. Run run_analysis.R

## Steps as commands

Corresponding commands are:

```
git clone https://github.com/saadtazi/getting-cleaning-data-project
cd getting-cleaning-data-project
wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
unzip getdata-projectfiles-UCI\ HAR\ Dataset.zip
R run_analysis.R
```

***These commands have been tested on Mac OSX and might have to be adapted for other operating systems.***

# Output

run_analysis.R generates 2 files:
* tidy_data.txt: a space-delimited value file that contains mean and standard deviation for each measurements from the train and test data,
* average_data.txt: a space-delimited value file that contains tidy data set with the average of each variable for each activity and each subject

I used default params for write.table() so space-delimited, with column names, ... To read those files, use:

```
read.table('tidy_data.txt')
read.table('average_data')
```

## Code Book

Check [here](codeBook.md).


This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.

The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files

The code takes for granted all the data is present in the same folder, un-compressed and without names altered.

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.

`run_analysis.R` contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.

The output of the 5th step is called `averages_data.txt`, and uploaded in the course project's form.
