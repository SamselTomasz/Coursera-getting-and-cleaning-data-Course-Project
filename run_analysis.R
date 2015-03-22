## loading libraries
library(plyr)

##----------------------------------------------------------------------
## Part 1
## load and merge datasets from test and train directories

## loading train files
xTrain <- read.table("train/X_train.txt")
yTrain <- read.table("train/y_train.txt")
subjectTrain <- read.table("train/subject_train.txt")

## loading test files
xTest <- read.table("test/X_test.txt")
yTest <- read.table("test/y_test.txt")
subjectTest <- read.table("test/subject_test.txt")

## merging x
x <- rbind(xTrain,xTest)

## merging y
y <- rbind(yTrain,yTest)

## merging subject
subject <- rbind(subjectTrain,subjectTest)

##----------------------------------------------------------------------
## part 2
## extract measurements for standard and mean deviation 

## load file containing names
features <- read.table("features.txt")

## get a list of columns containing std nad mean
listOfNames <- grep("-(mean|std)\\(\\)", features[, 2])

## subset x dataset by columns in the list
x <- x[, listOfNames]

## assign names from features to column names in x
names(x) <- features[listOfNames, 2]

##----------------------------------------------------------------------
## part 3
## Use descriptive activity names to name the activities in the data set

## load the labels
activities <- read.table("activity_labels.txt")

## update values with correct names
y[, 1] <- activities[y[, 1], 2]

## update column name in y
names(y) <- "activity"

##----------------------------------------------------------------------
## part 4
## label data set with vith activity names

## update column name in subject
names(subject) <- "subject"

## bind all columns from all datasets into myData
myData <- cbind(x, y, subject)

##----------------------------------------------------------------------
## part 5
## create tidy dataset with the average of each variable for each
## activity and each subject

## split data frame over subject and activity, apply function colMeans
## and return result
average <- ddply(myData, .(subject, activity), function(x) colMeans(x[, 1:66]))

## save tidy data set for submission
write.table(average, "tidyDataSet.txt", row.name=FALSE)
