The run_analysis script is used to clean the UCI Machine Learning Repository's 
Human Activity and Recognition Using Smartphones Data Set. The description
and original raw data is below.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script reads in the original data from the study and outputs a tidy data set called
Tidy.txt. Please refer to the CodeBook for specific details regarding the variables
in Tidy.txt.

To create the tidy data set, the script first merges the test and train data from the
original data set. Then the script extracts only measurements which include mean() or
std(), averages and standard deviations. The activity numbers were translated into 
descriptive activity names and added to the dataset with Subject ID codes. The variable
names were also cleaned up from the original data to not include any punctuation marks.
Lastly, the average of each measurement is taken for each Subject and Activity group to
produce a tidy data set of 180 observations of 66 measurements. 