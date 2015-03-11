getwd()
dir.create("project")

# 1. Merges the training and the test sets to create one data set.
train<-read.table(file="./project/X_train.txt",header = F) # read the training data
test<-read.table(file="./project/X_test.txt",header = F) # read the testing data
myframe<-rbind(train,test) # merge the train and test

# 2. Appropriately labels the data set with descriptive variable names.
features<-read.table(file="./project/features.txt",header = F) # read the features
names(myframe)<-features[,2] # name the dataframe with features

# 3. Uses descriptive activity names to name the activities in the data set.
## 3.1. merge the subject and activity
train.activity<-read.table(file="./project/y_train.txt",header = F) # read the training activity
names(train.activity)<-"activity" # modify the name into "activity"

train.subject<-read.table(file="./project/subject_train.txt",header = F) # read the training subject
names(train.subject)<-"subject" # modify the name into "subject"

test.activity<-read.table(file="./project/y_test.txt",header = F) # read the testing activity
names(test.activity)<-"activity" # modify the name into "activity"

test.subject<-read.table(file="./project/subject_test.txt",header = F) # read the testing subject
names(test.subject)<-"subject" # modify the name into "subject"

subject<-rbind(train.subject,test.subject) # merge the subject
activity<-rbind(train.activity,test.activity) # merge the activity

## 3.2. merge the subject and activity with myframe
myframe.2<-cbind(subject,activity,myframe) # merge the subject and activity with myframe
str(myframe.2)

## 3.3. Uses descriptive activity names to name the activities
myframe.2$activity<-as.character(myframe.2$activity)

myframe.2$activity[which(myframe.2$activity==1)]<-"WALKING" # Uses descriptive activity names to name the activities
myframe.2$activity[which(myframe.2$activity==2)]<-"WALKING_UPSTAIRS"
myframe.2$activity[which(myframe.2$activity==3)]<-"WALKING_DOWNSTAIRS"
myframe.2$activity[which(myframe.2$activity==4)]<-"SITTING"
myframe.2$activity[which(myframe.2$activity==5)]<-"STANDING"
myframe.2$activity[which(myframe.2$activity==6)]<-"LAYING"

myframe.2$activity<-factor(myframe.2$activity)
table(myframe.2$activity) # check the result

write.table(x = myframe.2,file="./project/myframe.2.txt",row.names = F) # save it to local

# 4. Extracts only the measurements on the mean and standard deviation for each measurement. 
myframe.3<-read.table(file="./project/myframe.2.txt",header = T) # load myframe.2 as myframe.3 for doing the following excercise
str(myframe.3)
names(myframe.3)

library(dplyr)
myframe.3<-select(myframe.3,contains("subject"),contains("activity"),contains("mean"),contains("std")) # Extracts only the measurements on the mean and standard deviation

names(myframe.3)<-sub(pattern = "\\.",replacement = "_",x = names(myframe.3)) # change the first "." into "_"
names(myframe.3)<-sub(pattern = "\\.",replacement = "_",x = names(myframe.3)) # change the second "." into "_"
names(myframe.3)<-gsub(pattern = "\\.",replacement = "",x = names(myframe.3)) # delete the rest "."
names(myframe.3)<-gsub(pattern = "_$",replacement = "",x = names(myframe.3)) # delete the last "_"
names(myframe.3)

# 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.
str(myframe.3)
myframe.3$subject<-factor(myframe.3$subject)

subject.df<-aggregate(myframe.3[,3:88],list(subject=myframe.3$subject),mean,na.rm=T) # make a new dataframe show the average of each variable for each subject
activity.df<-aggregate(myframe.3[,3:88],list(activity=myframe.3$activity),mean,na.rm=T) # make a new dataframe show the average of each variable for each activity

write.table(x = subject.df,file="./project/subject.df.txt",row.name=FALSE) # save subject.df to local
write.table(x = activity.df,file="./project/activity.df.txt",row.name=FALSE) # save activity.df to local

str(subject.df)
str(activity.df)
