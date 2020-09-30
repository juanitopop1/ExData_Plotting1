##plot4
library(readr)

Electric <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
s <- subset(Electric, Electric$Date == "1/2/2007" | Electric$Date == "2/2/2007")

s$Date <- as.Date(s$Date, format = "%d/%m/%y")
s$Time <- strptime(s$Time, format = "%H:%M:%S")
s[1:1440, "Time"] <- format(s[1:1440, "Time"], "2007-02-01 %H:%M:$S")
s[1441:2880, "Time"] <- format(s[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
par(mar=c(4,4,3,4))
par(oma=c(0,0,0,0))
with(s, {
        plot(s$Time, as.numeric(as.character(s$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power")
        plot(s$Time, as.numeric(as.character(s$Voltage)), type = "l", xlab = "datetime", ylab = "Voltage")
        plot(s$Time, s$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
        with(s, lines(Time, as.numeric(as.character(Sub_metering_1))))
        with(s, lines(Time, as.numeric(as.character(Sub_metering_2)), col = "red"))
        with(s, lines(Time, as.numeric(as.character(Sub_metering_3)), col = "blue"))
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.25)
        
        plot(s$Time, as.numeric(as.character(s$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        
})
dev.off()