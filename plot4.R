# plot4.R

data <- read.table("tidy.txt", header=TRUE, sep = ";", na.strings="?",
                   colClasses = c("character", "character", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric","numeric", "numeric"))

data2 <- cbind(paste(data$Date, data$Time, sep = " "),data[,3:9]) 

colnames(data2)[1]<-"Date"

data2$Date <- strptime(data2$Date,format="%d/%m/%Y %H:%M:%S")

x<-data2$Date
y<-data2$Global_active_power
y1<-data2$Sub_metering_1
y2<-data2$Sub_metering_2
y3<-data2$Sub_metering_3 
v<- data$Voltage
grp<-data$Global_reactive_power

Sys.setlocale("LC_ALL","English")

dev.new(width=480, height=480)

par(mfcol=c(2,2))

par(mar=c(3,5,1,1)) # abajo, izq, arriba, dcha

# plot 1 : Global Active Power

plot(x,y,type="l",xlab="",ylab="Global Active Power (kilowatts)",ylim=c(0,8))

# plot 2 : Sub_metering

plot(range(x),range(c(y1,y2,y3)),type='n',xlab="",ylab="Energy sub metering")
lines(x,y1, type='l', col='black')
lines(x,y2, type='l', col='red')
lines(x,y3, type='l', col='blue')

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, col = c("black","red","blue"))

# plot 3 : Voltage

plot(x,v,type="l",xlab="datetime",ylab="Voltage")

# plot 4 : Global Reactive Power

plot(x,grp,type="l",xlab="datetime",ylab="Global Reactive Power (kilowatts)")

# Save the .png file
dev.copy(png,'plot4.png')
dev.off()