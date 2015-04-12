# Assume downloaded data file from url and extracted in working directory  

# read data from file 
rawdata <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# subset data for only dates 2007/02/01 and 2007/02/02
data <- rawdata[(rawdata$Date == "1/2/2007") | (rawdata$Date == "2/2/2007"), ]

# draw histogram plot
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()