# Read data within from 2007-2-1 to 2007-2-2
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", skip = 66637, nrow = 2880)
# Add the colomn names
temp <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", nrow = 3)
c <- colnames(temp)
names(data) <- c
# Change the locale for my env
Sys.setlocale("LC_TIME", "en_US")
# For print out
png('plot2.png')
# Change the date format 
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
# Plot
plot(data$Date, data$Global_active_power, type = "l", col = "black", xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()
