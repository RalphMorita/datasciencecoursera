#Codebook for run_analysis.R
This document contains the following sections:
1. Information about the input data
2. Information about the input variables 
3. Information about the output data
4. Information about the summary choices
5. Information about the experimental study design used
6. Instructions
7. Notes and Licenses

##1. Information about the input data
The project uses the datasets found at this [site](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
Once downloaded and unziped there will be a directory called 'UCI HAR Dataset' containing the input files and additional information about these files.

The dataset includes the following files:
=========================================

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The following files are available but are not used in this project:
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

The provided R code contains lines that will download and unzip these file if they are not already available. Simply uncomment and run the appropriate lines

I have also included the unzipped data in this [directory](https://github.com/RalphMorita/datasciencecoursera/tree/master/UCI%20HAR%20Dataset)

##2. Information about the input variables
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

The complete list of variables of each feature vector is available in 'features.txt' file located [here](https://github.com/RalphMorita/datasciencecoursera/blob/master/UCI%20HAR%20Dataset/features.txt)

##3. Information about the output data
The assignment required only the mean and standard deviation measures from the input data. As such, only the measures ending in Mean() or std() were selected for this project. This does not include the MeanFreq measures as those measured the weighted average of the frequency components to obtain a mean frequency and not the mean values.

The output is a tidy dataset called MeanData.txt. It can be found [here](https://github.com/RalphMorita/datasciencecoursera/blob/master/OutputFiles/MeanData.txt).
This is a summarized file based on the input data. The data is summarized by Activity (Walking, Standing, etc.) and Subject (The id of the participant from 1-30).
The following variables are included in the output data:
- 'Activity':             The Activity Performed (i.e. Walking, Standing, etc.)                      
- 'Subject':              The ID of the participant (from 1-30)                         
- 'tBodyAcc_mean_X':      Mean of the Mean Body Acceleration signal along the X axis in the time domain
- 'tBodyAcc_mean_Y':      Mean of the Mean Body Acceleration signal along the Y axis in the time domain                 
- 'tBodyAcc_mean_Z':      Mean of the Mean Body Acceleration signal along the Z axis in the time domain                
- 'tBodyAcc_std_X':       Mean of the Standard Deviation of the Body Acceleration signal along the X axis in the time domain                 
- 'tBodyAcc_std_Y':       Mean of the Standard Deviation of the Body Acceleration signal along the Y axis in the time domain                 
- 'tBodyAcc_std_Z':       Mean of the Standard Deviation of the Body Acceleration signal along the Z axis in the time domain                 
- 'tGravityAcc_mean_X':   Mean of the Mean Gravity Acceleration signal along the X axis in the time domain                
- 'tGravityAcc_mean_Y':   Mean of the Mean Gravity Acceleration signal along the Y axis in the time domain              
- 'tGravityAcc_mean_Z':   Mean of the Mean Gravity Acceleration signal along the Z axis in the time domain               
- 'tGravityAcc_std_X':    Mean of the Standard Deviation of the Gravity Acceleration signal along the X axis in the time domain                 
- 'tGravityAcc_std_Y':    Mean of the Standard Deviation of the Gravity Acceleration signal along the Y axis in the time domain               
- 'tGravityAcc_std_Z':    Mean of the Standard Deviation of the Gravity Acceleration signal along the Z axis in the time domain               
- 'tBodyAccJerk_mean_X':  Mean of the Mean Body Jerk Acceleration signal along the X axis in the time domain            
- 'tBodyAccJerk_mean_Y':  Mean of the Mean Body Jerk Acceleration signal along the Y axis in the time domain             
- 'tBodyAccJerk_mean_Z':  Mean of the Mean Body Jerk Acceleration signal along the Z axis in the time domain             
- 'tBodyAccJerk_std_X':   Mean of the Standard Deviation of the Body Jerk Acceleration signal along the X axis in the time domain             
- 'tBodyAccJerk_std_Y':   Mean of the Standard Deviation of the Body Jerk Acceleration signal along the Y axis in the time domain             
- 'tBodyAccJerk_std_Z':   Mean of the Standard Deviation of the Body Jerk Acceleration signal along the Z axis in the time domain            
- 'tBodyGyro_mean_X':     Mean of the Mean Body Gyro signal along the X axis in the time domain             
- 'tBodyGyro_mean_Y':     Mean of the Mean Body Gyro signal along the Y axis in the time domain             
- 'tBodyGyro_mean_Z':     Mean of the Mean Body Gyro signal along the Z axis in the time domain             
- 'tBodyGyro_std_X':      Mean of the Standard Deviation of the Body Gyro signal along the X axis in the time domain             
- 'tBodyGyro_std_Y':      Mean of the Standard Deviation of the Body Gyro signal along the Y axis in the time domain            
- 'tBodyGyro_std_Z':      Mean of the Standard Deviation of the Body Gyro signal along the Z axis in the time domain             
- 'tBodyGyroJerk_mean_X': Mean of the Mean Body Gyro Jerk signal along the X axis in the time domain             
- 'tBodyGyroJerk_mean_Y': Mean of the Mean Body Gyro Jerk signal along the Y axis in the time domain             
- 'tBodyGyroJerk_mean_Z': Mean of the Mean Body Gyro Jerk signal along the Z axis in the time domain             
- 'tBodyGyroJerk_std_X':  Mean of the Standard Deviation of the Body Gyro Jerk signal along the X axis in the time domain            
- 'tBodyGyroJerk_std_Y':  Mean of the Standard Deviation of the Body Gyro Jerk signal along the Y axis in the time domain             
- 'tBodyGyroJerk_std_Z':  Mean of the Standard Deviation of the Body Gyro Jerk signal along the Z axis in the time domain             
- 'tBodyAccMag_std':      Mean of the Standard Deviation of the Magnitude of the Body Acceleration signal in the time domain             
- 'tGravityAccMag_std':   Mean of the Standard Deviation of the Magnitude of the Gravity Acceleration signal in the time domain             
- 'tBodyAccJerkMag_std':  Mean of the Standard Deviation of the Magnitude of the Body Acceleration Jerk signal in the time domain              
- 'tBodyGyroMag_std':     Mean of the Standard Deviation of the Magnitude of the Body Gyro signal in the time domain             
- 'tBodyGyroJerkMag_std': Mean of the Standard Deviation of the Magnitude of the Body Gyro Jerk signal in the time domain             
- 'fBodyAcc_mean_X':      Mean of the Mean Body Acceleration signal along the X axis in the frequency domain             
- 'fBodyAcc_mean_Y':      Mean of the Mean Body Acceleration signal along the Y axis in the frequency domain             
- 'fBodyAcc_mean_Z':      Mean of the Mean Body Acceleration signal along the Z axis in the frequency domain            
- 'fBodyAcc_std_X':       Mean of the Standard Deviation of the Body Acceleration signal along the X axis in the frequency domain             
- 'fBodyAcc_std_Y':       Mean of the Standard Deviation of the Body Acceleration signal along the Y axis in the frequency domain             
- 'fBodyAcc_std_Z':       Mean of the Standard Deviation of the Body Acceleration signal along the Z axis in the frequency domain             
- 'fBodyAccJerk_mean_X':  Mean of the Mean Body Acceleration Jerk signal along the X axis in the frequency domain             
- 'fBodyAccJerk_mean_Y':  Mean of the Mean Body Acceleration Jerk signal along the Y axis in the frequency domain            
- 'fBodyAccJerk_mean_Z':  Mean of the Mean Body Acceleration Jerk signal along the Z axis in the frequency domain             
- 'fBodyAccJerk_std_X':   Mean of the Standard Deviation of the Body Acceleration Jerk signal along the X axis in the frequency domain             
- 'fBodyAccJerk_std_Y':   Mean of the Standard Deviation of the Body Acceleration Jerk signal along the Y axis in the frequency domain             
- 'fBodyAccJerk_std_Z':   Mean of the Standard Deviation of the Body Acceleration Jerk signal along the Z axis in the frequency domain             
- 'fBodyGyro_mean_X':     Mean of the Mean Body Gyro signal along the X axis in the frequency domain            
- 'fBodyGyro_mean_Y':     Mean of the Mean Body Gyro signal along the Y axis in the frequency domain             
- 'fBodyGyro_mean_Z':     Mean of the Mean Body Gyro signal along the Z axis in the frequency domain             
- 'fBodyGyro_std_X':      Mean of the Standard Deviation of the Body Gyro signal along the X axis in the frequency domain             
- 'fBodyGyro_std_Y':      Mean of the Standard Deviation of the Body Gyro signal along the Y axis in the frequency domain             
- 'fBodyGyro_std_Z':      Mean of the Standard Deviation of the Body Gyro signal along the Z axis in the frequency domain            
- 'fBodyAccMag_std':      Mean of the Standard Deviation of the Magnitude of the Body Acceleration signal in the frequency domain             
- 'fBodyBodyAccJerkMag_std':  Mean of the Standard Deviation of the Magnitude of the Body Acceleration Jerk signal in the frequency domain          
- 'fBodyBodyGyroMag_std': Mean of the Standard Deviation of the Magnitude of the Body Gyro signal in the frequency domain             
- 'fBodyBodyGyroJerkMag_std': Mean of the Standard Deviation of the Magnitude of the Body Gryo Jerk signal in the frequency domain         
- 'angle_tBodyAccMean_gravity': Mean of the angle between two tBodyAccMean Vectors     
- 'angle_tBodyAccJerkMean_gravityMean': Mean of the angle between two tBodyAccMJerkMean Vectors
- 'angle_tBodyGyroMean_gravityMean':  Mean of the angle between two tBodyGyroMean Vectors  
- 'angle_tBodyGyroJerkMean_gravityMean':  Mean of the angle between two tBodyGyroJerkMean Vectors

##4. Information about the summary choices
The data was summarized using the aggregate function calling the mean() function for the relevant input variables (those variables that measured mean or standard deviation). The data was summarized by Activity and Subject.

##5. Information about the experimental study design used
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##6. Instructions
1. Ensure the data is downloaded and unzipped
2. Copy the Run_Analysis.R file into the "UCI HAR Dataset" Directory
3. Create a directory called "OutputData" at the same level as the "UCI HAR Dataset" Directory
4. Run the Run_Analysis.R file
5. Verify that a tidy dataset called MeanData.txt was created in the "OutputData" Directory

##7. Notes and Licenses
Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws
For more information about the R code, contact: Steve RalphMorita@users.noreply.github.com

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
