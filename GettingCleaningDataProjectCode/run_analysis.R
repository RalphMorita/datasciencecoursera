## setting the working directory. make sure this is commented out when you run it on a different environment
#setwd('/home/steve/R/GettingCleaningData/')

## Project Requirement: You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. -N.B. this is a somewhat vague instruction. more on that later...
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## uncomment to download the data  and save them to a file called 'Smartphone.zip'
#fileurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
#download.file(fileurl, 'Smartphone.zip', method='curl')

## uncomment to unzip the downloaded file. This will create a folder called "UCI HAR Dataset" that contains the data that we need for this project
#unzip('Smartphone.zip')
#setwd('UCI HAR Dataset') #this code NEEDS be run from the UCI HAR Dataset directory!!!

## it is assumed that the data has been downloaded and that this R script is located in the UCI HAR Dataset folder.

## first, create the activity_labels dataframe. this should result in 2 columns "code" and "description"
activity_labels <- read.table('activity_labels.txt', col.names = c('code', 'description'))

## Create a data frame for the features. Then use regular expressions to make into a vector that is more readable. 
## This will be used to label the the columns in the dataset with descriptive terms
features <- read.table('features.txt')
features2 <- gsub("[[:punct:]]+", '_', features$V2)
features2 <- gsub("_$", "", features2)

## next create the x_train/x_test and y_train/y_test dataframes. 
## Also, let's rename the columns in the x_train and x_test with the values in the features dataframe with the col.names option
x_train <- read.table('train/X_train.txt', col.names=features2)
x_test <- read.table('test/X_test.txt', col.names=features2)

## Using the grep function, subset the the x_train/x_test data in accordance with requirement 2: "Extracts only the measurements on the mean and standard deviation for each measurement".
## As mentioned earlier, this is a vague requirement since there are some features that end in mean()-axis/std()-axis indicating that these are the mean/std for the feature 
## i.e. "tBodyAcc-mean()-X" would be the mean of tBodyAcc along the X axis
## however some features contain mean/std in their names
## i.e. "fBodyAcc-meanFreq()-X" would be the weighted average of the frequency components to obtain a mean frequency for fBodyAcc along the X axis
## it is my interpretation that these latter Freq values should not be included as they capture the frequency not the mean
## if you disagree and feel that they meanFreq() values should be included, please uncomment the two lines below:
#x_train2 <- x_train[, grep("[Mm]ean|std", colnames(x_train))] 
#x_test2 <- x_test[, grep("[Mm]ean|std", colnames(x_test))] 
## if you uncommented the two lines above, please comment the following two lines
x_train2 <- x_train[, grep("[Mm]ean[_$]|std", colnames(x_train))] 
x_test2 <- x_test[, grep("[Mm]ean[_$]|std", colnames(x_test))] 

## phew. I'm glad we got through that bit of messiness ;)
## now lets create a data frame for the y_train/y_test. These will create single column data frames containing the activity code for each measurement in the x_train/x_test labeled 'code'
y_train <- read.table('train/y_train.txt', col.names='code')
y_test <- read.table('test/y_test.txt', col.names='code')

## and, of course, the subject numbers need to be created as a dataframe under the column name "subject.id"
subject_train <- read.table('train/subject_train.txt', col.names="subject.id")
subject_test <- read.table('test/subject_test.txt', col.names="subject.id")

## At this point, we should have all of our data frames created and it is time to put them together.

## now, bind the y_train/y_test data frames to the x_train/x_test dataframes and the subject.ids from the subject_train/subject_test data frames
## first use cbind to bind the activities code to the measuremeants for the train and test data
train <- cbind(y_train, x_train2)
test <- cbind(y_test, x_test2)
## then use cbind to bind the subject.id to the train and test data
train <- cbind(subject_train, train)
test <- cbind(subject_test, test)

## join the train and test data. This should complete Requirement 1.
## Use teh rbind() function to create the combined data frame
combined <- rbind(train, test)

## Requirement 3 is to use descriptive activity names to name the activities in the data set
## These descriptive activity names are found in the activity_labels data frame
## add the activity_names to the combined data frame by 'code' and create a new data frame called labeled_combined
## but, since merge will mess up the original order, add a column called 'order' to resort back to the original order after merging
combined$order <- 1:nrow(x = combined) 
labeled_combined <- merge(activity_labels, combined, by = 'code')
labeled_combined <- labeled_combined[,2:65] #remove the code column as it is no longer needed now that we have descriptive terms
labeled_combined <- arrange(labeled_combined, labeled_combined$order) #this re-sorts to the original order

## Requirement 5 is to create a second, independent tidy data set with the average of each variable for each activity and each subject from the data set in step 4
## aggregate the data by mean for description (Activity Name) and subject.id
MeanData <-aggregate(labeled_combined[,3:63], by=list(Activity = labeled_combined$description, Subject = labeled_combined$subject.id), FUN=mean, na.rm=TRUE)

## output the tidy data set as a text file with write.table() using row.name=FALSE
if(!file.exists("../OutputFiles") )dir.create("..OutputFiles") #create the OutputFiles directory to store the output if it doesn't already exist
write.table(MeanData, "../OutputFiles/MeanData.txt", row.names = FALSE)
