The run_analysis.R script performs the data preparation followed by the 5 steps as required in the assignment.

1. Download and unzipped the datasets
    Dataset downloaded and extracted under the folder called "UCI HAR Dataset".

    
2. Got list of files and assigned each data (.txt files) to variables.
    dataActivityTest <- "test/y_test.txt": 2947 rows, 1 column
      contains activity labels of test data.
    dataActivityTrain <- "train/y_train.txt": 7352 rows, 1 column
      contains activity labels of train data.
    dataSubjectTest <- "test/subject_test.txt": 2947 rows, 1 column
      contains subject ID of test data.
    dataSubjectTrain <- "train/subject_train.txt": 7352 rows, 1 column
      contains subject ID of train data.
    dataFeatureTest <- "test/X_test.txt": 2947 rows, 561 columns
      contains recorded features of test data.
    dataFeatureTrain <- "train/X_train.txt": 7352 rows, 561 columns
      contains recorded features of train data.
      

3. Merged test and train data sets to create one data set. (Assignment 1)
    dataActivity (10299 rows, 1 column) is created by merging dataActivityTrain and dataActivityTest using bind_rows() function.
    dataSubject (10299 rows, 1 column) is created by merging dataSubjectTrain and dataSumjectTest using bind_rows() function.
    dataFeatures (10299 rows, 561 columns) is created by merging dataFeatureTrain and dataFeatureTest using bind_rows() function.
    
    "activityID" was assigned as column name of dataActivity.
    "subject" was assigned as column name of dataSubject.
    
    dataFeaturesNames <- "features.txt": 561 rows, 2 columns
      contains names of features of train data.
      
    "dataFeaturesNames$V2", 2nd column of dataFeaturesNames, was assigned as column names of dataFeatures.
    
    dataCombine (10299 rows, 2 columns) is created by merging dataActivity and dataSubject using bind_cols() function.
    Data (10299 rows, 563 columns) is created by merging dataCombine and dataFeatures using bind_cols() function.
    

4. Extracted only the measurements on mean and standard deviation for each measurement. (Assignment 2)
    SelectedData (10299 rows, 66 columns) is created by selecting only columns with "mean()" and "std()" using select() function.
    Data2 (10299 rows, 68 columns) is created by merging SelectData and dataActivity and dataSubject using bind_cols() function.
    
    
5. Used descriptive activity names to name the activities in the data set. (Assignemnt 3)
    ActicityLabels <- "activity_labels.txt": 6 rows, 2 columns
    "activityID" and "activity" was assigned as column names of Activity Labels.
    Data3 (10299 rows, 69 columns) is created by combining Data2 and ActivityLabels by "activityID" using left_join() function.
    Data4 (10299 rows, 68 columns) is created by removing "activityID" column using select() function.
    
    
6. Appropriately labeled the data set with descriptive variable names. (Assignment 4)
    All "Acc" in column's name replaced by "Accelerometer".
    All "Gyro" in column's name replaced by "Gyroscope".
    All "BodyBody" in column's name replaced by "Body".
    All "Mag" in column's name replaced by "Magnitude".
    All start with character "t" in column's name replaced by "Time".
    All start with character "f" in column's name replaced by "Frequency".
    All "-mean()" in column's name replaced by "Mean".
    All "-std()" in column's name replaced by "STD".
    
    
7. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject. (Assignemnt 5)
    Data5 (128 rows, 68 columns) is created by summarizing Data4 taking the means of each variables after grouped by subject and activity.
    Exported Data5 into "tidy_data.txt" file.
    
    
    
    
    
    