## plot2
library(readr)

Electric <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
s <- subset(Electric, Electric$Date == "1/2/2007" | Electric$Date == "2/2/2007")
s$Date <- as.Date(s$Date, format = "%d/%m/%y")
s$Time <- strptime(s$Time, format = "%H:%M:%S")
s[1:1440, "Time"] <- format(s[1:1440, "Time"], "2007-02-01 %H:%M:$S")
s[1441:2880, "Time"] <- format(s[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(s$Time, as.numeric(as.character(s$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
title(main = "Global Active Power vs Time")

dev.off()
