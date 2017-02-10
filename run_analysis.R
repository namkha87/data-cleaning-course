## the data for project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## please keep the file names AS-IS after extracting

## set the path containing input dataset and output
dirin <-"c:/Code/Coursera/data-cleaning/project/dataset"
dirout <- "c:/Code/Coursera/data-cleaning/project/output"

## read the activity labels
activitylabels <- read.table(paste0(dirin, "/activity_labels.txt"), header= F)

## read features
f <- read.table(paste0(dirin, "/features.txt"), header= F)
f <- f[grep("mean\\(\\)|std\\(\\)", f[, 2]), ]
features <- data.frame(id = f[, 1], featureName = f[, 2])

## read the train dataset
subtrain <- read.table(paste0(dirin, "/train/subject_train.txt"), header= F)[, 1]
xtrain <- read.table(paste0(dirin, "/train/X_train.txt"), header= F)
ytrain <- read.table(paste0(dirin, "/train/y_train.txt"), header= F)[, 1]

## read the test dataset
subtest <- read.table(paste0(dirin, "/test/subject_test.txt"), header= F)[, 1]
xtest <- read.table(paste0(dirin, "/test/X_test.txt"), header= F)
ytest <- read.table(paste0(dirin, "/test/y_test.txt"), header= F)[, 1]

## a function to clean a dataset e.g. train, combine all data x, y, subject into a single data frame
## basically it will solve these requirements: 2nd, 3rd, 4th
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

## requirement 1st 2nd, 3rd, 4th: merge test and train together 
merged <- rbind(mergedtest, mergedtrain)

## finally 5th requirement
meanmerged <- aggregate(x = merged[, 3:68], by = list(activity = merged$activity, subjectid = merged$subjectid), FUN = mean)

## create the output directory if not exist
if (!dir.exists(dirout)) dir.create(dirout)

## write the output
write.table(merged, paste0(dirout, "/merged.txt"), row.names = F)
write.table(meanmerged, paste0(dirout, "/mean_by_activity_subject.txt"), row.names = F)