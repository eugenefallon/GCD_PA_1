---
title: "README.Rmd"
author: "Eugene Fallon"
date: "May 21, 2015"
output: html_document
---

# Getting and Cleaning Data Course Project
## Project description    
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Project assignment details  
 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Description of my submitted work  
This information is also detailed in the Codebook markdown file in this repo  
  
### Data processing details
The script "run_analysis.R", located in this repository, is the complete sequence of steps performed against this data set.  Please review the R script for additional details.  
  
The following is a summary of the processing performed by "run_analysis.R"  
  
1. Setup - load all required packages and libraries  
2. Download the raw data to the working directory  
3. unzip the dataset downloaded  
4. Load activity labels and data column names  
5. Load and process the test data  
6. Load and process the train data  
7. Merge the test and train data into a single data set  
8. Tidy the dataset from step 7 using the melt() function  
9. Apply the mean to all variables  
10. Write our tidy dataset out to "tidy_data.txt" in the working directory  
  
