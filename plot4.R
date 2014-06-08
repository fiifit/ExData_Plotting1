#Plot4 function plots four(4) different graphs for power consumption metrics to PNG file device
 
plot4 <- function() {
        
        # read in data
        data <- read.csv("household_power_consumption_from_01022007_to_02022007.csv")
        
        # convert Time to date/time
        data$Time <- paste(data$Date, data$Time)
        tmp <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")
        data$Time <- tmp
        
        # plot Global Active Power to PNG file device
        png(filename = "plot4.png")
        par(mfcol = c(2,2))
        plot(data$Time, data$Global_active_power, type="s", xlab ="", ylab = "Global Active Power (kilowatts)")
        with(data, plot(data$Time, data$Sub_metering_1, xlab = "",  ylab = "Energy sub metering", type="n"))
        with(data, lines(data$Time, data$Sub_metering_1, col="black"))
        with(data, lines(data$Time, data$Sub_metering_2, col="red"))
        with(data, lines(data$Time, data$Sub_metering_3, col="blue"))
        legend("topright", lty=1, bty="n", col =c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(data$Time, data$Voltage, type="s", xlab ="datetime", ylab = "Voltage")
        plot(data$Time, data$Global_reactive_power, type="s", xlab ="datetime", ylab = "Global_reactive_power")
        dev.off() ##Close the PNG file device
}