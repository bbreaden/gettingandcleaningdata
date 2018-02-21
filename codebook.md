Peer Graded Assignment for Getting and Cleaning Data
Part of Data Science Specialization on Coursera

1. What the Script Does

The script "run_analysis.R" reformats the data contained in the "Human Activity Recognition Using Smartphones Data Set" for further analysis and saves a 'tidy' copy to "tidydata.txt" in the working directory. The script works by first installing necessary R packages (I use reshape2 especially to melt and recast the data at step 5), if these are not already installed. It then downloads (and unzips) the zip folder if not already done, and reads each file into a variable in r.

The script then reformats and combines the data and labels that were read from the zipped files, according to step 1 to 5 of the project instructions.

The details of each step are shown as comments in the r code ("run_analysis.R"). The script also prints messages to the r console to tell the user what it is doing.

Finally the script writes the 'tidy' dataset to a text file (comma-separated) called "tidydata.txt" in the working directory.

2. Variables

"activity_labels" contain the labels (character strings) describing each variable.

"features" contains data from the features.txt file. 

"subject_test" and "subject_train" contain vectors with test and training data on the subjects.
  These are combined into "subjects" which contains both.

"X_test" and "X_train" contain data frames with the main test and training data.
  These are combined (using rbind) into "Xdataset" which contains both.

"y_test" and "y_train" are vectors containing the activities data from the test and training files.
  These are combined into "ylabels" which contains both.

"dats" combines "subjects", "ylabels" and "Xdataset" into one data frame.

"actions" uses "activity_labels" to name the activities in "dats" (originally the data from "ylabels").

"tidy" is the result of melting and recasting "dats" to show the averages for each subject and activity.
  This is then written into the "tidydata.txt" file.
