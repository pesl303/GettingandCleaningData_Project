Code book of variables used in the script run_analysis.R
<ul>
<li>train_activity: vector containing the types of activity performed by subjects in train dataset</li>
<li>test_activity: vector containing the types of activity performed by subjects in test dataset</li>
<li>train_subject: vector containing the number of subjects used in train dataset</li>
<li>test_subject: vector containing the number of subjects used in train dataset</li>
<li>train_measurements: matrix containing all the measurements for the train subjects</li>
<li>test_measurements: matrix containing all the measurements for the train subjects</li>
<li>features: matrix including the correspondence between measurements numbers and measurements description</li>
<li>subject_type: vector including the type of subject, used for adding a new column to the matrix with all measurements</li>
<li>all_train: matrix with all measurements for all subjects in train dataset, with descriptive variable names and a column indicating that all these subjects are from train dataset</li>
<li>all_test: matrix with all measurements for all subjects in test dataset, with descriptive variable names and a column indicating that all these subjects are from test dataset</li>
<li>all_data: matrix with all measurements for all subjects in both datasets: train and test. After some transformations and after adding the column activity_description, it also includes descriptive names for the activities, and not only their number</li>
<li>indices_mean_std: vector with the number of columns in which there are measurements with mean() and std()</li>
<li>all_mean_std_data: subset of all_data including only measurements with mean() and std()</li>
<li>activity_labels: matrix with number of activities and their descriptive name</li>
<li>activity_description: vector for including the right activity name, according to the activity number in each row of all_data matrix</li>
<li>new_data_set: new data set created from all_data in which each column includes the mean of the specific measurement in that column of the all_data dataset, for each subject and each activity for that specific subject</li>
</ul>
