# Getting-and-Cleaning-Data-Course-Project
This repository is for the peer-reviewed project of the course *Getting and Cleaning Data* on [Cousera](https://www.coursera.org/learn/data-cleaning).
The R script *run_analysis* contains the following procedures:

1. Unzip the data set using the default name *getdata%2Fprojectfiles%2FUCI HAR Dataset.zip*. Change accodingly if the data set has been renamed.
2. Read feature names from *features.txt*.
3. Read the subject id and activity labels.
4. Read the train and text data using the column names from step 2.
5. Combine the subject id and activity labels with the train and test dataset.
6. Combine the train and test dataset.
7. Extracts only the mean and standard deviation for each measurement.
8. Create a data set for the average of each variable for each activity and each subject.
9. Output the data set created in step 8.

Read the codebook for detailed descriptions about the variables, the data, and any transformations performed to clean up the data.
