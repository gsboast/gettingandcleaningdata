## run_analysis.R README.md

This project takes various data files from the UCI HAR project and does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set the step above, creates a second, independent tidy data set with the average of each variable for each activity and each subject named tidydata.txt, which appears in the Coursera assignment web page and is included in the GitHub repo as well. 

> Process

```
df_tidy <- read.table(".//tidydata.txt")




