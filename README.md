## Cleanup and summarize Samsung sensors data 

The run_analysis.R performs next actions:

1.  Merges activity (y\_\*.txt) and subject data into main (x.\*txt) dataset

2.  Filters columns that contains mean and std values

3.  Merges test and train datasets into one

4.  Generates summary, containing average values of each variable grouped by test subject and acti

### How to use

1.  Download data\

```{#download.file( #"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "data/wearable.zip")}

#unzip("data/wearable.zip", overwrite = T, exdir = "data")

```

2.  Run `run_analysis.R`
3.  Look at `summary.txt`

### CodeBook

The dataset contains summarized data from\
<https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones>

In addition to variables described in features.txt it contains\
Subject - the test subject (1 to 30)

Activity - one of values from activity_lablels.txt

The summary is grouped by subject and activity and contains average value for each variable of merged test and train dataset
