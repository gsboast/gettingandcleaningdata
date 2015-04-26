# run_analysis.R - Purpose: Construct a tidy data set from various UCI HAR data sets. 
       
        # Number 1 - Read training and test sets and their associated training and test labels 
        # Load and Combine Test and Training Data Sets and Test and Training class labels via
        # read.table() and row binding.

        library(dplyr)
        x_training_set <- read.table("./data/train/x_train.txt", sep = "", header = FALSE)
        x_test_set <-  read.table("./data/test/x_test.txt", sep = "" , header = FALSE)

        y_training_labels <- read.table("./data/train/y_train.txt", sep = "", header = FALSE)
        y_test_labels <- read.table("./data/test/y_test.txt", sep = "" , header = FALSE)

        # Combine all data and labels into two data frames used in the rest of the script

        df_data   <- rbind(x_training_set, x_test_set)
        df_labels <- rbind(y_training_labels, y_test_labels)

        # Using row binding, load and combine subject/volunteer files for above 
        # Each counter identifies the subject who performed the activity for each sample. 

        subject_train <- read.table("./data/train/subject_train.txt", sep = "", header = FALSE)
        subject_test  <- read.table("./data/test/subject_test.txt", sep = "", header = FALSE)
        df_subjects   <- rbind(subject_train, subject_test)

        # Number 2 - Only applicable features 

        # First, load all features, then isolate and extract only those variables that contain the 
        # 33 mean() and 33 std() gyro and acceleration values via an index for 66 distinct variables 
        # applicable to each subject and activity:
 
        df_features <- read.table("./data/features.txt", sep = "", header = FALSE)
        isolate_col_idx <- grep("mean\\(\\)|std\\(\\)", df_features[, 2], ignore.case=TRUE)
        df_data <- df_data[, isolate_col_idx]

        # Clean-up variable names using names() and gsub() with regular expressions to get and
        # set variable object names per tidy data principles of avoiding use of non-alphabetic 
        # characters. The variables are left or converted to mixed case lowerCase Camel style 
        # to retain meaning
       
        names(df_data)  <- gsub("\\(|\\)|\\)|\\(", "", df_features[isolate_col_idx, 2])   # Eliminate '()'
        names(df_data)  <- gsub(",", "", names(df_data))                      # Eliminate commas ','        
        names(df_data)  <- gsub("tBody", "timeBody", names(df_data))          # Add 'time' to time-based
        names(df_data)  <- gsub("tGravity", "timeGravity", names(df_data))    # Add 'time' to more time-based 
        names(df_data)  <- gsub("fBody", "freqBody", names(df_data))          # Add 'freq' to frequency-based 
        names(df_data)  <- gsub("fbody", "freqBody", names(df_data))          # Add 'freq' to more frequency-based 
        names(df_data)  <- gsub("-", "", names(df_data))                      # Eliminate embedded dashes '-'
        names(df_data)  <- gsub("BodyBody","Body",names(df_data))             # Eliminate redundant 'Body'
        names(df_data)  <- gsub("mean","Mean",names(df_data))                 # Upper case mean measurements
        names(df_data)  <- gsub("std","Std",names(df_data))                   # Upper case std measurements

        # Number 3 - Load all Activities, which are the links between class labels and their activity name.
        # Create activity counter index and then apply activity names in column 2 or V2 of 
        # activities to lables data frame in lower case format
        
        df_activities <- read.table("./data/activity_labels.txt", sep = "", header = FALSE)
        df_activities[, 2] <- gsub("_", "", tolower(as.character(df_activities[, 2])))
        df_labels[,1] <- df_activities[df_labels[,1],2]    

        # Number 4 -  Appropriately label the data set with descriptive variable names. 
        # Rename variables / column headings appropriately with the dplyr function select()
        # then bind the subjects and activities with the numeric value data set to create
        # the preliminary data frame to be used in the final step

        names(df_subjects)   <- "subject"
        names(df_labels)     <- "activity"
        activity_vector      <- c("code","activity")
        names(df_activities) <- activity_vector
        df_pre_tidy          <- cbind(df_subjects, df_labels, df_data)
    
        # Number 5 - From the data set in step 4, create a second, independent tidy data set 
        # with the average of each variable for each activity and each subject. Uses a
        # nested for next loop to pass each subject and each activity to calc average of 
        # the 66 mean and std variables for each subject activity pair observation. 
          
        distinctsubjects     <- distinct(select (df_subjects,subject ))
        distinctsubjects     <- sort(distinctsubjects[, 1])  #  Sorted subjects for nested loop
        totalsubjects        <- length(distinctsubjects)
        totalactivities      <- dim(distinct(select (df_activities,activity )))[1]
        totalobservations    <- totalsubjects  *totalactivities                                     
        totfeatures          <- dim(df_pre_tidy)[2]

        df_tidy = df_pre_tidy[1:(totalobservations), ]
        counter <- 1
        for (sbj in 1:totalsubjects) {
              for (act in 1:totalactivities) {
              df_tidy[counter, 1] <- distinctsubjects[sbj]
              df_tidy[counter, 2] <- df_activities[act, 2]
              targetactivityvector <- df_activities[act, 2]
              df_calc <- df_pre_tidy[df_pre_tidy$subject==sbj & df_pre_tidy$activity==targetactivityvector, ]
              df_tidy[counter, 3:totfeatures] <- colMeans(df_calc[, 3:totfeatures])
              counter <- counter + 1
             }
        }
        tidy_out <- arrange(df_tidy, subject, activity)
        write.table(tidy_out, "tidydata.txt", row.names=FALSE)


     












