ns<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
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
#Make plot #2
plot(feb2daysdata$Global_active_power~feb2daysdata$datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Copy to a png file
dev.copy(png, file="plot2.png")
dev.off()