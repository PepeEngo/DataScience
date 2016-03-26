##Be sure that dplyr, data.table and tidyr are loaded
##Using code to download datafile and unzip

if(!file.exists("./T4")){dir.create("./T4")}
fileUrl <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./T4/T4.zip")
unzip(zipfile="./T4/T4.zip",exdir="./T4")
filesPath <- "./T4/UCI HAR Dataset"

#Read data files
datasetTrain <- tbl_df(read.table(file.path(filesPath, "train", "X_train.txt" )))
datasetTest  <- tbl_df(read.table(file.path(filesPath, "test" , "X_test.txt" )))

#Read subject files
subjectTrain <- tbl_df(read.table(file.path(filesPath, "train", "subject_train.txt")))
subjectTest  <- tbl_df(read.table(file.path(filesPath, "test" , "subject_test.txt" )))

#Read labels files
labelsTrain <- tbl_df(read.table(file.path(filesPath, "train", "Y_train.txt")))
labelsTest  <- tbl_df(read.table(file.path(filesPath, "test" , "Y_test.txt" )))



#merging subject and labels training and test sets by row binding 

mergedataSubject <- rbind(subjectTrain, subjectTest)
mergedatalabels<- rbind(labelsTrain, labelsTest)


#rename variables "subject" and "activityNum"

setnames(mergedatalabels, "V1", "activityNum")
setnames(mergedataSubject, "V1", "subject")

#binding and consolidating training and test data files
dataTable <- rbind(datasetTrain, datasetTest)

# name variables according to feature.txt and naming activity labels
dataFeatures <- tbl_df(read.table(file.path(filesPath, "features.txt")))
setnames(dataFeatures, names(dataFeatures), c("featureNum", "featureName"))
colnames(dataTable) <- dataFeatures$featureName
activityLabels<- tbl_df(read.table(file.path(filesPath, "activity_labels.txt")))
setnames(activityLabels, names(activityLabels), c("activityNum","activityName"))

# Merge columns
mergedataSubjectActivity<- cbind(mergedataSubject, mergedatalabels)
dataTable <- cbind(mergedataSubjectActivity, dataTable)

# Reading "features.txt" and extracting only the mean and standard deviation
FeaturesMeanSD <- grep("mean\\(\\)|std\\(\\)",dataFeatures$featureName,value=TRUE) #var name

# adding "subject","activityNum" and naming activities

FeaturesMeanSD <- union(c("subject","activityNum"), FeaturesMeanSD)
dataTable<- subset(dataTable,select=FeaturesMeanSD) 
dataTable <- merge(activityLabels, dataTable , by="activityNum", all.x=TRUE)
dataTable$activityName <- as.character(dataTable$activityName)

dataAggr<- aggregate(. ~ subject - activityName, data = dataTable, mean) 
dataTable<- tbl_df(arrange(dataAggr,subject,activityName))


#Naming and writing
names(dataTable)<-gsub("std()", "SD", names(dataTable))
names(dataTable)<-gsub("mean()", "MEAN", names(dataTable))
names(dataTable)<-gsub("^t", "time", names(dataTable))
names(dataTable)<-gsub("^f", "frequency", names(dataTable))
names(dataTable)<-gsub("Acc", "Accelerometer", names(dataTable))
names(dataTable)<-gsub("Gyro", "Gyroscope", names(dataTable))
names(dataTable)<-gsub("Mag", "Magnitude", names(dataTable))
names(dataTable)<-gsub("BodyBody", "Body", names(dataTable))

write.table(dataTable, "Completed.txt", row.name=FALSE)
