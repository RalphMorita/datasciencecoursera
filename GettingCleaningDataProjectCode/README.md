#This is the Project folder for the Getting and Cleaning Data with R Course Project
## Thank you for taking the time to evaluate my assignment!

##Overview

###Project Requirement: You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement. -N.B. this is a somewhat vague instruction. more on that later...
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Inputs and Outputs
The R code uses the datasets found at this [site](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
Once downloaded and unziped there will be a directory called 'UCI HAR Dataset' containing the input files and additional information about these files.
_*It is imperative that the R code be saved to this directory*_.
The provided R code contains lines that will download and unzip these file if they are not already available. Simply uncomment and run the appropriate lines


__it is assumed that the data has been downloaded and that this R script is located in the UCI HAR Dataset folder__


I have also included the unzipped data in this [directory](https://github.com/RalphMorita/datasciencecoursera/tree/master/UCI%20HAR%20Dataset)

The R code will process the data and produce a tiny dataset MeanData.txt.

This output file is space delimited file containing the Mean values for the appropriate measures in the UCI HAR Dataset data summarized by Activity and Subject.
It is assumed that this output file will be stored in a folder called OutputFiles. The OutputFiles directory should be a the same directory level as the OCI HAR Dataset directory (the working directory).
This output file can be found [here](https://github.com/RalphMorita/datasciencecoursera/blob/master/OutputFiles/MeanData.txt)

####A note about the measures used in the tidy dataset
Requirement 2 states: "Extracts only the measurements on the mean and standard deviation for each measurement".

This is a vague requirement since there are some measures that end in mean()-*axis*/std()-*axis* indicating that these are the mean/std for the measure.
(i.e. "tBodyAcc-mean()-X" would be the mean of tBodyAcc along the X axis)
_however_ some features contain mean/std in their names
(i.e. "fBodyAcc-meanFreq()-X" would be the weighted average of the frequency components to obtain a mean frequency for fBodyAcc along the X axis).
It is my interpretation that these latter Freq values should not be included as they capture the mean frequency and __not__ the mean.
If you disagree and feel that they meanFreq() values should be included, I have included some additional code to inlcude those values as well. 
Simply uncomment/comment the appropriate lines as described in the R code

####A note about measure names
In order to improve the readability of the column names, I replaced any punctuation (periods, brackets, etc.) with underscores. 

More information can be found by reading the codebook included with the R Code in this directory.
Thanks again



