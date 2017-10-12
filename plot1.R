# read table into R
power_cons <- read.table("household_power_consumption.txt", skip = 1, sep = ";")

# provide names to the 9 different variables in the dataset
names(power_cons) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# subset the power consumption data to identify the time frame of 1/2/2007 to 2/2/2007
subpower_cons <- subset(power_cons, power_cons$Date == "1/2/2007" | power_cons$Date == "2/2/2007")

# call the basic plot function for Global Active Power, including a main title
hist(as.numeric(as.character(subpower_cons$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

# save it as a .png file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()