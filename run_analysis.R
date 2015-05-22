## run_analysis.R
## Getting and Cleaning Data Course Project
## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## 1. Setup - load all required packages and libraries  
if (!require("data.table")) {
    install.packages("data.table")
}

if (!require("reshape2")) {
    install.packages("reshape2")
}

require("data.table")
require("reshape2")

## 2. Download the raw data to the working directory  
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip", method="curl")


## 3. unzip the dataset downloaded  
unzip("dataset.zip")

## 4. Load activity labels and data column names  
# Activity
actlabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Data column names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract only the measurements on the mean and standard deviation for each measurement.
featuresextract <- grepl("mean|std", features)

## 5. Load and process the test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X_test) = features

# Only want the measurements on the mean and standard deviation
X_test = X_test[,featuresextract]

# Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

## 6. Load and process the train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(X_train) = features

# Only want the measurements on the mean and standard deviation
X_train = X_train[,featuresextract]

# Load activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

## 7. Merge the test and train data into a single data set  
data = rbind(test_data, train_data)

## 8. Tidy the dataset from step 7 using the melt() function  
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data   = melt(data, id = id_labels, measure.vars = data_labels)

## 9. Apply the mean to all variables  
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

## 10. Write our tidy dataset out to "tidy_data.txt" in the working directory  
write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)
