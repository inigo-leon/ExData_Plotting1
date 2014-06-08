##Load the data
data<-read.csv("household_power_consumption.txt", sep=";")

##Select data from 1/2/2007 and 2/2/2007 only
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

##Convert Global_active_power into numeric
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))

##Convert Date to Date/Time joining data$Date and data$Time
data$Date<-paste(data$Date,data$Time)
data$Date<-strptime(data$Date, "%d/%m/%Y %H:%M:%S")

##Plot Global_active_power and save it on a png file
png(file="plot1.png")
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()