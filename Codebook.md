# Code Book

This document describes the code inside `run_analysis.R`.

The code has extensive comments with the following sections:

* Read Data
* Rename Columns
* Concatenate Data
* Remap Activity Data
* Filter on Mean and Standard Deviation data
* Group and Summarize
* Write Output

## Read Data

Read the raw data into separate data frames

Read dataset files from UCI HAR Dataset folder to given name and prefix. Know names are "train" and "test". Known prefixes are "X", "y" and "subject".

Examples:

* `UCI HAR Dataset/train/X_train.txt`
* `UCI HAR Dataset/train/y_train.txt`
* `UCI HAR Dataset/train/subject_train.txt`

## Rename Columns

Take the column names found in the file "features.txt" and use them in the dataframes that contain the train and test observations.

## Concatenate Data

Concatenate the train and test data row wise and then concatenate the subject and activity columns

## Remap Activity Data

Take the activity data column and remap it to meaningful words using the mapping table found in "activity_tables.txt"


## Filter on Mean and Standard Deviation data

Keep only the columns that contain mean and standard deviation data.  This is accomplished by creating a vector of column headings containing "mean" or "std" using the grep function.

## Group and Summarize

The goal at the end is to group by Activity and Subject and then summarize by taking the mean of each attribute.

## Write Output

Write output to a file called "summarized_output.txt"


