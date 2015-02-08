require(data.table)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./power.zip")
unzip(zipfile = "./power.zip")


f <- fread("household_power_consumption.txt", select = c(1,2,7:9))

f <- f[Date %in% c("1/2/2007", "2/2/2007")]

dateTime <- as.POSIXlt(paste(as.Date(f$Date, format="%d/%m/%Y"), f$Time, sep=" "))

plot(dateTime, f$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
with(f, lines(dateTime, f$Sub_metering_2, col = "red"))
with(f, lines(dateTime, f$Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))