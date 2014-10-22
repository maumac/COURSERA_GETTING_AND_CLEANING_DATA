# First we have to define the location of the files in our computer.
# In this case I locate them in a directory inside my "working directory"
############ FILES #####################
file_train_set <- "./UCI_HAR_Dataset/train/X_train.txt"
file_train_labels <- "./UCI_HAR_Dataset/train/Y_train.txt"
file_train_subjects <- "./UCI_HAR_Dataset/train/subject_train.txt"
file_test_set <- "./UCI_HAR_Dataset/test/X_test.txt"
file_test_labels <- "./UCI_HAR_Dataset/test/Y_test.txt"
file_test_subjects <- "./UCI_HAR_Dataset/test/subject_test.txt"
file_column_names <- "./UCI_HAR_Dataset/features.txt"
############ FILES #####################


# Afterwards,we have to be sure that the needed packages will be available for
# R when it starts working, so here they are:
############ PACKAGES #####################
library(plyr)
library(dplyr)
library(tidyr)
############ PACKAGES #####################


# Another important thing is to upload, before starting with the work, all the functions that we will use
############ FUNCTIONS #####################
# This are the functions we will use to clean the data.
get_other_files <- function(x){
        file <- read.table(x)
        file <- file[[1]]
        return(file)
}
convert_labels <- function(x){
        x <- sub("1", "WALKING", x)
        x <- sub("2", "WALKING_UPSTAIRS", x)
        x <- sub("3", "WALKING_DOWNSTAIRS", x)
        x <- sub("4", "SITTING", x)
        x <- sub("5", "STANDING", x)
        x <- sub("6", "LAYING", x)
        return(x)
}
get_the_set <- function(x){
        train_widths <- rep(16,561)
        set <- read.fwf(x, widths = train_widths, header = F, buffersize= 100)
        set <- as.data.frame(set)
        column_names <- read.table(file_column_names)
        column_names <- column_names[[2]]
        #column_names <- gsub("-", "_", column_names)
        #column_names <- gsub("\\(|\\)", "_", column_names)
        names(set) <- column_names
        labels <- vector(mode="integer", length=0)
        subjects <- vector(mode="integer", length=0)
        #dataset <- vector(mode="integer", length=0)
        if(any(grep("train", x))){
                labels <- get_other_files(file_train_labels)
                subjects <- get_other_files(file_train_subjects)
                #dataset<- rep("train", 7352)
        }else{
                labels <- get_other_files(file_test_labels)
                subjects <- get_other_files(file_test_subjects)
                #dataset <- rep("test", 2947)
        }
        labels <- convert_labels(labels)
        set$Activity <- labels
        set$Subject <- subjects
        #set$Dataset <- dataset
        #set <- set[moveme(names(set), "Subject first")]
        #set <- set[moveme(names(set), "Activity first")]
        #set <- set[moveme(names(set), "Dataset first")]
        return(set)
}
############ FUNCTIONS #####################


# Now is when the work starts:
########### WORK ########################
# Get the datasets with an appropriate activity name and descriptive variable names
train_set <- get_the_set(file_train_set)
test_set <- get_the_set(file_test_set)
# Merge the databases keeping all their rows
merged_data <- rbind_list(test_set, train_set)
# Extract only the measurements of the mean and standard deviation
means_stds <- grep("mean|std|Activity|Subject|Dataset", names(merged_data), value = T)
means_stds_data <- merged_data[ ,means_stds]
# Create a second independent tidy data set with average of each variable for each activity and each subject
averages_by_subject <- group_by(means_stds_data, Subject)
averages_by_subject <- select(averages_by_subject, -Activity)
averages_by_subject <- summarise_each(averages_by_subject, funs(mean))
names(averages_by_subject)[[1]] <- "ActivityOrSubject"
averages_by_activity <- group_by(means_stds_data, Activity)
averages_by_activity <- select(averages_by_activity, -Subject)
averages_by_activity <- summarise_each(averages_by_activity, funs(mean))
names(averages_by_activity)[[1]] <- "ActivityOrSubject"
# Merge the data sets
merged_averages <- rbind(averages_by_activity, averages_by_subject)
# Write the tidy data set to a text file
write.table(merged_averages, file="./tidy_data_set.txt", row.names=F)
########### WORK ########################
