library(dplyr)
library(tidyr)

setwd('~/MyProjects/ds-cursera-tidy-dataset')

if (!file.exists("data")) {
  dir.create("data")
}

setwd('data/UCI HAR Dataset/')

# get variable names
features = read.table('features.txt')[[2]]

# get activity mapping
activity_labels <- read.table('activity_labels.txt')

# merge main data, test subject and activity,
# select only mean() and std() columns
mergeDatasets <- function (x, y, subject) {
  data <- merge(y, activity_labels, by = "V1") %>%
    select(2) %>%
    cbind(select(subject, 1)) %>%
    cbind(select(x, matches(c('.*-mean().*', '.*-std().*')))) %>%
    rename(subject = V1, activity = V2)
  
  
  data
}


# train data
subject_train <- as_tibble(read.table('train/subject_train.txt'))

x_train <- as_tibble(read.table('train/X_train.txt'))
colnames(x_train) <- features;

y_train <- as_tibble(read.table('train/y_train.txt'))


train_data <- mergeDatasets(x_train, y_train, subject_train)

# test data
subject_test <- as_tibble(read.table('test/subject_test.txt'))

x_test <- as_tibble(read.table('test/X_test.txt'))
colnames(x_test) <- features;

y_test <- as_tibble(read.table('test/y_test.txt'))

test_data <- mergeDatasets(x_test, y_test, subject_test)

# combined dataset
data <- rbind(train_data, test_data)


# summary by test subject and activity
summary <- data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), list(mean = mean, sd = sd)), .groups = "drop")

write.table(summary, file = "summary.txt", row.name=FALSE)



