# plot3

### dataset path and library loading
ihepc_path <- "./data/household_power_consumption.txt"
library(lubridate)
library(tidyr)

### loading the dataset, and filtered by date "1/2/2007" and "2/2/2007" stored in table "ihepc" 
ihepc_data <- read.table(ihepc_path, header = TRUE, sep = ";")
ihepc <- ihepc_data[which(ihepc_data$Date == "1/2/2007" | ihepc_data$Date == "2/2/2007"), ]

#### merge date and time (character)
ihepc3 <- unite(ihepc, "date_time", Date:Time, sep = " ", remove = FALSE)

#### convert to date class
ihepc3$date_time <- dmy_hms(ihepc3$date_time)

#### covert to numeric of columns "sub_metering_1" to "sub_metering_3"
ihepc3[8:10] <- sapply(ihepc3[8:10], as.numeric)

#### open graphics device png, and save the png file with a width of 480 and hight of 480 px
png(filename = "plot3.png", width = 480, height = 480, units = "px")

#### plotting line chart
plot(ihepc3$date_time, ihepc3$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(ihepc3$date_time, ihepc3$Sub_metering_2,type = "l",  col = "red")
lines(ihepc3$date_time, ihepc3$Sub_metering_3,type = "l",  col = "blue")
#### add legend
legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
