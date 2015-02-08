#loading data
househPowercons<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
#Converting Date column to Date
househPowercons$Date<-as.Date(househPowercons$Date,"%d/%m/%Y")
#getting data between dates 2007/02/01 and 2007/02/02
feb2daysdata<-househPowercons[househPowercons$Date >= as.Date("2007-02-01") & househPowercons$Date <= as.Date("2007-02-02"),]
#plot 1
hist(feb2daysdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
dev.copy(png, file="plot1.png")
dev.off()