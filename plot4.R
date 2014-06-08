##Load the data
data<-read.csv("household_power_consumption.txt", sep=";")

##Select data from 1/2/2007 and 2/2/2007 only
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

##Convert Global_active_power, Sub_metering_1, Sub_metering_2 and Sub_metering_3 into numeric
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
data$Voltage<-as.numeric(as.character(data$Voltage))
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))


##Convert Date to Date/Time joining data$Date and data$Time
data$Date<-paste(data$Date,data$Time)
data$Date<-strptime(data$Date, "%d/%m/%Y %H:%M:%S")

##Plot all the graphics
png(file="plot4.png")

##Two rows and two columns
par(mfrow=c(2,2))

##Adjust margin
par(mar=c(4,4,4,2))

##First graphic
plot(data$Date,data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

##Second graphic
plot(data$Date,data$Voltage, type="l", ylab="Voltage", xlab="datetime")

##Third graphic
plot(data$Date,data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$Date,data$Sub_metering_1)
lines(data$Date,data$Sub_metering_2,col="red")
lines(data$Date,data$Sub_metering_3,col="blue")
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Fourth graphic
plot(data$Date,data$Global_reactive_power, type="l",  ylab="Global_reactive_power", xlab="datetime")


dev.off()


##NOTE: the names of the X axe are in Spanish language