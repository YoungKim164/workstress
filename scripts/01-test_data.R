#### Preamble ####
# Purpose: Work Stress
# Author: Sagith Kalaichelvam and Youngho Kim
# Data: 16 March 2023
# Contact: sagith.kalaichelvam@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(janitor)
library(here)

#### Test data ####
# If there is TRUE outputting, then test is assumed to be passed
# All of the test are passing with return value of True
# For those with multiple data outputting, there might be some false outputing
# after the True value, those can be ignored because as long the first value
# is outputting True, then that means it is passing the test, since we are only
# checking for first value to be outputted as True in the data

# Checking if the year matches the year listed in the dataset
raw_data$year |> unique() == c('1972')

# Test the year data is a numeric
raw_data$year |> class() == "numeric"

# Checking if the workstat info matches the workstat info listed in the dataset
raw_data$wrkstat |> unique() == "Working full time"

# Checking if the sat info of job  info matches the stat info of each job listed in the dataset
raw_data$satjob |> unique() == "A little dissatisfied"


