# plot4

### dataset path and library loading
ihepc_path <- "./data/household_power_consumption.txt"
library(lubridate)
library(tidyr)

### loading the dataset, and filtered by date "1/2/2007" and "2/2/2007" stored in table "ihepc" 
ihepc_data <- read.table(ihepc_path, header = TRUE, sep = ";")
ihepc <- ihepc_data[which(ihepc_data$Date == "1/2/2007" | ihepc_data$Date == "2/2/2007"), ]

#### merge date and time (character) and convert to date class
ihepc4 <- unite(ihepc, "date_time", Date:Time, sep = " ", remove = FALSE)
ihepc4$date_time <- dmy_hms(ihepc4$date_time)
#### covert other columns as numeric
ihepc4[4:10] <- sapply(ihepc4[4:10], as.numeric)

#### open graphics device png, and save the png file with a width of 480 and hight of 480 px
png(filename = "plot4.png", width = 480, height = 480, units = "px")
#### plot 4 chart (2*2)
par(mfrow = c(2,2))

with(ihepc4, {
        plot(Global_active_power ~ date_time, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
        plot(Voltage ~ date_time, type = "l", xlab = "datetime", ylab = "Voltage")
        plot(date_time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
        lines(date_time, Sub_metering_2,type = "l",  col = "red")
        lines(date_time, Sub_metering_3,type = "l",  col = "blue")
        legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
        plot(Global_reactive_power ~ date_time, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        
})


dev.off()