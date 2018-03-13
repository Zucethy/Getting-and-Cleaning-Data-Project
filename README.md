# Getting-and-Cleaning-Data-Project
This Repository was created to perform the analysis for Final Project of Getting and Cleaning Data course.

### Purpose of the Project: 
Is to prepare tidy data that can be used for later analysis

## Pre-work to use this script:
1. Download data sets from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into your R working directory
2. Unzip the file into your R working directory
3. Execute run_analysis.R to generate a tidy file

## The run_analysis.R script performs the following tasks:
1. Merges the training and test datasets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in data set
4. Appropiately labels the data set with descriptive variables names
5. Creates a tidy data set with the average of each variable for each activity and for each subject
