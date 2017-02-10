# Data cleaning course project
The purpose of this script is to demonstrate the ability to collect, work with, and clean a data set.

## What does the script do?
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to use it?
1. Download the data [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Dataset"). Extract it to a folder and keep the file names AS-IS
2. Open the script *run_analysis.R* in RStudio or a text editor, make sure the *dirin* variable is point to the extracted folder in step 1, the *dirout* for the output dataset after cleaning

	```
		dirin <-"yourpath/dataset"
		dirout <- "yourpath/output"
	```
	
3. Open the script *run_analysis.R* in RStudio and run:

	```R
		source("yourpath/run_analysis.R")
	```
	
4. Verify if there are 2 below csv files generated in the output folder:
 - *merged.csv*: for the 1st-4th requirement
 - *mean_by_activity_subject.csv*: for the 5th requirement
