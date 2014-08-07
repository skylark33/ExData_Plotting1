##Plot 1
library(lubridate)

setwd("C://Users/Usager/Documents/Coursera/Exploratory/")

Data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
DataSubset <- subset(Data,Data$Date=="2/2/2007" | Data$Date=="1/2/2007")
DataSubset$Global_active_power <- as.numeric(as.character(DataSubset$Global_active_power))

png(file="plot1.png")

hist(DataSubset$Global_active_power, xlab = "Global Active Power (kilowatts)", 
                                     ylab = "Frequency",
                                     main = "Global Active Power",
                                     col  = "red")
dev.off()

#Plot 2
DataSubset$Date2 <- as.Date(as.character(DataSubset$Date),"%d/%m/%Y")
DataSubset$Time2 <- strptime(as.character(DataSubset$Time),format="%H:%M:%S")
DataSubset$Day <- wday(DataSubset$Date2,label=TRUE)
