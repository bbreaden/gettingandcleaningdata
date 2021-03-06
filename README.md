# Peer Graded Assignment for Getting and Cleaning Data
Part of  Data Science Specialization on Coursera

The script "run_analysis.R" reformats the data contained in the 
"Human Activity Recognition Using Smartphones Data Set" for further analysis
and saves a 'tidy' copy to "tidydata.txt" in the working directory. The script
works by first installing necessary R packages (I use reshape2 especially to 
melt and recast the data at step 5), if these are not already installed. 
It then downloads (and unzips) the zip folder if not already done, and reads
each file into a variable in r.

The script then reformats and combines the data and labels that were read from 
the zipped files, according to step 1 to 5 of the project instructions.

STEP 1
Merge the training and the test sets to create one data set.

STEP 2
Extract only the measurements on the mean and standard deviation for each 
measurement.

STEP 3
Use descriptive activity names to name the activities in the data set

STEP 4
Appropriately label the data set with descriptive variable names.

STEP 5
Use this data to create a second, independent tidy data set with the average 
of each variable for each activity and each subject.

The details of each step are shown as comments in the R code ("run_analysis.R").
The script also prints messages to the r console to tell the user what it is
doing.

Finally the script writes the 'tidy' dataset to a text file (comma-separated)
called "tidydata.txt" in the working directory.

This is the same as the "tidydata.txt" file in this repo.

Please see the "codebook.md" file for more details of each variable in the R script.
