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

## plot this histogram
png(file = "plot1.png")
hist(Data$Global_active_power, 
     col = "red", 
     main = "Globle Active Power",
     xlab = "Globle Active Power (kilowatts)")
dev.off()

