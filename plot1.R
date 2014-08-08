da<-read.table("household_power_consumption_clean.txt", header=TRUE) ##read data
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
hist(da$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

dev.off()
