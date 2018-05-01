# CodeBook

## Introduction
This Code Book is for the course project of Getting & Cleaning Data - Week 4: https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project


## Project Overview
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Project Objectives
You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Project R Script

run_analysis.R is the script prepared as part of this project. It executes the listed objectives sequentially from downloading the data from internet till creating independent tidy data set.

**Working of run_analysis.R:**

1. Download the dataset if it does not already exist in a predefined directory called "./downloadedDataset"
2. Load training and test data sets 
3. Load the activity and feature info
4. Give meaningful column names training and test data sets
5. Merge training data sets (X, Y and subject). Merge test data sets (X, Y and subject).
6. Row bind merged training and test data sets to form one complete big dataset
7. Extracts only the measurements on the mean and standard deviation for each measurement.
8. Uses descriptive activity names to name the activities in the data set
9. From the above created data set, create a second, independent tidy data set with the average of each variable for each activity and each subject. Store the output in secTidySet.txt file.

## Project Output
secTidySet.txt is generated. It contains an independent tidy data set with the average of each variable for each activity and each subject.