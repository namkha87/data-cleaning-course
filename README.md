# Data cleaning course project
The purpose of this script is to demonstrate the ability to collect, work with, and clean a data set.

## Project requirements
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How does it work?
1. Set the input and output directory. Make sure your working directory has a folder *dataset* containing all necessary files

	```R
	## set the path containing input dataset and output
	dirin <- paste0(getwd(), "/dataset")
	dirout <- paste0(getwd(), "/output")
	```

2. Read the *activity_labels.txt* for descriptive activity names

	```R
	activitylabels <- read.table(paste0(dirin, "/activity_labels.txt"), header= F)
	```

3. Read the *features.txt*, then filter out variables measurements on the mean and standard deviation for each measurement by using regular expression. There are 66 variables matched the condition
	
	```R
	f <- read.table(paste0(dirin, "/features.txt"), header= F)
	f <- f[grep("mean\\(\\)|std\\(\\)", f[, 2]), ]
	features <- data.frame(id = f[, 1], featureName = f[, 2])
	```
	
4. Read the train and test dataset into memory
	
	```R
	## read the train dataset
	subtrain <- read.table(paste0(dirin, "/train/subject_train.txt"), header= F)[, 1]
	xtrain <- read.table(paste0(dirin, "/train/X_train.txt"), header= F)
	ytrain <- read.table(paste0(dirin, "/train/y_train.txt"), header= F)[, 1]

	## read the test dataset
	subtest <- read.table(paste0(dirin, "/test/subject_test.txt"), header= F)[, 1]
	xtest <- read.table(paste0(dirin, "/test/X_test.txt"), header= F)
	ytest <- read.table(paste0(dirin, "/test/y_test.txt"), header= F)[, 1]
	```
	
5. For each dataset e.g. train, test, I have a function to combine the X, y, and subject into a single frame

	```R
	mergeDataset <- function (x, y, subject) {
		# remove all columns that are not measurements on the mean and standard deviation
		x <- x[, features$id]
		# set with descriptive variable names
		colnames(x) <- features$featureName
		
		# set descriptive activity names
		x$activity <- sapply(y, function (lblId) { activitylabels[lblId, 2] })
		
		# also add the test subject to dataset
		x$subjectid <- subject
		
		# x now contains 68 columns dataset: 66 existing variables + 2 new columns
		# we will reorder columns a little bit: 2 new columns move to first
		x[, c(67, 68, 1:66)]
	}
	
	## now we merge each test set and train set
	mergedtest <- mergeDataset(xtest, ytest, subtest)
	mergedtrain <- mergeDataset(xtrain, ytrain, subtrain)
	```

6. Merge train and test into a single frame

	```R
	## requirement 1st 2nd, 3rd, 4th: merge test and train together 
	merged <- rbind(mergedtest, mergedtrain)
	```

7. Use *aggregate* to calculate the average of each variable for each activity and each subject

	```R
	## requirement 1st 2nd, 3rd, 4th: merge test and train together 
	meanmerged <- aggregate(x = merged[, 3:68], by = list(activity = merged$activity, subjectid = merged$subjectid), FUN = mean)
	```

8. Finally it will write the output using write.table with row.name=FALSE

	```R
	## create the output directory if not exist
	if (!dir.exists(dirout)) dir.create(dirout)

	## write the output
	write.table(merged, paste0(dirout, "/merged.txt"), row.names = F)
	write.table(meanmerged, paste0(dirout, "/mean_by_activity_subject.txt"), row.names = F)
	```
	
## How to connect it?
1. Download the data at [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Dataset"). Extract it to a folder "dataset" in your working directory and keep the file names AS-IS
2. Open the script *run_analysis.R* in RStudio and run:

	```R
	source("run_analysis.R")
	```
	
4. Verify if there are 2 below txt files generated in the *output* folder in working directory:
 - *merged.txt*: for the 1st-4th requirement
 - *mean_by_activity_subject.txt*: for the 5th requirement
