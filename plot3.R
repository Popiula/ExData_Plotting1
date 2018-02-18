# plot3.R

data <- read.table("tidy.txt", header=TRUE, sep = ";", na.strings="?",
                   colClasses = c("character", "character", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric","numeric", "numeric"))

data2 <- cbind(paste(data$Date, data$Time, sep = " "),data[,3:9]) 

colnames(data2)[1]<-"Date"

data2$Date <- strptime(data2$Date,format="%d/%m/%Y %H:%M:%S")

x<-data2$Date
y1<-data2$Sub_metering_1
y2<-data2$Sub_metering_2
y3<-data2$Sub_metering_3 

Sys.setlocale("LC_ALL","English")

dev.new(width=480, height=480)
par(mar=c(3,5,1,1)) 
plot(range(x),range(c(y1,y2,y3)),type='n',xlab="",ylab="Energy sub metering")
lines(x,y1, type='l', col='black')
lines(x,y2, type='l', col='red')
lines(x,y3, type='l', col='blue')

# add a legend 
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, col = c("black","red","blue"))

dev.copy(png,'plot3.png')
dev.off()