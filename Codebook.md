#Variables

###For variables originally in the data set, see README.txt and other introductory text files.

###Variables in second_data_set.txt:

1."activity": the activity during which the other data were collected. All activities are in activity_labels.txt.

2."subject": the subject, or person, from whom the other data were collected during experiments.

3.Others: the average of each variable for each activity and each subject in the merged data set (see below). To understand the meaning of each variable, see features_info.txt, where each feature is a variable, and variable names are similar to but more self-descriptive than feature names. Note that the data in second_data_set.txt are the averages of the original data.

Since the original data were normalized and bounded within the closed interval [-1,1] (see README.txt Notes),the variables may be considered to have no units.

============================================================================================================================

#Steps of cleaning up the data and creating the data file

1.Downloads the .zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it in the working directory. Read the data in need into R.

2.Merges the training and the test sets to create one data set. I first merged the training and test data from different files by rbind(), and then put them together by cbind().

3.Extracts only the measurements on the mean and standard deviation for each measurement. I used grepl() to find the variables names with key words "mean" or "std", subset the data and variable names, and then put the names of the whole data by names().

4.Uses descriptive activity names to name the activities in the data set by subseting the activity labels.

5.Appropriately labels the data set with descriptive variable names. I used gsub() to substitude "t" by "", "Acc" by "Acceleration", "-" by "", "(" by "", ")" by "", "mean" by "Mean", "std" by "StandardDeviation", "Mag" by "Magnitude", "f" by "Frequency".

6.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. I first split the data by its 1st and 2nd column, and then used ldply() in plyr package to apply the anonimous function, which calculates the colunm mean of each variable, to the list, and put everything together. Then I deleted the 1st column, which is a side-effect of ldply(). Finally I used write.table() to generate the text file.

