# Constructing the script to read and clean the data for the final project

# Assume you are in the UCI HAR Dataset folder with the test and train subfolders

# Load the files
# clabels:  This dataframe will hold the column labels found in the file "features.txt"
# xtrain:  Dataframe that will hold the x_train observations for the 561 columns of data
# xtest:  Dataframe that holds the x_test observations for the 561 columns of data
# ytrain: Dataframe that holds the y_train Activity codes corresponding to the x_train observations
# ytest: Dataframe that holds the y_test Activity codes corresponding to the x_test observations
# subjecttrain:  Dataframe that holds the subject code numbers corresponding to the x_train observations
# subjecttest: Dataframe that holds the subject code numbers corresponding to the y_test observations
# alabels: Dataframe holding the lookup table between activity codes and meaningful activity descriptions

library(dplyr)

# SECTION: Read Data

clabels<-read.table("features.txt")
xtrain<-read.table("train/X_train.txt")
xtest<-read.table("test/X_test.txt")
ytrain<-read.table("train/Y_train.txt")
ytest<-read.table("test/Y_test.txt")
subjecttrain<-read.table("train/subject_train.txt")
subjecttest<-read.table("test/subject_test.txt")
alabels<-read.table("activity_labels.txt")

# SECTION: Rename Columns

# Use the clabels to rename the column names for the x_train and x_test observations
colnames(xtrain)<-clabels$V2
colnames(xtest)<-clabels$V2

# Rename the dataframe column holding the subject information with "Subject"
colnames(subjecttrain)<-"Subject"
colnames(subjecttest)<-"Subject"

# SECTION: Concatenate Data

# Concatenate the x_train and x_test observation data with the corresponding subject column
dftrain<-cbind(xtrain,subjecttrain)
dftest<-cbind(xtest,subjecttest)

# SECTION: Remap Activity Data

# Use a lookup from the activity code to the activity description utilizing the alabels dataframe
activities<-alabels$V2
trainactivities<-activities[ytrain$V1]
testactivities<-activities[ytest$V1]

# Convert these to dataframes
trainactivities<-data.frame(trainactivities)
testactivities<-data.frame(testactivities)

# Rename the activities columns to "Activity"
names(trainactivities)<-"Activity"
names(testactivities)<-"Activity"

# Concatenate the remapped activities column to the large dataframes containing the observation data
dftrain<-cbind(dftrain,trainactivities)
dftest<-cbind(dftest,testactivities)

# Concatenate row-wise the Train and Test data
dfcat<-rbind(dftrain,dftest)

# Determine the columns that need to remain.  They are the colums that contain mean or standard deviation 
# information as well as Subject and Activity

# SECTION: Filter on Mean and Standard Deviation data

dfcat1<-dfcat
v1<-colnames(dfcat)
filtercriteria<-v1[grepl("[Mm]ean",v1) | grepl("[Ss]td", v1) | grepl("Activity", v1) | grepl("Subject", v1)]

dfcat1<-dfcat[,filtercriteria]

# SECTION: Group and Summarize

#Now group by Activity and Subject and use summarise_each to find the mean of the remaining columns using dplyr

dfcat2<-dfcat1 %>% group_by(Activity,Subject) %>% summarise_each(funs(mean))

# SECTION: Write Output
# Write the dataframe to an output file using write.table

write.table(dfcat2, file="summarised_output.txt", row.names=FALSE)

#End of file


