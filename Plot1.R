# Plot1.R
#
# Course Project 1 of Module 4 of the Data Science Specialization @ coursera.org
#
# 4 - "Exploratory Data Analysis"
#
# Frank M. Berger, github: F-rankie
#
############## A T T E N T I O N
#
# Within the current working directory, the project specific data file
#
#       household_power_consumption.txt
# 
# needs to reside in directory /data.

require(data.table)

# setwd("R:/4_ExploratoryDataAnalysis/Project1")
# getwd()

path.fn <- "data/household_power_consumption.txt"

df <- fread(path.fn, sep=";", nrows=100000, colClasses="character")
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))

######## end of reading data ##########

######## Plot 1 #########

# convert column of interest to numeric
df$Global_active_power <- as.numeric(df$Global_active_power)

png("Plot1.png", width=480, height=480)

# no annotation steps needed, all necessary details can be provided in the initial call to hist()

hist(x = df$Global_active_power,
     main = 'Global Active Power',
     col = 'red',
     xlab = 'Global Active Power (kilowatts)')

dev.off()
