##Plot 4
library(lubridate)

setwd("C://Users/Usager/Documents/Coursera/Exploratory/")

Data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
DataSubset <- subset(Data,Data$Date=="2/2/2007" | Data$Date=="1/2/2007")

DataSubset$Global_active_power <- as.numeric(as.character(DataSubset$Global_active_power))
DataSubset$Voltage <- as.character(DataSubset$Voltage)
DataSubset$Global_reactive_power <- as.character(DataSubset$Global_reactive_power)
DataSubset$datetime <- strptime(paste(as.character(DataSubset$Date),as.character(DataSubset$Time)),format="%d/%m/%Y %H:%M:%S")

png(file="plot4.png")
par(mfrow=c(2,2))

#Plot 1
plot(DataSubset$datetime,DataSubset$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

#Plot 2
plot(DataSubset$datetime,DataSubset$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

#Plot 3
plot(DataSubset$datetime,DataSubset$Sub_metering_1,
     type="n",
     xlab="",
     ylab="Energy sub metering")

with(DataSubset,points(DataSubset$datetime,DataSubset$Sub_metering_1,col="black",type="l"))
with(DataSubset,points(DataSubset$datetime,DataSubset$Sub_metering_2,col="red",type="l"))
with(DataSubset,points(DataSubset$datetime,DataSubset$Sub_metering_3,col="blue",type="l"))

legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot 4
plot(DataSubset$datetime,DataSubset$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reacive_power")
dev.off()