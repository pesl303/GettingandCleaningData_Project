# GettingandCleaningData_Project
Respository for the files needed in the final project of the Getting and Cleaning Data Course
---
title: "README.md"
author: "Victor Lopez"
date: "21 de octubre de 2015"
output: html_document
---

The script "run_analysis.R" performs the following operations on the dataset "UCI HAR Dataset". This script must be located in the same directory where this dataset has been unzipped, that is, it must be in the same directory as the files "activity_labels.txt", features.txt, features_info.txt and README.txt. In this directory the original directories of the dataset containing all the measurements (test, train) must also be present

The script performs the following operations on the original UCI HAR Dataset<ol>
<li>It merges the two separate datasets containing measurements and calculations from "test" and "train" subjects. In this merged dataset, new columns are added that account for the specific subject number for each row of measurements, and the type of this subject (train or test)</li>
<li>Another column is added to this dataset containing the description of each activity. Names for this description are captured by reading the file activity_labels.txt, that links activities numbers with activities descriptions</li>
<li>All the variables (i.e. columns) of the merged dataset have descriptive names according to the file features.txt</li>
<li>A new summarize dataset is created by extracting only those columns that include the mean and the standard deviation of each type of measurement</li>
<li>A new summarize dataset (new_data_set) is created for storing the mean of each variable, for each different activity and each different subject</li>
</ol>


