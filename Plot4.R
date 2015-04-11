# Plot4.R
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

######## Plot 4 (2 x 2 panel of plots) #########

# convert date and time to POSIXct
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')

# convert Global Active Power to numeric
df$Global_active_power <- as.numeric(df$Global_active_power)

# generate english names for days of the week (Monday, Tuesday, ...)
# (default would be German)

Sys.setlocale("LC_TIME", "English") 

png("Plot4.png", width=480, height=480)

par(mfrow = c(2, 2))      # for mar (inner margins), oma (outer margins) the defaults have been used

###########################################
#
# first plot to plot (upper left): Plot 2
plot(x = df$DateTime,
     y = df$Global_active_power,
     main = '',
     col = 'black',
     xlab = '',
     ylab = 'Global Active Power',   # minor difference to original Plot 2
     type = 'n')

lines(x = df$DateTime,
      y = df$Global_active_power,
      col = 'black')

###########################################
#
# second plot to plot (upper right): new plot

df$Voltage <- as.numeric(df$Voltage)

plot(x = df$DateTime,
     y = df$Voltage,
     main = '',
     col = 'black',
     xlab = 'datetime',
     ylab = 'Voltage',
     type = 'n')

lines(x = df$DateTime,
      y = df$Voltage,
      col = 'black')

###########################################
#
# third plot to plot (lower left): Plot 3
plot(x = df$DateTime,
     y = df$Sub_metering_1,
     main = '',
     col = 'black',
     xlab = '',
     ylab = 'Energy sub metering',
     type = 'n')

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
       bty = "n",      # this is a difference to previous Plot 3 - no black box around legend
       lwd = 1,
       col = c("black", "red", "blue"),
       # legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       legend = colnames(df)[7:9]
)

###########################################
#
# fourth plot to plot (lower right): new plot

df$Global_reactive_power <- as.numeric(df$Global_reactive_power)

plot(x = df$DateTime,
     y = df$Global_reactive_power,
     main = '',
     col = 'black',
     xlab = 'datetime',
     ylab = 'Global_reactive_power',
     type = 'n')

lines(x = df$DateTime,
      y = df$Global_reactive_power,
      col = 'black')

dev.off()

