## Course project 1
library(readr)

Electric <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")


object.size(Electric)
format(object.size(Electric), units = "Mb")

names(Electric)


s <- subset(Electric, Electric$Date == "1/2/2007" | Electric$Date == "2/2/2007")

png("plot1.png", width = 480, height = 480)

hist(as.numeric(as.character(s$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()


