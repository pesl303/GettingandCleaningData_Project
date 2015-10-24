#For the Train and Test datasets, first we read the description of
#the rows, i.e., the subjects involved in each dataset and the 
#activity for which each subject has measures

  train_activity <- read.table("train/y_train.txt")
  train_subject <- read.table("train/subject_train.txt")
  test_subject <- read.table("test/subject_test.txt")
  test_activity <- read.table("test/y_test.txt")

#We will use the above vectors as new columns in the dataset of
#measuremets. We give them an descriptive name

  names(train_activity) <- "activity"
  names(test_activity) <- "activity"
  names(train_subject) <- "subject"
  names(test_subject) <- "subject"
  
#We create two separate matrix with all the measurements for train
#and test datasets
  
  train_measurements <- read.table("train/X_train.txt")
  test_measurements <- read.table("test/X_test.txt")

#For giving the columns of the above matrixes, descriptive names
#we use the names of the "features", i.e. the name of the 
#measurements that have been measured

  features <- read.table("features.txt")
  names(test_measurements) <- features[,2]
  names(train_measurements) <- features[,2]

#Before merging the Test and Train datasets, we create a new column
#called subject_type, for easy identification in the merged
#datasets of those subjects coming from the Train or Test 
#original datasets
#
#Then we create modified Test and Train datasets including the type
#of subject, the number of subject, the activity for which
#each subject has measurements, and the measurements themselves

  subject_type <- rep("test",nrow(test_measurements))
  all_test <- cbind(subject_type,test_subject,test_activity,test_measurements)
  subject_type <- rep("train",nrow(train_measurements))
  all_train <- cbind(subject_type,train_subject,train_activity,train_measurements)

#The complete merged dataset is then created by mergin along rows
#the modified Test and Train datasets
  
    all_data <- rbind(all_test,all_train)

#For task #2
# "Extracts only the measurements on the mean and standard
# deviation for each measurement"
#We extract a vector with all the names (565), and then look for
#the indexes in which we have measurements that include MEAN()
#or STD()
    
  names_all <- names(all_data)
  indices_mean <- grep("mean()",names_all,fixed=TRUE)
  indices_std <- grep("std()",names_all,fixed=TRUE)

#For extracting the measurements, we add to the above vector of
#indexes the index from 1 to 3, which account for the columns in
#which we have the data about the type of subject, the number of
#of subject and the activity for that subject

  indices_mean_std <- c(1:3,indices_mean,indices_std)

#Then we simply order the vector and use it for create the new matrix
#with the desired measurements
  
  indices_mean_std <- sort(indices_mean_std)
  all_mean_std_data <- all_data[,indices_mean_std]
  
#For Task #3
# "Uses descriptive activity names to name the activities
# in the data set"
#we read the types of the activities involved

  activity_labels <- read.table("activity_labels.txt")
  activity_labels <- as.matrix(activity_labels)

#Then we create a vector with length the number of rows in the merged
#dataset

  activity_description <- vector(mode = "character", length=nrow(all_data))

#For each row in this vector we assign a value depending on the activity
#number included in the associated column in the merged dataset
  
  for(i in seq_along(activity_description)){
          activity_description[i] <- activity_labels[which(activity_labels[,1]==all_data[i,3]),2]
  }

#Then we simply add this new vector as a new column to the right
#of the column with the activity number
  
  all_data <- cbind(all_data[,1:3],activity_description,all_data[,4:ncol(all_data)])

#Task #4 is already performed
# "Appropriately labels the data set with descriptive variable names"
#All the columns in the merged data set have descriptive names
  
#For Task #5, Generation of new tidy data set with average of each variable
#for each activity and each subject
#First we create and empty matrix with the appropiate dimensions
#ncol = ncol of the merged dataset and nrow = multiplication of
#number of different subjects by number of different activities

  new_data_set <- matrix(nrow = (length(unique(all_data[,2]))*length(unique(all_data[,3]))), ncol = ncol(all_data))

#We then split the merged total dataset by number of activity

  all_data_by_activity <- split(all_data,all_data$activity)

#For each of this elements of the resultant list, we split again
#by number of subject

  for(j in 1:length(all_data_by_activity)){
          all_data_by_activity_by_subject <- split(all_data_by_activity[[j]],all_data_by_activity[[j]]$subject)
          
      #For each element of this sublist, we read each column containing
      #measurements (from column 5) and calculate the mean
          for(k in 1:length(all_data_by_activity_by_subject)){
                  for(z in 5:ncol(all_data_by_activity_by_subject[[k]])){
                          new_data_set[30*(j-1)+k,z] <- mean(all_data_by_activity_by_subject[[k]][,z],na.rm=TRUE)
                  }
                  new_data_set[30*(j-1)+k,1] <- as.character(unique(all_data[which(all_data[,2]==k),1]))
                  new_data_set[30*(j-1)+k,2] <- names(all_data_by_activity_by_subject)[k]
                  new_data_set[30*(j-1)+k,3] <- names(all_data_by_activity_by_subject)[j]
                  new_data_set[30*(j-1)+k,4] <- as.character(unique(all_data[which(all_data[,3]==j),4]))
        }

  }
  
#Finally we assigned the descriptive variable names to the columns
#of the new tidy dataset
  
  colnames(new_data_set) <- names(all_data)
  
  write.table(new_data_set,file = "new_tidy_dataset.txt",row.names=FALSE)
