# plot2.R

data <- read.table("tidy.txt", header=TRUE, sep = ";", na.strings="?",
                   colClasses = c("character", "character", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric","numeric", "numeric"))

data2 <- cbind(paste(data$Date, data$Time, sep = " "),data[,3:9]) 

colnames(data2)[1]<-"Date"

data2$Date <- strptime(data2$Date,format="%d/%m/%Y %H:%M:%S")

x<-data2$Date
y<-data2$Global_active_power

Sys.setlocale("LC_ALL","English")

dev.new(width=480, height=480)
par(mar=c(3,5,1,1)) # abajo, izq, arriba, dcha
plot(x,y,type="l",xlab="",ylab="Global Active Power (kilowatts)",ylim=c(0,8))

dev.copy(png,'plot2.png')
dev.off()
