##########################################################
# LOAD LIBRARIES: Load both plyr and dplyr libraries
# 
# Loading plyr Library

    library("plyr", lib.loc="~/R/win-library/3.2")
    library("dplyr", lib.loc="~/R/win-library/3.2")

##########################################################
# READ DATA: Read in data from UCI HAR Dataset     
#
# Read in Test and Train Subject data. 
    lfile <-  "~/UCI HAR Dataset/test/subject_test.txt"
    subject_train <- read.table(lfile, quote="\"", comment.char="")

    lfile <-  "~/UCI HAR Dataset/train/subject_train.txt"  
    subject_test <- read.table(lfile, quote="\"", comment.char="")

# Read in Test and Train Activity Data
    lfile <- "~/UCI HAR Dataset/test/y_test.txt"
    act_test <- read.table(lfile, quote="\"", comment.char="")

    lfile <- "~/UCI HAR Dataset/train/y_train.txt"
    act_train <- read.table(lfile, quote="\"", comment.char="")

# Read in test measurement data
    lfile <- "~/UCI HAR Dataset/test/X_test.txt"
    dbtest <- read.table(lfile, quote="\"", comment.char="")

# Read in train meaurement data
    lfile2 <- "~/UCI HAR Dataset/train/X_train.txt"
    dbtrain <- read.table(lfile2, quote="\"", comment.char="")

#################################################################
# MERGE DATA from Train and Test datasets
#
# Merge Train and Test Subject Data and store in first column of new dataset
    datab <- rbind(subject_train, subject_test)

# Merge Train and Test Activity Data and store in second column of new dataset
    datab <- cbind(datab, rbind(act_test,act_train))

# Merge Training and Testing Measurement Data
    tandt <-rbind(dbtest,dbtrain)
  
  
#################################################################  
# EXTRACT MEANs and STD DEV COLUMNS.
# 
# Read in variable list
    lfile <- "~/UCI HAR Dataset/features.txt"
    features <- read.table(lfile, quote="\"", comment.char="", stringsAsFactors=FALSE)

# Create logical vector using grepl to identify variable names that contain 
# "mean" and"std" resepectively. Choose corresponding columns from database.   
    xmeanstd <- (grepl("mean",features[,2]) | grepl("std",features[,2]))
    nmeanstd <- sum(xmeanstd)   # Count number of variables

# Use logical vertor to select correponding columns from orginal dataset. Combine
# with subject and activity data in new database
    datameanstd <- tandt[,xmeanstd]
    datab <- cbind(datab,datameanstd)

###################################################################
# CREATE VARIABLE NAMES and LABELS
#
# Create column names for variables using names from features file 
    colnames(datab) [1:2] <- c("Subject", "Activity")
    colnames(datab) [3:81] <- features[xmeanstd,2]

# Create labels for six activities in experiment
    lab = c("Walk","Walk_Up","Walk_Down","Sit","Stand","Lay")
    datab$Activity <- factor(datab$Activity,labels=lab)
  
################################################################## 
# CREATE SECOND DATABASE CONTAINING MEANS FOR EACH VARIABLE FOR EACH 
# ACTIVITY AND SUBJECT
# 
# Create Activity Variable - repreat 1-6 30 times
    a <- c(rep(1,30),rep(2,30),rep(3,30),rep(4,30),rep(5,30),rep(6,30))

# Create Subject variable and bind to activity variable in new database (datab2)
    datab2 <- as.data.frame(cbind(rep(1:30,6),a))
# Add columns names to Activity and Subject Variables
    colnames(datab2) [1:2] <- c("Subject", "Activity")

# Loop through all measurements in datab1 and calculate mean for each acivity and
# subject using tapply(). 
    for (i in 3:(nmeanstd+2))  {
          g <- tapply(datab[,i],datab[,1:2],mean)
          g2 <- c(g[,1],g[,2],g[,3],g[,4],g[,5],g[,6])
          datab2 <- cbind(datab2,g2)
    }

# Add column names to the variables in datab2
    colnames(datab2) <- colnames(datab) 
    datab2$Activity <- factor(datab2$Activity,labels=lab)

#######################################################################
# CREATE TIDY DATA FILE 
# Write database datab2 to csv file "tidy.txt"
    write.table(datab2, file = "tidy.txt", row.name = FALSE)
    
#######################################################################    