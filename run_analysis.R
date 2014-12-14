trainFile<-'./UCI HAR Dataset/train/X_train.txt'
trainLabelFile<-'./UCI HAR Dataset/train/y_train.txt'
trainSubjectFile<-'./UCI HAR Dataset/train/subject_train.txt'
testFile<-'./UCI HAR Dataset/test/X_test.txt'
testLabelFile<-'./UCI HAR Dataset/test/y_test.txt'
testSubjectFile<-'./UCI HAR Dataset/test/subject_test.txt'

activityLabelFile<-'./UCI HAR Dataset/activity_labels.txt'
featureFile<-'./UCI HAR Dataset/features.txt'

library(dplyr)
feature<-read.table(featureFile)

#d1: parse trainset
trainset<-read.table(trainFile)
trainlabel<-read.table(trainLabelFile)
trainsubject<-read.table(trainSubjectFile)
names(trainset)<-feature[,2]
names(trainsubject)<-'SubjectID'
names(trainlabel)<-'ActivityLabel'

#d2: parse testset
testset<-read.table(testFile)
testlabel<-read.table(testLabelFile)
testsubject<-read.table(testSubjectFile)
names(testset)<-feature[,2]
names(testsubject)<-'SubjectID'
names(testlabel)<-'ActivityLabel'
d1<-cbind(trainsubject,trainlabel,trainset)
d2<-cbind(testsubject,testlabel,testset)

#t3: combine 2 dataset into 1
d3<-rbind(d1,d2)
t3<-tbl_df(d3)
remove(d1,d2,d3)

#tt4: extract only the subject/label/mean*/std* cols
tt<-t3[,c(-(303:344),-(382:423),-(461:502))]
tt1<-select(tt,SubjectID,ActivityLabel)
tt2<-select(tt,contains('mean()'))
tt3<-select(tt,contains('std()'))
tt4<-cbind(tt1,tt2,tt3)
remove(tt,tt1,tt2,tt3)

#level the subject/activity
activitylabel<-read.table(activityLabelFile)
tt4$SubjectID<-factor(tt4$SubjectID,labels='Subject')
tt4$ActivityLabel<-factor(tt4$ActivityLabel)
levels(tt4$ActivityLabel)<-activitylabel[[2]]


library(tidyr)
# test for chaining
tidyset <- 
    gather(tt4,Measurement,Value,-SubjectID,-ActivityLabel) %>%
    group_by(SubjectID,ActivityLabel) %>%
    summarise(mean(Value))

write.table(tidyset,'./tidyset.txt',row.name=FALSE)