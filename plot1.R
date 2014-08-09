data <- read.table("hpc.txt", header=TRUE, sep = ";")
png('plot1.png')
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
