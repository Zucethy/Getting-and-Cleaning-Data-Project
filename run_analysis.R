## Data collected from the accelerometers from the Samsung Galaxy S Smarthphone

##Set R directory as working directory
setwd("~/R/data")

##loading dplyr library
library(dplyr)

##loading training data into R
##Training set
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt") 

##Training labels
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt") 


##Subject who performed the activity for each window sample
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

##loading test data into R
##Test set
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

##Test labels
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

##load activity labels: links the class with their activity name
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

##Load list of all features
features <- read.table("./UCI HAR Dataset/features.txt")


##1. Mergin training data set and test data set to create one data set
X_all <- rbind(X_train, X_test)
Y_all <- rbind(X_test, Y_test)
subject_all <- rbind(subject_train, subject_test)
colnames(subject_all) <- "Subject"


##2. Extracts only the measurements on the mean and standard deviation for each measurement
measures <- features[grep("mean\\(\\)|std\\(\\)", features[, 2]), ]
X_all <- x_all[, measures[, 2]]



##3. Use descriptive activity names to name the activities in the data set
colnames(Y_all) <- "activityId"
Y_all$activity <- factor(Y_all$activityId, labels = activity_labels[, 2])


##4 Appropriately labels the data set with descriptive variable names
colnames(X_all) <- measures[, 2]

##Create a combine dataset for step 5
dataset <- cbind(subject_all, Y_all, X_all)

##5 Create an independant tidy dataset with the average of each variable for each activity and for each subject
tidy_mean <- dataset %>% group_by(activity, Subject) %>% summarize_all(mean)
write.table(tidy_mean, file = "./UCI HAR Dataset/tidy_mean.txt")
