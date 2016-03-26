Getting and Cleaning Data Course Project

Original Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities
 (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
 Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
 The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the 
 volunteers was selected for generating the training data and 30% the test data. 
 
 
Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width 
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and 
body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force 
is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 
features was obtained by calculating variables from the time and frequency domain.
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix ‘t’ to denote time) were captured at a constant rate of 50 Hz. and the acceleration signal was then separated 
into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) – both using a low pass Butterworth filter.
The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also 
the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag). A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to indicate frequency domain signals).
All this data are avaliable in the original files.

Description of abbreviations of measurements

leading t or f is based on time or frequency measurements.
Body = related to body movement.
Gravity = acceleration of gravity
Acc = accelerometer measurement
Gyro = gyroscopic measurements
Jerk = sudden movement acceleration
Mag = magnitude of movement

The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.


tBodyAcc-XYZ: unit g
tGravityAcc-XYZ: unit g
tBodyAccJerk-XYZ: g/sec
tBodyGyro-XYZ: rad/sec
tBodyGyroJerk-XYZ: rad/sec/sec
tBodyAccMag: unit g
tGravityAccMag: unit g
tBodyAccJerkMag: g/sec
tBodyGyroMag: rad/sec
tBodyGyroJerkMag: rad/sec/sec
fBodyAcc-XYZ: unit g
fBodyAccJerk-XYZ: g/sec
fBodyGyro-XYZ: rad/sec
fBodyAccMag: unit g
fBodyAccJerkMag: g/sec
fBodyGyroMag: rad/sec
fBodyGyroJerkMag: rad/sec/sec

We generated an added a tidydafile named Completed.txt.
 
In this file we 
- Merge the training and the test sets to create one data set.
- Extract only the measurements on the mean (mean())and standard deviation (std()) for each measurement.
- Uses the descriptive activity names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.

The file contain measurements for 30 subjects and 6 activities for each subject and 66 mean and standard deviation features are averaged for each group. 
The resulting data table has 180 rows and 69 columns – 33 Mean variables + 33 Standard deviation variables + 1 Subject
( 1 of of the 30 test subjects) + ActivityName + ActivityNum . The first row is the header containing the names for each column.

The columns of the resultant tidydata are:

 subject                                       : data type integer  
 activityName                                  : data type character values= WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 activityNum                                   :data type numeric 
 timeBodyAccelerometer-MEAN()-X                :data type numeric 
 timeBodyAccelerometer-MEAN()-Y                :data type numeric 
 timeBodyAccelerometer-MEAN()-Z                :data type numeric 
 timeBodyAccelerometer-SD()-X                  :data type numeric
 timeBodyAccelerometer-SD()-Y                  :data type numeric
 timeBodyAccelerometer-SD()-Z                  :data type numeric 
 timeGravityAccelerometer-MEAN()-X             :data type numeric 
 timeGravityAccelerometer-MEAN()-Y             :data type numeric
 timeGravityAccelerometer-MEAN()-Z             :data type numeric
 timeGravityAccelerometer-SD()-X               :data type numeric
 timeGravityAccelerometer-SD()-Y               :data type numeric 
 timeGravityAccelerometer-SD()-Z               : num
 timeBodyAccelerometerJerk-MEAN()-X            : num
 timeBodyAccelerometerJerk-MEAN()-Y            :data type numeric 
 timeBodyAccelerometerJerk-MEAN()-Z            :data type numeric 
 timeBodyAccelerometerJerk-SD()-X              :data type numeric 
 timeBodyAccelerometerJerk-SD()-Y              :data type numeric 
 timeBodyAccelerometerJerk-SD()-Z              :data type numeric
 timeBodyGyroscope-MEAN()-X                    :data type numeric
 timeBodyGyroscope-MEAN()-Y                    :data type numeric 
 timeBodyGyroscope-MEAN()-Z                    :data type numeric 
 timeBodyGyroscope-SD()-X                      :data type numeric 
 timeBodyGyroscope-SD()-Y                      :data type numeric 
 timeBodyGyroscope-SD()-Z                      :data type numeric 
 timeBodyGyroscopeJerk-MEAN()-X                :data type numeric
 timeBodyGyroscopeJerk-MEAN()-Y                :data type numeric
 timeBodyGyroscopeJerk-MEAN()-Z                :data type numeric
 timeBodyGyroscopeJerk-SD()-X                  :data type numeric 
 timeBodyGyroscopeJerk-SD()-Y                  :data type numeric 
 timeBodyGyroscopeJerk-SD()-Z                  :data type numeric 
 timeBodyAccelerometerMagnitude-MEAN()         :data type numeric 
 timeBodyAccelerometerMagnitude-SD()           :data type numeric
 timeGravityAccelerometerMagnitude-MEAN()      :data type numeric
 timeGravityAccelerometerMagnitude-SD()        :data type numeric
 timeBodyAccelerometerJerkMagnitude-MEAN()     :data type numeric 
 timeBodyAccelerometerJerkMagnitude-SD()       :data type numeric 
 timeBodyGyroscopeMagnitude-MEAN()             :data type numeric 
 timeBodyGyroscopeMagnitude-SD()               :data type numeric 
 timeBodyGyroscopeJerkMagnitude-MEAN()         :data type numeric 
 timeBodyGyroscopeJerkMagnitude-SD()           :data type numeric
 frequencyBodyAccelerometer-MEAN()-X           :data type numeric
 frequencyBodyAccelerometer-MEAN()-Y           :data type numeric
 frequencyBodyAccelerometer-MEAN()-Z           :data type numeric 
 frequencyBodyAccelerometer-SD()-X             :data type numeric 
 frequencyBodyAccelerometer-SD()-Y             :data type numeric 
 frequencyBodyAccelerometer-SD()-Z             :data type numeric 
 frequencyBodyAccelerometerJerk-MEAN()-X       :data type numeric 
 frequencyBodyAccelerometerJerk-MEAN()-Y       :data type numeric 
 frequencyBodyAccelerometerJerk-MEAN()-Z       :data type numeric 
 frequencyBodyAccelerometerJerk-SD()-X         :data type numeric 
 frequencyBodyAccelerometerJerk-SD()-Y         :data type numeric 
 frequencyBodyAccelerometerJerk-SD()-Z         :data type numeric 
 frequencyBodyGyroscope-MEAN()-X               :data type numeric 
 frequencyBodyGyroscope-MEAN()-Y               :data type numeric 
 frequencyBodyGyroscope-MEAN()-Z               :data type numeric 
 frequencyBodyGyroscope-SD()-X                 :data type numeric 
 frequencyBodyGyroscope-SD()-Y                 :data type numeric 
 frequencyBodyGyroscope-SD()-Z                 :data type numeric 
 frequencyBodyAccelerometerMagnitude-MEAN()    :data type numeric 
 frequencyBodyAccelerometerMagnitude-SD()      :data type numeric
 frequencyBodyAccelerometerJerkMagnitude-MEAN():data type numeric 
 frequencyBodyAccelerometerJerkMagnitude-SD()  :data type numeric
 frequencyBodyGyroscopeMagnitude-MEAN()        :data type numeric 
 frequencyBodyGyroscopeMagnitude-SD()          :data type numeric 
 frequencyBodyGyroscopeJerkMagnitude-MEAN()    :data type numeric 
 frequencyBodyGyroscopeJerkMagnitude-SD()      :data type numeric 

