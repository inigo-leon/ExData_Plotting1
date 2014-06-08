##Load the data
data<-read.csv("household_power_consumption.txt", sep=";")

##Select data from 1/2/2007 and 2/2/2007 only
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

##Convert Sub_metering_1, Sub_metering_2 and Sub_metering_3 into numeric
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))

##Convert Date to Date/Time joining data$Date and data$Time
data$Date<-paste(data$Date,data$Time)
data$Date<-strptime(data$Date, "%d/%m/%Y %H:%M:%S")

##Plot Global_active_power/500 for showing the correct X axe scale
png(file="plot3.png")

plot(data$Date,data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$Date,data$Sub_metering_1)
lines(data$Date,data$Sub_metering_2,col="red")
lines(data$Date,data$Sub_metering_3,col="blue")

legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()


##NOTE: the names of the X axe are in Spanish language