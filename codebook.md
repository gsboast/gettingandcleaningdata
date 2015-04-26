##Code Book for Getting and Cleaning Data - gsboast April 2015 
### run_analysis.R - 
Using the the University of California Irvine (UCI) Human Activity Recognition (HAR) Smartphones data sets, a series of cleaning and tidying steps were performed to output a final tidy data set file that could be used for further analysis consisting of the means of all related mean() and standard deviation,or std(), feature variables in the original data sets.

##### Citation of Data Source

The data sets used in this project are avaiable from the following site[1]:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

##### Use of the UCI HAR data requires the follwoing citation: [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

###R Data Transformations

> As part of this project, the folloeing transformations and coversions were made to the original UCI HAR data set via donwloading the original files and then using a run_analysis.R script to combine and transform the data as follows:

#### Data files -
* Combined the './train/X_train.txt' Training set with './test/X_test.txt Test set.
*
#### Label files - 
* Combined the 'train/y_train.txt' Training labels with './test/y_test.txt'Test labels.

#### Subject and Activity Files
* Loaded and combined the 'test/subject_test.txt'  and 'train/subject_train.txt' files 
* Loaded and cleaned 'all_activity.txt' into lowercase variable names.

#### Features
* The 561 possible features were narrowed down to a specific 66 varibles related to  pure mean and standard deviation variables. 

####  Cleaning Steps to deliver final tidydata.txt
* A data frame was created called data_pre_tidy, which was the union of the subjects, activities, and 66 data variables of the mean() and std() variables extracted from the possible 561 total variables in the test data sets. The following operations were performed to clean the source data to adhere to tidy data principles:

1. All subject observations were summarized as one row for each of the six activities per subject with and all variable values appearing in one of 66 columns for a newly calculated mean of the mean() and std() variables. The final data set's dimensions are 180 x 68 = 30 subjects * 6 activities X 66 mean data variables for each.
2. Special caharters were removed (Dashes, underscores, parantheses, commas, et.c)
3. While all lowercase is preferred by tidy data principles, CamelCase was used, which is the practice of naming complex variable names such that each word or abbreviation begins with a capital letter, with the exception of the first word, which is an accepted R programming variable naming convention. 
4. All data variables were remaned to make them more descriptive and meaningful as in the following example:
>    tGravityAcc-mean()-Z -> timeGravityAccMeanZ 
* t was repalced with time for time-base variables
* f was replaced with freq for frequency-based variables
* X, Y, and Z coordinate variables are easily identified

5. The subjects, activities, and the means of each mean() and std() variables were finally comined into one ourput file. TidyData.txt whihc could be read into R with the read.table() function. 

###Variables appearing in final tidy data set and their meaning, values, and data types:

#### Subject - Identifies subject number representing each volunteer

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.  

######Values:
> Integer data type
* (1:30)


####Activity - volunteer's physical task at the time sensor reading was taken
>Each volunteer performed six activities as follows:

###### Values:

> Character data type

*            laying
*           sitting
*          standing
*           walking
*   walkingupstairs
* walkingdownstairs

#### Features 

The R sciprt took the column means of the 66 selected features for the follwoing feature vraibles for each subject/activity pair. The original feature variables, from which the column means were caluclated for the subject activity pairs, can be described as:

* The accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

#### Feature Naming in run_analysis.R and tidydat.txt

> Double (numeric) data type

>Variables are named either:
*Time-based (time)
*Fast Fourier Transform Frequency Based (freq)

>freq-based

>Mean features of the Means and Std. Deviations of Frequency (freq) Accelerometer - Total Acceleration (Acc) for Body Linear (Body) Jerk (Jerk) signals Magnitude(Mag) Mean and Standard Deviaiton includeding X, Y, and Z coordinate values:  		

* freqBodyAccJerkMagMean			
* freqBodyAccJerkMagStd			
* freqBodyAccJerkMeanX			
* freqBodyAccJerkMeanY			
* freqBodyAccJerkMeanZ			
* freqBodyAccJerkStdX			
* freqBodyAccJerkStdY			
* freqBodyAccJerkStdZ			
* freqBodyAccMagMean			
* freqBodyAccMagStd			
* freqBodyAccMeanX			
* freqBodyAccMeanY			
* freqBodyAccMeanZ			
* freqBodyAccStdX			
* freqBodyAccStdY			
* freqBodyAccStdZ			


>Mean of the features: Fast Fourier Transform Frequency (Freq) of estimated body (Body) Triaxial Angular velocity from the gyroscope (Gyro) sensor	Magnitude, mean and standard deviations:	

* freqBodyGyroJerkMagMean			
* freqBodyGyroJerkMagStd			
* freqBodyGyroMagMean			
* freqBodyGyroMagStd			
* freqBodyGyroMeanX			
* freqBodyGyroMeanY			
* freqBodyGyroMeanZ			
* freqBodyGyroStdX			
* freqBodyGyroStdY			
* freqBodyGyroStdZ			
>	Time Based Body Accelerometer Sensor Toatl Acceleartion Jerk signals and Magnitude and mean and std calcs. 
* timeBodyAccJerkMagMean			
* timeBodyAccJerkMagStd			
* timeBodyAccJerkMeanX			
* timeBodyAccJerkMeanY			
* timeBodyAccJerkMeanZ			
* timeBodyAccJerkStdX			
* timeBodyAccJerkStdY			
* timeBodyAccJerkStdZ			
* timeBodyAccMagMean			
* timeBodyAccMagStd			
* timeBodyAccMeanX			
* timeBodyAccMeanY			
* timeBodyAccMeanZ			
* timeBodyAccStdX			
* timeBodyAccStdY			
* timeBodyAccStdZ			
>	Time Based Body Gyroscopic (Gyro) Sensor for jerk signals to include the overall magnitude, mean and std and the indiviudal X-Y-Z coordinate direction values.
* timeBodyGyroJerkMagMean			
* timeBodyGyroJerkMagStd			
* timeBodyGyroJerkMeanX			
* timeBodyGyroJerkMeanY			
* timeBodyGyroJerkMeanZ			
* timeBodyGyroJerkStdX			
* timeBodyGyroJerkStdY			
* timeBodyGyroJerkStdZ			
* timeBodyGyroMagMean			
* timeBodyGyroMagStd			
* timeBodyGyroMeanX			
* timeBodyGyroMeanY			
* timeBodyGyroMeanZ			
* timeBodyGyroStdX			
* timeBodyGyroStdY			
* timeBodyGyroStdZ	
> 
>Time Based Gravity Accelerometer signals: total acceleration magnitude (Mag), Mean, and Std overall and for the X-Y-Z coordinate directions. 
* timeGravityAccMagMean			
* timeGravityAccMagStd			
* timeGravityAccMeanX			
* timeGravityAccMeanY			
* timeGravityAccMeanZ			
* timeGravityAccStdX			
* timeGravityAccStdY			
* timeGravityAccStdZ			
