# Assume downloaded data file from url and extracted in working directory  

# read data from file and subset dates 
rawdata <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data <- rawdata[(rawdata$Date == "1/2/2007") | (rawdata$Date == "2/2/2007"), ]

# format date and time
data$Date = as.Date(data$Date, "%d/%m/%Y")
data$datetime = strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# draw plot of 3 submetering lines
png("plot3.png", width = 480, height = 480)
plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") 
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")

# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()