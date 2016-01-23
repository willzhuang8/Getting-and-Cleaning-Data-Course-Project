#The run_analysis script is used to clean the UCI Machine Learning Repository's 
#Human Activity and Recognition Using Smartphones Data Set
#Please refer to the ReadMe for more details

#Read data and merge datasets
X_train<-read.table("./UCI HAR Dataset/train/x_train.txt")
X_test<-read.table("./UCI HAR Dataset/test/x_test.txt")
X<-rbind(X_test,X_train)

#Extract measurements of only mean and standard deviation
features<-read.table("./UCI HAR Dataset/features.txt")
cols<-c(grep("mean()",features[,2],fixed=TRUE),grep("std()",features[,2],fixed=TRUE))
X<-X[,cols]

#Add descriptive activity names to name each activity
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject<-rbind(subject_test,subject_train)

Y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
Y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
Y<-rbind(Y_test,Y_train)

activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
for (i in 1:length(activity_labels[,2]))
{
  Y$V1[Y$V1==i]<-as.character(activity_labels[i,2])
}
X<-cbind(subject,Y,X)

#Label variable names
features<-features[cols,]
features$V2<-gsub('[[:blank:][:punct:]]',"",features$V2)
colnames(X)<-c("Subject","Activity",features$V2)

#Create a second tidy data set
library(dplyr)
X<-X[order(X$Subject,X$Activity),]
Tidy<-group_by(X,Subject,Activity)
Tidy<-summarize_each(Tidy,funs(mean))

write.table(Tidy, file="./tidy.txt",row.name=FALSE)

