##Plot 3
library(lubridate)

setwd("C://Users/Usager/Documents/Coursera/Exploratory/")

Data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
DataSubset <- subset(Data,Data$Date=="2/2/2007" | Data$Date=="1/2/2007")

DataSubset$Global_active_power <- as.numeric(as.character(DataSubset$Global_active_power))
DataSubset$datetime <- strptime(paste(as.character(DataSubset$Date),as.character(DataSubset$Time)),format="%d/%m/%Y %H:%M:%S")

png(file="plot3.png")

plot(DataSubset$datetime,DataSubset$Sub_metering_1,
     type="n",
     xlab="",
     ylab="Energy sub metering")

with(DataSubset,points(DataSubset$datetime,DataSubset$Sub_metering_1,col="black",type="l"))
with(DataSubset,points(DataSubset$datetime,DataSubset$Sub_metering_2,col="red",type="l"))
with(DataSubset,points(DataSubset$datetime,DataSubset$Sub_metering_3,col="blue",type="l"))

legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()