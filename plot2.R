require(data.table)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./power.zip")
unzip(zipfile = "./power.zip")


f <- fread("household_power_consumption.txt", select = c(1:3))

f <- f[Date %in% c("1/2/2007", "2/2/2007")]

f$Global_active_power <- as.numeric(f$Global_active_power)

dateTime <- as.POSIXlt(paste(as.Date(f$Date, format="%d/%m/%Y"), f$Time, sep=" "))
plot(dateTime, f$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")