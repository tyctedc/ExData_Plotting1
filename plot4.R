# Read data within from 2007-2-1 to 2007-2-2
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", skip = 66637, nrow = 2880)
# Add the colomn names
temp <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", nrow = 3)
c <- colnames(temp)
names(data) <- c
# Change the locale for my env
Sys.setlocale("LC_TIME", "en_US")
# For print out
png('plot4.png')
# Change the date format 
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
# Plot
par(mfcol = c(2,2))
# Plot at upperleft
plot(data$Date, data$Global_active_power, type = "l", col = "black", xlab ="", ylab = "Global Active Power (kilowatts)")
# Plot at lowerleft
plot(data$Date, data$Sub_metering_1, type = "l", col = "black", xlab ="", ylab = "Energy sub metering")
par(new=T)
lines(data$Date, data$Sub_metering_2, type = "l", col = "red", axes=F, xlab="", ylab="")
par(new=T)
points(data$Date, data$Sub_metering_3, type = "l", col = "blue", axes=F, xlab="", ylab="")
legend("topright", paste("Sub_metering", c(1:3)), lwd = 1, col = c("black", "red", "blue"))
# Plot at upperright
plot(data$Date, data$Voltage, type = "l", col = "black", xlab ="datetime", ylab = "Voltage")
# Plot at lowerright
plot(data$Date, data$Global_reactive_power, type = "l", col = "black", xlab ="datetime", ylab = "Global_reactive_power")

dev.off()
