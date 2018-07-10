# Overview
The file *TidyData.txt* is the required dataset for the course project. It contains the average of each variable for each activity
and each subject from the [Samsung smartphone human activity recognition dataset](
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

# Transformation on the original dataset
The space-seperated dataset in *TidyData.txt* is obtained through the following transformation on the original dataset:

1. The names of the measuring variables are extracted from *features.txt*.
2. The lists of subject and activity id are imported.
3. The data in *X_train.txt* and *X_text.txt" are imported and labelled using the column names from step 1.
4. The columns of subject id and activity labels are combined with the data from step 3.
5. The two datasets are combined vertically.
6. The dataset is grouped throuhg the function *group_by* in the *dplyr* package.
7. Data in *TidyData.txt* is created by calculating the average of each variable for each activity and each subject.

# Description of variables
The first column: subject id;

The second column: activity label, including six types: walking, walking upstairs, walking downstairs, sitting, standing, and laying.
The remaining columns: set of measurements on a list of features

List of measurements:

* mean(): Mean value; 
* std(): Standard deviation; 
* mad(): Median absolute deviation; 
* max(): Largest value in array; 
* min(): Smallest value in array; 
* sma(): Signal magnitude area; 
* energy(): Energy measure. Sum of the squares divided by the number of values; 
* iqr(): Interquartile range; 
* entropy(): Signal entropy; 
* arCoeff(): Autorregresion coefficients with Burg order equal to 4; 
* correlation(): correlation coefficient between two signals; 
* maxInds(): index of the frequency component with largest magnitude; 
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency; 
* skewness(): skewness of the frequency domain signal; 
* kurtosis(): kurtosis of the frequency domain signal; 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window; 
* angle(): Angle between to vectors; 

List of Variables: 

* tBodyAcc, on x, y, and z directions; 
* tGravityAcc, on x, y, and z directions; 
* tBodyAccJerk, on x, y, and z directions; 
* tBodyGyro, on x, y, and z directions; 
* tBodyGyroJerk, on x, y, and z directions; 
* tBodyAccMag; 
* tGravityAccMag; 
* tBodyAccJerkMag; 
* tBodyGyroMag; 
* tBodyGyroJerkMag; 
* fBodyAcc, on x, y, and z directions; 
* fBodyAccJerk, on x, y, and z directions; 
* fBodyGyro, on x, y, and z directions; 
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag
