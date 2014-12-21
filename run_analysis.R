### run_analysis.R script

setwd("G:/R/Workspace/GettingandCleaningData/Project/UCI_HAR_Dataset")

# Read the data
X_train <- read.table("./train/X_train.txt")
X_test <- read.table("./test/X_test.txt")

#str(X_train)    # 7352 obs. of 561 variables
#str(X_test)     # 2947 obs. of 561 variables

Y_train <- read.table("./train/y_train.txt")
Y_test <- read.table("./test/y_test.txt")

#nrow(Y_train) # 7352
#nrow(Y_test)  # 2947

subject_train <- read.table("./train/subject_train.txt")
subject_test <- read.table("./test/subject_test.txt")

#nrow(subject_train)  # 7352
#nrow(subject_test)   # 2947

# 1. Merge the training and the test feature data sets into a single data set (X data)
features_data <- rbind(X_train, X_test)

#str(features_data)   # 10299 obs. of 561 variables

# Merge the training and test subject data
subject <- rbind(subject_train, subject_test)

#str(subject)         # 10299 obs. of 1 variable

# Merge the training and test activity data (Y data) 
activity <- rbind(Y_train, Y_test)

#str(activity)        # 10299 obs. of 1 variable 

# Finish the merging (add subject and activity columns in front of the features data)
all <- cbind(subject, activity, features_data)

#ncol(all)           # 563
#nrow(all)          # 10299


# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
mean_std_columns <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543)

#length(mean_std_columns)  # 66

features <- all[ , c(1,2, mean_std_columns+2)] # offset by 2 because columns 1 and 2 are subject and activity.

#str(features)             # 68 variables (subject + activity + 66 feature variables)


# 3. Use descriptive activity names to name the activities in the data set
activity_labels <- read.table("./activity_labels.txt")

#str(activity_labels)      #6 obs. of 2 variables

# replace numerical value of activity (col 2 of features) with label value (col 2 of activity_lables)
features[,2]<- activity_labels[features[,2], 2]   


# 4. Appropriately label the data set with descriptive variable names. 
all_features_names <- read.table("./features.txt")

#str(all_features_names)   # 561 obs. of 2 variables

features_names <- all_features_names[mean_std_columns, 2]

#length(features_names)    # 66

#remove trailing parentheses at end of feature variables
features_names <- gsub('[()]', '', features_names)

#replace leading t's and f's in feature variables with more meaningful names
features_names <- gsub('^t', 'time_', features_names)
features_names <- gsub('^f', 'frequency_', features_names)

# print(features_names)    #check result

names(features) <- c("subject", "activity", as.character(features_names))

#str(features)            # 10299 obs. of 68 variables


# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
tidy <- ddply(features, .(subject, activity), function(x) colMeans(x[,3:68]))

#str(tidy)                #180 obs. of 68 variables

write.table(tidy, "tidy.txt", row.names = FALSE)

# to read type:  tidy <- read.table("./tidy.txt", header = TRUE)
