# plot2

### dataset path and library loading
ihepc_path <- "./data/household_power_consumption.txt"
library(lubridate)
library(tidyr)

### loading the dataset, and filtered by date "1/2/2007" and "2/2/2007" stored in table "ihepc" 
ihepc_data <- read.table(ihepc_path, header = TRUE, sep = ";")
ihepc <- ihepc_data[which(ihepc_data$Date == "1/2/2007" | ihepc_data$Date == "2/2/2007"), ]

#### merge date and time (character)
ihepc2 <- unite(ihepc, "date_time", Date:Time, sep = " ", remove = FALSE)
#### convert to date class
ihepc2$date_time <- dmy_hms(ihepc2$date_time)
#### covert to numeric
ihepc$Global_active_power <- as.numeric(ihepc$Global_active_power)
#### open graphics device png, and save the png file with a width of 480 and hight of 480 px
png(filename = "plot2.png", width = 480, height = 480, units = "px")
#### plotting line chart
plot(ihepc$Global_active_power ~ ihepc2$date_time, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()