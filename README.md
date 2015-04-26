## run_analysis.R README.md

> Purpose: This project takes various data files from the UCI HAR project and does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set the step above, creates a second, independent tidy data set with the average of each variable for each activity and each subject named tidydata.txt, which appears in the Coursera assignment web page and is included in the GitHub repo as well. 

> Usage

* On the local client machince creates a directory named 'data' under the R working directory
* Download the source data sets from: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> into the data directory defined above
* Uncompress or expand these .zip files into the subdirectory above using the appropriate software
* Save the run_analysis.R processing script to the current R environment working directory.
* Then, from an R Console, source the file as follows: 
```
source('.//run_analysis.R') 
```
 
* When processing completes, an ouput file entitled 'tidydata.txt' will be created which will summarize the average mean and standard deviation values for the 66 selected features for each subject/activity combination. 

> Using tidydata.txt for Additional Research

* To bring the result file, tidydata.txt, into an R instance, run the following, which assumes the tidydata.txt file is located in the current R working directory:

```
df_tidy <- read.table("tidydata.txt")
```


