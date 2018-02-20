# GETTING & CLEANING DATA Peer Graded Assignment

# Preparation:

## Install & load packages
if (!require("reshape2")) {
        install.packages("reshape2")
}
library(reshape2)

if (!require("data.table")) {
        install.packages("data.table")
}
library(data.table)

## Download & unzip data

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zips <- "harzip.zip"
directory <- "hardir"

if(!file.exists(zips)){
        download.file(url,zips, mode = "wb")
}
if(!file.exists(directory)){
        unzip(zips, files = NULL, exdir=".")
}

## Read data into R
message("Reading data into R...")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt") 
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
readme <- readLines("UCI HAR Dataset/README.txt")


# STEP 1
## Merge the training and the test sets to create one data set.

message("Merging the training and the test sets to create one data set...")

Xdataset <- rbind(X_train, X_test)

message("Doing the same for labels and subjects...")

ylabels <- rbind(y_train, y_test)
subjects <- rbind(subject_train, subject_test)

# STEP 2
## Extract only the measurements on the mean and standard deviation 
## for each measurement.

message("Extracting measurements on mean and standard deviation...")

meanorstd <- grep("mean()|std()", features$V2)
Xdataset <- Xdataset[,meanorstd]

# STEP 3
## Use descriptive activity names to name the activities in the data set

message("Naming activities in the data set ...")

nameclean <- function(a){
        gsub("[()]", "", a)
}
newnames <- sapply(features[,2], nameclean)

# STEP 4
## Appropriately label the data set with descriptive variable names.

names(Xdataset) <- newnames[meanorstd]
names(subjects) <- "subject_ID"
names(ylabels) <- "activity"

##  Combine all data into one set and label each activity

message("Combining data into one set...")
dats <- cbind(subjects, ylabels, Xdataset)

actions <- as.factor(dats$activity)
levels(actions) <- activity_labels$V2
dats$activity <- actions

# STEP 5
## Use this data to create a second, independent tidy data set with the 
## average of each variable for each activity and each subject.

message("Recasting data set to show mean values for each variable by subject ID and activity...")
tidy <- melt(dats, id=c("subject_ID", "activity")) %>% dcast(subject_ID + activity ~ variable, mean)
names(tidy)[-c(1,2)] <- paste("Mean of",names(tidy)[-c(1,2)])

## Write tidy data to file

message("Writing tidy data to a text file: tidydata.txt (comma-separated)...")
write.table(tidy, file="tidydata.txt", sep = ",", row.names = F)

##ENDE