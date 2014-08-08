Sys.setlocale("LC_TIME", "English")
da<-read.table("household_power_consumption_clean.txt", header=TRUE) ##read data
c<-as.Date(da$Date, format='%d.%m.%Y')
comb<-as.POSIXct(paste(da$Date, da$Time), format='%d.%m.%Y %H:%M:%S')
png(filename = 'plot2.png', width = 480, height = 480, units = 'px')
plot(comb, da$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()