The data contained in the file: tidy_data_set.txt comes from the UCI Machine Learning Repository.
The original data and a description about it can be reach at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The file "tidy_data_set.txt" summarized the data sets "train" and "test". It contains the average values for each
column when the data was divided by activity or subject.
The name of the variable (column) is equal to the original name original of the variable. Only the variables with
standard deviation and mean values where used.
The variable "ActivityOrSubject" indicates how the data was divided in order to achiev the value of the next columns.
The variables contained in the file are:
[1] "1"                 "ActivityOrSubject"
[1] "2"                 "tBodyAcc-mean()-X"
[1] "3"                 "tBodyAcc-mean()-Y"
[1] "4"                 "tBodyAcc-mean()-Z"
[1] "5"                "tBodyAcc-std()-X"
[1] "6"                "tBodyAcc-std()-Y"
[1] "7"                "tBodyAcc-std()-Z"
[1] "8"                    "tGravityAcc-mean()-X"
[1] "9"                    "tGravityAcc-mean()-Y"
[1] "10"                   "tGravityAcc-mean()-Z"
[1] "11"                  "tGravityAcc-std()-X"
[1] "12"                  "tGravityAcc-std()-Y"
[1] "13"                  "tGravityAcc-std()-Z"
[1] "14"                    "tBodyAccJerk-mean()-X"
[1] "15"                    "tBodyAccJerk-mean()-Y"
[1] "16"                    "tBodyAccJerk-mean()-Z"
[1] "17"                   "tBodyAccJerk-std()-X"
[1] "18"                   "tBodyAccJerk-std()-Y"
[1] "19"                   "tBodyAccJerk-std()-Z"
[1] "20"                 "tBodyGyro-mean()-X"
[1] "21"                 "tBodyGyro-mean()-Y"
[1] "22"                 "tBodyGyro-mean()-Z"
[1] "23"                "tBodyGyro-std()-X"
[1] "24"                "tBodyGyro-std()-Y"
[1] "25"                "tBodyGyro-std()-Z"
[1] "26"                     "tBodyGyroJerk-mean()-X"
[1] "27"                     "tBodyGyroJerk-mean()-Y"
[1] "28"                     "tBodyGyroJerk-mean()-Z"
[1] "29"                    "tBodyGyroJerk-std()-X"
[1] "30"                    "tBodyGyroJerk-std()-Y"
[1] "31"                    "tBodyGyroJerk-std()-Z"
[1] "32"                 "tBodyAccMag-mean()"
[1] "33"                "tBodyAccMag-std()"
[1] "34"                    "tGravityAccMag-mean()"
[1] "35"                   "tGravityAccMag-std()"
[1] "36"                     "tBodyAccJerkMag-mean()"
[1] "37"                    "tBodyAccJerkMag-std()"
[1] "38"                  "tBodyGyroMag-mean()"
[1] "39"                 "tBodyGyroMag-std()"
[1] "40"                      "tBodyGyroJerkMag-mean()"
[1] "41"                     "tBodyGyroJerkMag-std()"
[1] "42"                "fBodyAcc-mean()-X"
[1] "43"                "fBodyAcc-mean()-Y"
[1] "44"                "fBodyAcc-mean()-Z"
[1] "45"               "fBodyAcc-std()-X"
[1] "46"               "fBodyAcc-std()-Y"
[1] "47"               "fBodyAcc-std()-Z"
[1] "48"                    "fBodyAcc-meanFreq()-X"
[1] "49"                    "fBodyAcc-meanFreq()-Y"
[1] "50"                    "fBodyAcc-meanFreq()-Z"
[1] "51"                    "fBodyAccJerk-mean()-X"
[1] "52"                    "fBodyAccJerk-mean()-Y"
[1] "53"                    "fBodyAccJerk-mean()-Z"
[1] "54"                   "fBodyAccJerk-std()-X"
[1] "55"                   "fBodyAccJerk-std()-Y"
[1] "56"                   "fBodyAccJerk-std()-Z"
[1] "57"                        "fBodyAccJerk-meanFreq()-X"
[1] "58"                        "fBodyAccJerk-meanFreq()-Y"
[1] "59"                        "fBodyAccJerk-meanFreq()-Z"
[1] "60"                 "fBodyGyro-mean()-X"
[1] "61"                 "fBodyGyro-mean()-Y"
[1] "62"                 "fBodyGyro-mean()-Z"
[1] "63"                "fBodyGyro-std()-X"
[1] "64"                "fBodyGyro-std()-Y"
[1] "65"                "fBodyGyro-std()-Z"
[1] "66"                     "fBodyGyro-meanFreq()-X"
[1] "67"                     "fBodyGyro-meanFreq()-Y"
[1] "68"                     "fBodyGyro-meanFreq()-Z"
[1] "69"                 "fBodyAccMag-mean()"
[1] "70"                "fBodyAccMag-std()"
[1] "71"                     "fBodyAccMag-meanFreq()"
[1] "72"                         "fBodyBodyAccJerkMag-mean()"
[1] "73"                        "fBodyBodyAccJerkMag-std()"
[1] "74"                             "fBodyBodyAccJerkMag-meanFreq()"
[1] "75"                      "fBodyBodyGyroMag-mean()"
[1] "76"                     "fBodyBodyGyroMag-std()"
[1] "77"                          "fBodyBodyGyroMag-meanFreq()"
[1] "78"                          "fBodyBodyGyroJerkMag-mean()"
[1] "79"                         "fBodyBodyGyroJerkMag-std()"
[1] "80"                              "fBodyBodyGyroJerkMag-meanFreq()"

For more information about the variables check the next lines that contain the original file that describes
how this variables were originally calculated:
File: features_info.txt

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


