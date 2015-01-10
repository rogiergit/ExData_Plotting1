#3
par(mfrow=c(1,1))
Sys.setlocale("LC_TIME", "English")

data<-read.csv("household_power_consumption.txt", na.strings = "?" , sep=";")
data$datetime<-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data<-subset(data, as.Date(Date,"%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date,"%d/%m/%Y") <= as.Date("2007-02-02"))

plot(data$datetime, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(data$datetime, data$Sub_metering_1, type="l", col="black", ylab="Energy sub metering" )
lines(data$datetime, data$Sub_metering_2, type="l", col="red", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue", ylab="Energy sub metering")
legend("topright", cex=0.9, lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png,pointsize = 9, file= "plot3.png") #copy plot to png
dev.off() #close png device