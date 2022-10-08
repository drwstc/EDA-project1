# plot1
### dataset path and library loading
ihepc_path <- "./data/household_power_consumption.txt"
library(lubridate)
library(tidyr)

### loading the dataset, and filtered by date "1/2/2007" and "2/2/2007" stored in table "ihepc" 
ihepc_data <- read.table(ihepc_path, header = TRUE, sep = ";")
ihepc <- ihepc_data[which(ihepc_data$Date == "1/2/2007" | ihepc_data$Date == "2/2/2007"), ]

#### open graphics device png, and save the png file with a width of 480 and hight of 480 px
png(filename = "plot1.png", width = 480, height = 480, units = "px")
#### plot histogram
hist(as.numeric(ihepc$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
