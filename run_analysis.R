## Download File
if (!file.exists("data"))
{
    dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="C://Coursera//Data//Dataset.zip")

## Load Features names
mnames <- read.table("C://Coursera//UCIHARDataset//features.txt", col.names = c("number","mname"))

## Load Training Data
mtrain <- read.table("C://Coursera//UCIHARDataset//train//X_train.txt", col.names = mnames$mname, check.names = FALSE)

## Add mean and standard deviation
mtrain <- mtrain[,grep(c("mean\\(\\)|std\\(\\)"), colnames(mtrain))]

## Load subject labels
trainsubject <- read.table("C://Coursera//UCIHARDataset//train//subject_train.txt", col.names = "subject")

## Load activity labels
trainactivity <- read.table("C://Coursera//UCIHARDataset//train//y_train.txt", col.names = "activity")

## Combine training subject labels, activity labels, and measurements
traindata <- cbind(trainsubject, trainactivity, mtrain)

## Load Testing data
mtest <- read.table("C://Coursera//UCIHARDataset//test//X_test.txt", col.names = mnames$mname, check.names = FALSE)

## Add mean and standard deviation
mtest <- mtest[,grep(c("mean\\(\\)|std\\(\\)"), colnames(mtest))]

## Load subject labels for testing measurements
testsubject <- read.table("C://Coursera//UCIHARDataset//test//subject_test.txt", col.names = "subject")

## Load activity labels for testing measurements
testactivity <- read.table("C://Coursera//UCIHARDataset//test//y_test.txt", col.names = "activity")

## Combine testing subject labels, activity labels, and measurements
testdata <- cbind(testsubject, testactivity, mtest)

## Merge together the training and test data into one data frame
fulldata <- rbind(traindata, testdata)

## Split by subject and activity
splitby <- list(fulldata$subject, fulldata$activity)
splitdata <- split(fulldata, splitby)

## Function to Get means of each activity
fColMeans <- function(df){
    columnmeans <- colMeans(df) 
    columnmeans <- as.matrix(columnmeans)
    columnmeans <- t(columnmeans)
    columnmeans <- as.data.frame(columnmeans, check.names = FALSE)
    return(columnmeans)
}

## Apply funtion for each split and return as a list of data frames
splitdata <- lapply(X = splitdata, FUN = fColMeans)

## Merge all the data frames in the list into a single data frame
finaldata <- do.call(rbind, splitdata)

## Remove bad row names
rownames(finaldata) = NULL

## Add good column names
colnames(finaldata) <- gsub("\\(\\)", "", colnames(finaldata))
colnames(finaldata) <- gsub("-", "_", colnames(finaldata))
activitiesnames <- read.table("C://Coursera//UCIHARDataset//activity_labels.txt", col.names = c("activity","activity_name"))
finaldata <- merge(activitiesnames, finaldata, by = "activity", all.x = TRUE)

## Write final dataset to text file
write.table(finaldata, "C://Coursera//HumanActivity.txt",row.name=FALSE)

