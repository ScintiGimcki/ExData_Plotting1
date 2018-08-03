data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
head(data)
## A useful package to manage POSIXct type
library(lubridate)

## Manage data in to right type
Data <- data
Data$Global_active_power = as.numeric(as.character(Data$Global_active_power))
Data$Global_reactive_power = as.numeric(as.character(Data$Global_reactive_power))
Data$Voltage = as.numeric(as.character(Data$Voltage))
Data$Global_intensity = as.numeric(as.character(Data$Global_intensity))
Data$Sub_metering_1 <- as.numeric(as.character(Data$Sub_metering_1))
Data$Sub_metering_2 <- as.numeric(as.character(Data$Sub_metering_2))
Data$Sub_metering_3 <- as.numeric(as.character(Data$Sub_metering_3))
## Filter the data we want
Data <- Data[Data$Date == "1/2/2007" | Data$Date == "2/2/2007",]
## Handle date variable into POSIXct type
Data$weekday_time <- dmy_hms(paste(Data$Date, Data$Time))

## plot this png
png(file = "plot3.png")
plot(Data$weekday_time, 
           Data$Sub_metering_1, 
           ylab = "Energy sub metering", 
           xlab = "", 
           type = "l")
lines(Data$Sub_metering_2~Data$weekday_time, col = "red")
lines(Data$Sub_metering_3~Data$weekday_time, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1)
dev.off()
