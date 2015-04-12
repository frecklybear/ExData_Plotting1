# Assume downloaded data file from url and extracted in working directory  

# read data from file and subset dates 
rawdata <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data <- rawdata[(rawdata$Date == "1/2/2007") | (rawdata$Date == "2/2/2007"), ]

# format date and time
data$Date = as.Date(data$Date, "%d/%m/%Y")
data$datetime = strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# draw plot
png("plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
