# plot1.R

data <- read.table("tidy.txt", header=TRUE, sep = ";", na.strings="?",
                   colClasses = c("character", "character", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric","numeric", "numeric"))

dev.new(width=480, height=480)
hist(data$Global_active_power, col = "red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,'plot1.png')
dev.off()
