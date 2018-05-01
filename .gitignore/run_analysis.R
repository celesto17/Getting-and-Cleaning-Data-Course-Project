# Course 4 - Getting and Cleaing Data: Course Project
# Author: Sanjay Lonkar
# Date: 01-May-2018


# TASK 1: Merges the training and the test sets to create one data set.

  # Get the data to be cleaned
  if (!file.exists("./downloadedDataset"))
    {
        dir.create("./downloadedDataset")
  }
  if (!file.exists ("./downloadedDataset/downloadedDataset.zip")) # This step is to avoid downloading data every time one runs this script
    {
    datasetURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file (datasetURL, destfile="./downloadedDataset/downloadedDataset.zip")
    unzip (zipfile = "./downloadedDataset/downloadedDataset.zip", exdir="./downloadedDataset")
  }

  # Create one data set from downloaded training and test data sets 
  
  x_train <- read.table("./downloadedDataset/UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("./downloadedDataset/UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("./downloadedDataset/UCI HAR Dataset/train/subject_train.txt")
  
  x_test <- read.table("./downloadedDataset/UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("./downloadedDataset/UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("./downloadedDataset/UCI HAR Dataset/test/subject_test.txt")
  
  features <- read.table('./downloadedDataset/UCI HAR Dataset/features.txt')
  activityLabels = read.table('./downloadedDataset/UCI HAR Dataset/activity_labels.txt')
  
  
  colnames(x_train) <- features[,2] 
  colnames(y_train) <-"activityId"
  colnames(subject_train) <- "subjectId"
  
  colnames(x_test) <- features[,2] 
  colnames(y_test) <- "activityId"
  colnames(subject_test) <- "subjectId"
  
  colnames(activityLabels) <- c('activityId','activityType')
  
  mrg_train <- cbind(y_train, subject_train, x_train)
  mrg_test <- cbind(y_test, subject_test, x_test)
  setAllInOne <- rbind(mrg_train, mrg_test)

# TASK 2: Extracts only the measurements on the mean and standard deviation for each measurement.

  colNames <- colnames (setAllInOne)
  mean_and_std <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
  setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]
  
# TASK 3: Uses descriptive activity names to name the activities in the data set
  setWithActivityNames <- merge (setForMeanAndStd, activityLabels, by='activityId', all.x=TRUE)
  
# TASK 4: Appropriately labels the data set with descriptive variable names. - Already done earlier
  
# TASK 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  secTidySet <- aggregate (. ~subjectId + activityId, setWithActivityNames, mean)
  secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]
  write.table (secTidySet, "secTidySet.txt", row.name=FALSE)