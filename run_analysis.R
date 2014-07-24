run_analysis<-function(){
    library(plyr)
    
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","alldata.zip")
    unzip("alldata.zip")
    activitylabels<-read.table("UCI HAR Dataset/activity_labels.txt")
    var<-read.table("UCI HAR Dataset/features.txt")
    datatrain<-read.table("UCI HAR Dataset/train/X_train.txt")
    datatest<-read.table("UCI HAR Dataset/test/X_test.txt")
    subjecttrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
    subjecttest<-read.table("UCI HAR Dataset/test/subject_test.txt")
    activitytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
    activitytest<-read.table("UCI HAR Dataset/test/y_test.txt")
    
    data<-rbind(datatrain,datatest)
    activity<-rbind(activitytrain,activitytest)
    subject<-rbind(subjecttrain,subjecttest)
    data<-cbind(activity,subject,data)
    
    var<-as.vector(var[,2])
    varneedl<-grepl("mean|std",var)
    data<-data[,c(TRUE,TRUE,varneedl)]
    var<-var[varneedl]
    
    activitylabels<-as.vector(activitylabels[,2])
    data[,1]<-activitylabels[data[,1]]
    
    var<-gsub("[t()]","",var)
    var<-gsub("-","",var)
    var<-gsub("Acc","Acceleration",var)
    var<-gsub("mean","Mean",var)
    var<-gsub("sd","StandardDeviation",var)
    var<-gsub("Mag","Magnitude",var)
    var<-gsub("Freq","Frequency",var)
    var<-gsub("^f","frequecydomain",var)
    names(data)<-c("activity","subject",var)
    
    data2<-split(data,list(data[,1],data[,2]))
    DATA<-ldply(data2,function(x){
        y<-as.list(as.factor(colMeans(x[,-c(1,2)])))
        z<-as.data.frame(c(x[1,1],x[1,2],y))
        colnames(z)<-c(names(data2[[1]]))
        rownames(z)<-NULL
        z
    })
    DATA<-DATA[,-1]
    
    write.table(DATA,"second_data_set.txt")
    DATA
}