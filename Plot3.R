# Plot3.R
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

######## Plot 3 #########

# convert date and time columns to one new DateTime column of POSIXct format/class
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')

# generate english names for days of the week (Monday, Tuesday, ...)
# (default would be German, on my machine)

Sys.setlocale("LC_TIME", "English") 

png("Plot3.png", width=480, height=480)

# generate empty plot, without actual data (type='n')
plot(x = df$DateTime,
     y = df$Sub_metering_1,
     main = '',
     col = 'black',
     xlab = '',
     ylab = 'Energy sub metering',
     type = 'n')

# add the three data sets with different colors

lines(x = df$DateTime,
      y = df$Sub_metering_1,
      col='black')

lines(x = df$DateTime,
      y = df$Sub_metering_2,
      col='red')

lines(x = df$DateTime,
      y = df$Sub_metering_3,
      col='blue')

# don't forget the legend
legend("topright",
       lwd = 1,
       col = c("black", "red", "blue"),
       # legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       legend = colnames(df)[7:9]
      )

dev.off()
