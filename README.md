# README for working run_analysis.R

## Explanation of the scripts work

#### 1. Merges the training and the test sets to create one data set.
##### In this step, I use "read.table" to load the train and test data into Rstudio, and rbind them into one data set named "myframe"

#### 2. Appropriately labels the data set with descriptive variable names.
##### In this step, I use "names" to modify the variable names of myframe (V1,V2,V3...) into features ("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y"...)

#### 3. Uses descriptive activity names to name the activities in the data set.
##### 3.1. I load the subject and activity of train and test, and merge them.
##### 3.2. Use cbind to merge the subject and activity with myframe.
##### 3.3. Use descriptive activity names to name the activities, and save dataframe to local.

#### 4. Extracts only the measurements on the mean and standard deviation for each measurement. 
##### In this step, I use "select" in "dplyr" to select the variables including "mean" and "std", and tidy it.

#### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##### In this step, I use "aggregate" to create two independent tidy data sets with the average of each variable for each activity and each subject. The data names are "subject.df" and "activity.df".

## Operation steps:
#### 1. Please cope "run_analysis" into R Script in Rstudio.
#### 2. Creat a directory named "project", and make sure the following ".txt" are in this directory: "X_train.txt", "X_test.txt", "y_train.txt", "y_train.txt", "subject_train.txt", "subject_test.txt", "features.txt".
#### 3. Run the codes in "run_analysis" row by row, doing all the commands including "read.table", "write.table", "names", "cbind", "rbind".
#### 4. You'll get the the tidy data set I submitted for part 1.
