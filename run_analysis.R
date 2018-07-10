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

# Read the train and test data
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt",nrows=length(subjectTrain[,1]), 
                       col.names=featureNames, colClasses=rep("numeric",561),strip.white=TRUE)
testData <- read.table("./UCI HAR Dataset/test/X_test.txt",nrows=length(subjectTest[,1]), 
                       col.names=featureNames, colClasses=rep("numeric",561),strip.white=TRUE)
# Add subject id to the data frame and combine train and test data
trainData$subjectID <- subjectTrain[,1]
testData$subjectID <- subjectTest[,1]
wholeData <- rbind(trainData,testData)

## Extracts only the mean and standard deviation for each measurement.
pattern <- "mean|std"
meanStdData <- wholeData[,grepl(pattern,names(wholeData))]

## Create a data set for the average of each variable for each activity and each subject
library(dplyr)
wholeDataGrouped <- group_by(wholeData, subjectID)
subjectAverge <- summarise_at(wholeDataGrouped, vars(-subjectID), funs(mean(., na.rm=TRUE)))
idNumber <- as.numeric(as.character(subjectAverge$subjectID))
subjectAverge <- subjectAverge[order(idNumber),]
# Write the tidy table
write.table(subjectAverge, "myTidyTable.txt", row.name=FALSE)
