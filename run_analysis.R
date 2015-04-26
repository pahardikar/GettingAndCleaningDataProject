library(dplyr)

# step 1read all the data for analysis
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# step2 Merge the 'Features' files.
x_data <- rbind(x_train, x_test)

mean_and_std_features <- grepl("-(mean|std)\\(\\)", features[,2])

names(x_data) = features[,2]

# Get the measurements on the mean and standard deviation for each measurement.
x_data <- x_data[,mean_and_std_features]

# Merge the activity files.
y_data <- rbind(y_train, y_test)

y_data[, 1] <- activities[y_data[, 1], 2]

names(y_data) <- "activity"

# Merge the subject files.
subject_data <- rbind(subject_train, subject_test)

names(subject_data) <- "subject"

# combine all the data in a single data set by binding on columns.
combined_data <- cbind(x_data, y_data, subject_data)

# step5 Find the mean on all the columns grouped by subject and activity
tidy_data <- combined_data %>% group_by(subject, activity) %>% summarise_each(funs(mean))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)