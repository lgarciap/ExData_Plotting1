househPowercons<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
#Converting Date column to Date
househPowercons$Date<-as.Date(househPowercons$Date,"%d/%m/%Y")
#getting data between dates 2007/02/01 and 2007/02/02
feb2daysdata<-househPowercons[househPowercons$Date >= as.Date("2007-02-01") & househPowercons$Date <= as.Date("2007-02-02"),]ns<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
#Converting Date column to Date
househPowercons$Date<-as.Date(househPowercons$Date,"%d/%m/%Y")
#getting data between dates 2007/02/01 and 2007/02/02
feb2daysdata<-househPowercons[househPowercons$Date >= as.Date("2007-02-01") & househPowercons$Date <= as.Date("2007-02-02"),]
#creating a new column datetime
datetime<-strptime(paste(feb2daysdata$Date,feb2daysdata$Time, sep=" "), format="%Y-%m-%d %T")
feb2daysdata<-cbind(feb2daysdata,datetime)
#Changing language to English
Sys.setlocale("LC_TIME", "English")
png("plot3.png")
#Make plot #3
plot(feb2daysdata$datetime,feb2daysdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(feb2daysdata$datetime,feb2daysdata$Sub_metering_2, col="red")
lines(feb2daysdata$datetime,feb2daysdata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = 1)
#closing png file
dev.off()