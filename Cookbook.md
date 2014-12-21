#From raw to tidy data

The R script "run_analysis.R" performs the 5 steps described in the course project's definition, and in the same order as described.

* First, all the similar data has been merged using the rbind() function. More specifically: The features data (X_train and X_test) have been merged into a single data set named "features_data". 
The subject data (subject_train and subject_test) have been merged into a single data set named "subject". 
The activity data (Y_train and Y_test) have been merged into a single data set named "activity".
Then, the "subject", "activity" and "features_data" sets have been merged together, using rbind(), to produce a single data set named "all".

...This picture from one of the class forums (https://class.coursera.org/getdata-016/forum/thread?thread_id=50#comment-333) summarizes the content of my single data set at this stage, with one main difference: the "subject" and "activity" columns 
have been put at the beginning of the set rather that at the end.

...Note that at each step, the str() and/or the nrow(), ncol() functions have been run, before and after the merge, to get an idea about the raw data and to ensure that the merging is consistent. However, for clarity purposes, these checks have been commented out in the final script.

* Second, only the "features_data" columns with measurements on the mean and standard deviation have been selected and saved to a curated data set named "features". The first two columns (subject and activity) have been kept, in their respective positions, in the curated "features" set. To determine the columns to select, a visual inspection of the features.txt file has been done, and only variables with mean() and std() clearly 
identified in their name have been retained. Therefore, variables with "FreqMean" or "GravityMean" in their name have been discarded because I have doubts that they correspond to what we are looking for.

* Third, I have replaced in the "features" data set, the activity codes (numbered from 1 to 6) with the activity labels read from the file "activity_labels.txt".
Some caution had to be exercised here because the activity_labels were stored in the second column of a data frame, while the first column was holding the corresponding numerical codes. 

* Fourth, all the data has been appropriately labeled with descriptive variable names. Of course, the first two columns of the curated data set "features" have been named "subject" and "activity", respectively. For columns 3 to the end of the data set (column 68), I have first read all the feature names from the file "features.txt". Then, I have retained only the feature names corresponding to the selected data (columns) in the curated "features" data set. Three transformations have been applied to these retained variable names in order to make them more meaningful: 
(1) all the trailing parentheses have been removed from the variable names to avoid confusing them with functions, 
(2) the leading "t"s have been replaced with what they stand for, namely "time",
(3) same for the leading "f"s which have been replaced with "frequency".

* Fifth, I have used the ddply() function, from the "plyr" library, to compute the average of each feature variable (columns 3 to 68 of the "features" set) for each subject and each activity. The result has been saved to a set named "tidy".

#Variables
All the column names are described in README.txt data source zip file, except for the following columns that were added:
* subject: represents an indivudual, subject of the experiment.
* activity: represents the activity of the subject while collecting data.

The features selected for this data set come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* time_BodyAcc-XYZ
* time_GravityAcc-XYZ
* time_BodyAccJerk-XYZ
* time_BodyGyro-XYZ
* time_BodyGyroJerk-XYZ
* time_BodyAccMag
* time_GravityAccMag
* time_BodyAccJerkMag
* time_BodyGyroMag
* time_BodyGyroJerkMag
* frequency_BodyAcc-XYZ
* frequency_BodyAccJerk-XYZ
* frequency_BodyGyro-XYZ
* frequency_BodyAccMag
* frequency_BodyAccJerkMag
* frequency_BodyGyroMag
* frequency_BodyGyroJerkMag

The set of variables that were estimated from these signals are: 
* mean: Mean value
* std: Standard deviation

The complete list of variables of each feature vector is available in 'features.txt'

