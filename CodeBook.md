## Introduction

The script **run_analysis.R** performs the steps from course project.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Creates a tidy dataset with tahe average of each variable for each activity and each subject.

## Variables.

* xTrain, yTrain, xTest, yTest, subjectTest - contain the data from the downloaded files
* x, y, subject - merged datasets for further analysis
* features, activities - contains the correct names for the datasets
* myData - merged data from all datasets
* average - contains the relevant averages which are stored in txt file
