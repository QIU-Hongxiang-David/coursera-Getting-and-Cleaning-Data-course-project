coursera-Getting-and-Cleaning-Data-course-project
=================================================

This is the repo for the course project of Getting and Cleaning Data on Coursera, including a README.md, an R script, a text data file, and some text files about the data set, which will be introduced later.

The R script, run_analysis.R, does the following:

1.Downloads the .zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it in the working directory. Read the data in need into R.

2.Merges the training and the test sets to create one data set. I first merged the training and test data from different files by rbind(), and then put them together by cbind().

3.Extracts only the measurements on the mean and standard deviation for each measurement. I used grepl() to find the variables names with key words "mean" or "std", subset the data and variable names, and then put the names of the whole data by names().

4.Uses descriptive activity names to name the activities in the data set by subseting the activity labels.

5.Appropriately labels the data set with descriptive variable names. I used gsub() to substitude "t" by "", "Acc" by "Accelerating", "-" by "", "()" by "", "mean" by "Mean", "std" by "StandardDeviation".

6.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. I first split the data by its 1st and 2nd column, and then used ldply() in plyr package to apply the anonimous function, which calculates the colunm mean of each variable, to the list, and put everything together. Finally I deleted the 1st column, which is a side-effect of ldply().

Hence, one needn't have the data prepared in the working directory in order to complete the tasks above, but only needs to be connected to Internet.

HOWEVER, one MUST install "plyr" R package before running the script, which is covered by the lectures. One can install it by typing

>install.packages("plyr")

in the console, if connected to Internet.

To run the script

1.Clone this repo on a PC.

2.Open R and put the script in the working directory.

3.Type
  
>source("run_analysis.R")

>DATA=run_analysis()

in the console.

For further information about the data set, see README.txt.
