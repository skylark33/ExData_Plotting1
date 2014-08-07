##Plot 2
library(lubridate)

setwd("C://Users/Usager/Documents/Coursera/Exploratory/")

Data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
DataSubset <- subset(Data,Data$Date=="2/2/2007" | Data$Date=="1/2/2007")

DataSubset$Global_active_power <- as.numeric(as.character(DataSubset$Global_active_power))
DataSubset$datetime <- strptime(paste(as.character(DataSubset$Date),as.character(DataSubset$Time)),format="%d/%m/%Y %H:%M:%S")

png(file="plot2.png")

plot(DataSubset$datetime,DataSubset$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()


