# Unzip the file
fileName <- "getdata%2Fprojectfiles%2FUCI HAR Dataset.zip"
unzip(fileName)

## Merges the training and the test sets to create one data set.
# Extract the feature names, to be used as column names
featureNames <- read.table("./UCI HAR Dataset/features.txt", sep=" ",
                           colClasses=c("NULL", "character"))
featureNames <- tolower(featureNames[,1])

# Read the subject id
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                           colClasses="factor",col.names="subjectID")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                          colClasses="factor",col.names="subjectID")

# Read the activity id
activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                            colClasses="factor",col.names="activity")
activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                            colClasses="factor",col.names="activity")
library(plyr)
activityTrain[,1] <- mapvalues(activityTrain[,1], from = c("1", "2", "3", "4", "5", "6"),
                           to = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
activityTest[,1] <- mapvalues(activityTest[,1], from = c("1", "2", "3", "4", "5", "6"),
                           to = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))


# Read the train and test data
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt",nrows=length(subjectTrain[,1]), 
                       col.names=featureNames, colClasses=rep("numeric",561),strip.white=TRUE)

testData <- read.table("./UCI HAR Dataset/test/X_test.txt",nrows=length(subjectTest[,1]), 
                       col.names=featureNames, colClasses=rep("numeric",561),strip.white=TRUE)

# Add subject id to the data frame and combine train and test data
trainData <- cbind(subjectTrain, activityTrain, trainData)
testData <- cbind(subjectTest, activityTest, testData)
wholeData <- rbind(trainData, testData)

## Extracts only the mean and standard deviation for each measurement.
pattern <- "mean|std"
meanStdData <- wholeData[,grepl(pattern,names(wholeData))]

## Create a data set for the average of each variable for each activity and each subject
library(dplyr)
wholeDataGrouped <- group_by(wholeData, subjectID, activity)
subjectAverge <- summarise_at(wholeDataGrouped, vars(-(subjectID:activity)), funs(mean(., na.rm=TRUE)))
idNumber <- as.numeric(as.character(subjectAverge$subjectID))
subjectAverge <- subjectAverge[order(idNumber),]
# Write the tidy table
write.table(subjectAverge, "myTidyTable.txt", row.name=FALSE)
