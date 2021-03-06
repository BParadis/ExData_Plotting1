# read table into R
power_cons <- read.table("household_power_consumption.txt", skip = 1, sep = ";")

# provide names to the 9 different variables in the dataset
names(power_cons) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# subset the power consumption data to identify the time frame of 1/2/2007 to 2/2/2007
subpower_cons <- subset(power_cons, power_cons$Date == "1/2/2007" | power_cons$Date == "2/2/2007")

# transform the date and time variables into objects of Date and POSIXlt
subpower_cons$Date <- as.Date(subpower_cons$Date, format = "%d/%m/%Y")
subpower_cons$Time <- strptime(subpower_cons$Time, format = "%H:%M:%S")
subpower_cons[1:1440, "Time"] <- format(subpower_cons[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subpower_cons[1441:2880, "Time"] <- format(subpower_cons[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

## call the basic plot function for Global Active Power Vs Time, including a main title
plot(subpower_cons$Time, as.numeric(as.character(subpower_cons$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
title(main = "Global Active Power Vs Time")

# save it as a .png file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()