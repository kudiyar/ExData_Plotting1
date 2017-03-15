data <- read.table(unzip("household_power_consumption.zip", "household_power_consumption.txt"),
                   header = TRUE, sep = ";")
par(mfrow = c(1,1))
head(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- with(data, data[ (Date == "2007-02-01") | (Date == "2007-02-02"),])
data$Global_active_power <- as.numeric(data$Global_active_power)
hist(data$Global_active_power/500, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",col = "red") ##
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()