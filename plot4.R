require(data.table)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./power.zip")
unzip(zipfile = "./power.zip")


f <- fread("household_power_consumption.txt", select = c(1:5,7:9))

f <- f[Date %in% c("1/2/2007", "2/2/2007")]

f$Global_active_power <- as.numeric(f$Global_active_power)

dateTime <- as.POSIXlt(paste(as.Date(f$Date, format="%d/%m/%Y"), f$Time, sep=" "))


par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(f, {
    plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    plot(dateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(dateTime, f$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    with(f, lines(dateTime, f$Sub_metering_2, col = "red"))
    with(f, lines(dateTime, f$Sub_metering_3, col = "blue"))
    legend("topright", lty = 1, col = c("black", "red", "blue"),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           cex=0.7)
    plot(dateTime, Global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")
})