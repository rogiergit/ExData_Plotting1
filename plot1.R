#plot1.R
par(mfrow=c(1,1))
Sys.setlocale("LC_TIME", "English")
data<-read.csv("household_power_consumption.txt", na.strings = "?" , sep=";")
data$datetime<-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data<-subset(data, as.Date(Date,"%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date,"%d/%m/%Y") <= as.Date("2007-02-02"))

hist(data$Global_active_power,  col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file= "plot1.png") #copy plot to png
dev.off() #close png device