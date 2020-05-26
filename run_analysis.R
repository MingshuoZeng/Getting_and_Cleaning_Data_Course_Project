# DOwnload the file and put the file in the data folder
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip", method = "curl")

# Unzip the file to data folder
unzip(zipfile = "./data/Dataset.zip", exdir = "./data")

# Get list of the files
path_rf <- file.path("./data", "UCI HAR Dataset")
files <- list.files(path_rf, recursive = TRUE)
files

# Read activity files
dataActivityTest <- read.table(file.path(path_rf, "test", "y_test.txt"), header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "y_train.txt"), header = FALSE)

# Read subject files
dataSubjectTest <- read.table(file.path(path_rf, "test", "subject_test.txt"), header = FALSE)
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"), header = FALSE)

# Read feature files
dataFeatureTest <- read.table(file.path(path_rf, "test", "X_test.txt"), header = FALSE)
dataFeatureTrain <- read.table(file.path(path_rf, "train", "X_train.txt"), header = FALSE)

# 1. Merges the training and the test sets to create one data set
library(dplyr)
dataActivity <- bind_rows(dataActivityTrain, dataActivityTest)
dataSubject <- bind_rows(dataSubjectTrain, dataActivityTest)
dataFeatures <- bind_rows(dataFeatureTrain, dataFeatureTest)

colnames(dataActivity) <- c("activityID")
colnames(dataSubject) <- c("subject")
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"), header = FALSE)
colnames(dataFeatures) <- dataFeaturesNames$V2

dataCombine <- bind_cols(dataSubject, dataActivity)
Data <- bind_cols(dataFeatures, dataCombine)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
SelectedData <- select(Data, contains("mean()"), contains("std()"))
Data2 <- bind_cols(SelectedData, dataSubject, dataActivity)

# 3. Uses descriptive activity names to name the activities in the data set
ActivityLabels <- read.table(file.path(path_rf, "activity_labels.txt"), header = FALSE)
colnames(ActivityLabels) <- c("activityID", "activity")
Data3 <- left_join(Data2, ActivityLabels, by="activityID")
Data4 <- select(Data3, -"activityID")

# 4. Appropriately labels the data set with descriptive variable names
names(Data4) <- gsub("Acc", "Accelerometer", names(Data4))
names(Data4) <- gsub("Gyro", "Gyroscope", names(Data4))
names(Data4) <- gsub("BodyBody", "Body", names(Data4))
names(Data4) <- gsub("Mag", "Magnitude", names(Data4))
names(Data4) <- gsub("^t", "Time", names(Data4))
names(Data4) <- gsub("^f", "Frequency", names(Data4))
names(Data4) <- gsub("-mean()", "Mean", names(Data4), ignore.case=TRUE)
names(Data4) <- gsub("-std()", "STD", names(Data4), ignore.case=TRUE)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
#    of each variable for each activity and each subject.
Data5 <- Data4 %>% 
         group_by(subject, activity) %>% 
         summarize_all(funs(mean))
write.table(Data5, file = "tidy_data.txt", row.name = FALSE)



