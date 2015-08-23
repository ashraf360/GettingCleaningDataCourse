## Synopsis

This is the Readme.MD file for run_analysis.R, which is used to concatenate and clean some accelerometer data from Samsung smartphones.  This data has 561 measurements for 30 users and 6 activities.  The purpose was to find the mean of all the "mean" and "standard deviation" columns of the data grouped by activity and user

## Code Example

The first part of the code simply loads all 8 files.  There are two large files that contain the observers, 2 files that contain information about the subjects, 2 files that contain information about the activities for each record, 1 file that contains the column names for the 561 observations, and 1 file that contains a cross reference between activity code and activity name.

## Motivation

The purpose was to find the mean of all the "mean" and "standard deviation" columns of the data grouped by activity and user.  This was also an exercise in concatenating and cleaning data.

## Installation

Run this from the directory "UCI HAR Dataset"


## Tests

The output file was opened in Excel as a space delimitted file.  It showed that the data had been grouped and summarised by Activity and Subject.

## Contributors

Ashraf Youssef was the sole author, and he can be contacted at ashraf360@gmail.com


