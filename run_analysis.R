############ FILES #####################
# First we define the location of the files we need
file_train_set <- "./UCI_HAR_Dataset/train/X_train.txt"
file_train_labels <- "./UCI_HAR_Dataset/train/Y_train.txt"
file_train_subjects <- "./UCI_HAR_Dataset/train/subject_train.txt"
file_test_set <- "./UCI_HAR_Dataset/test/X_test.txt"
file_test_labels <- "./UCI_HAR_Dataset/test/Y_test.txt"
file_test_subjects <- "./UCI_HAR_Dataset/test/subject_test.txt"
file_column_names <- "./UCI_HAR_Dataset/features.txt"
############ FILES #####################



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
# The next function "moveme" is a function that I found in the internet
# and I think it is useful, that is why I included in my script.
moveme <- function (invec, movecommand) {
        movecommand <- lapply(strsplit(strsplit(movecommand, ";")[[1]], 
                                       ",|\\s+"), function(x) x[x != ""])
        movelist <- lapply(movecommand, function(x) {
                Where <- x[which(x %in% c("before", "after", "first", 
                                          "last")):length(x)]
                ToMove <- setdiff(x, Where)
                list(ToMove, Where)
        })
        myVec <- invec
        for (i in seq_along(movelist)) {
                temp <- setdiff(myVec, movelist[[i]][[1]])
                A <- movelist[[i]][[2]][1]
                if (A %in% c("before", "after")) {
                        ba <- movelist[[i]][[2]][2]
                        if (A == "before") {
                                after <- match(ba, temp) - 1
                        }
                        else if (A == "after") {
                                after <- match(ba, temp)
                        }
                }
                else if (A == "first") {
                        after <- 0
                }
                else if (A == "last") {
                        after <- length(myVec)
                }
                myVec <- append(temp, values = movelist[[i]][[1]], after = after)
        }
        myVec
}
get_the_set <- function(x){
        train_widths <- rep(16,561)
        set <- read.fwf(x, widths = train_widths, header = F, buffersize= 100)
        set <- as.data.frame(set)
        column_names <- read.table(file_column_names)
        column_names <- column_names[[2]]
        names(set) <- column_names
        labels <- vector(mode="integer", length=0)
        subjects <- vector(mode="integer", length=0)
        dataset <- vector(mode="integer", length=0)
        if(any(grep("train", x))){
                labels <- get_other_files(file_train_labels)
                subjects <- get_other_files(file_train_subjects)
                dataset<- rep("train", 7352)
        }else{
                labels <- get_other_files(file_test_labels)
                subjects <- get_other_files(file_test_subjects)
                dataset <- rep("test", 2947)
        }
        labels <- convert_labels(labels)
        set$Activity <- labels
        set$Subject <- subjects
        set$Dataset <- dataset
        set <- set[moveme(names(set), "Subject first")]
        set <- set[moveme(names(set), "Activity first")]
        set <- set[moveme(names(set), "Dataset first")]
        return(set)
}
get_averages_by_subject <- function(x){
        subjects <- c("Subject_1", "Subject_2", "Subject_3", "Subject_4", "Subject_5", "Subject_6", "Subject_7", 
                      "Subject_8", "Subject_9", "Subject_10", "Subject_11", "Subject_12", "Subject_13", "Subject_14", 
                      "Subject_15", "Subject_16", "Subject_17", "Subject_18", "Subject_19", "Subject_20", "Subject_21", 
                      "Subject_22", "Subject_23", "Subject_24", "Subject_25", "Subject_26", "Subject_27", "Subject_28", 
                      "Subject_29", "Subject_30")
        x_2 <- x[, 4:82]
        data_frame <- data.frame(subjects)
        for(i in 1:79){
                column <- tapply(x_2[[i]],x$Subject, mean)
                data_frame[[i]] <- column
                
        }
        names(data_frame) <- names(x_2)
        data_frame$ActivityOrSubject <- subjects
        data_frame <- data_frame[moveme(names(data_frame), "ActivityOrSubject first")]
        return(data_frame)
}
get_averages_by_activity <- function(x){
        Activities <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                        "SITTING", "STANDING", "LAYING")
        x_2 <- x[, 4:82]
        data_frame <- data.frame(Activities)
        for(i in 1:79){
                column <- tapply(x_2[[i]],x$Activity, mean)
                data_frame[[i]] <- column
                
        }
        names(data_frame) <- names(x_2)
        data_frame$ActivityOrSubject <- Activities
        data_frame <- data_frame[moveme(names(data_frame), "ActivityOrSubject first")]
        return(data_frame)
}
############ FUNCTIONS #####################



########### WORK ########################
# Get the datasets with an appropriate activity name and descriptive variable
# names
train_set <- get_the_set(file_train_set)
test_set <- get_the_set(file_test_set)

# Merge the databases keeping all their rows
merged_data <- rbind(test_set, train_set)

# Extract only the measurements of the mean and standard deviation
means_stds <- grep("mean|std|Activity|Subject|Dataset", 
                   names(merged_data), value = T)
means_stds_data <- merged_data[ ,means_stds]

# Second independent tidy data set with average of each variable for each
# activity and each subject (ordering the means_stds_data)
averages_by_subject <- get_averages_by_subject(means_stds_data)
averages_by_activity <- get_averages_by_activity(means_stds_data)
merged_averages <- rbind(averages_by_activity, averages_by_subject)

# Write the tidy data set to a text file
write.table(merged_averages, file="./tidy_data_set.txt", row.names=F)

########### WORK ########################
