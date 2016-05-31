# DataCleaningAssignment
Assignment for Data Getting and Cleaning Data
==================================================================
Human Activity Recognition Using Smartphones Sample Dataset
==================================================================

This program extracts data from a Human Activity Recognition experiment carried out by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and 
Jorge L. Reyes-Ortiz [1]. The experiments have been carried out with a group of 30 volunteers(21 used for taining dataset and 9 for test dataset) who 
performed six activities (WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using an embedded accelerometer and gyroscope, they captured a number of different velocities and calculated a number of different descriptive statistics for
each subject and activity measurement. In total 561 variables were contained in their original dataset.

- The program selects only mean and standard deviation meaurements from the 561 variables contained for both training and test datasets, combining both in one file.    
- It then calculates the mean of these variables for each measurement by subject and acitivity and stores this values in a datset called "Tidy.csv"

From the orignal dataset the following files are accessed by the program:
=========================================
- 'features.txt': List of all features. This file was accessed to create column variables names in "tidy" data file
- 'activity_labels.txt': Used to link the class labels with their activity name.
- 'train/X_train.txt': Training set data of 561 variables.
- 'test/X_test.txt': Test set data for 561 variables.
- 'train/subject_train.txt': Used to identify the train datafile subject who performed each activity in datafile. Its range is from 1 to 30.
- 'train/subject_test.txt': Used to idenfity who performed the activity for each window sample. Its range is from 1 to 30. 

Notes: 
Subjects are labelled from 1 to 30, 
Features are normalized and bounded within [-1,1], 
The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g',
Measurements were taken on three axes (X,Y and Z)
The angular veolicties in the file were measured in radians per second,
For more information about the original dataset see: activityrecognition@smartlab.ws.

The output file contains
=========================================
- Two indenifier colums, subject and activity, repsenting the 30 subjects and 6 activities respectively.
- The file contains 180 rows (30 subject x 6 activities)
- The file contains 81 columns - The mean, by subject and activity, of 79 of the selected measurement variables from the original 
	dataset (namley the mean and standard deviation variables).

See Codebook.rm for a detailed description of the variables contained in the "Tidy" dataset. 


Reference:
========

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
