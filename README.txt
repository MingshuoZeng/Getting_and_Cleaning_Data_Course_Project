Peer-graded Assignment: Getting and Cleaning Data Course Project

This repository is a submission by Mingshuo Zeng for Getting and Cleaning Data course project. It has the instruction on how to run analysis on Human Activity reconition dataset.

Dataset
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files
-"codebook.md": a code book that described the variables, the data, and any transformations or work that I performed to clean up the data.
-"run_analysis.R": perfoems the data preparation and then 5 steps required in the assignment.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the ata set in step 4, creates a second, independent tidy data set with the averate of each variable for each activity and each subject.
-"tidy_data.txt" is the exported final data after going through all the sequences in "run_analysis.R"
