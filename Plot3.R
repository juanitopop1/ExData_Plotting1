## plot 3
library(readr)

Electric <- read.csv("../Scripts/proyectos R/Course Project 1/household_power_consumption.txt", header = TRUE, sep = ";")
s <- subset(Electric, Electric$Date == "1/2/2007" | Electric$Date == "2/2/2007")
s$Date <- as.Date(s$Date, format = "%d/%m/%y")
s$Time <- strptime(s$Time, format = "%H:%M:%S")
s[1:1440, "Time"] <- format(s[1:1440, "Time"], "2007-02-01 %H:%M:$S")
s[1441:2880, "Time"] <- format(s[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(s$Time, s$Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub metering")
with(s, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(s, lines(Time, as.numeric(as.character(Sub_metering_2)), col = "red"))
with(s, lines(Time, as.numeric(as.character(Sub_metering_3)), col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6)

title(main = "Energy Sub-metering")

dev.off()
