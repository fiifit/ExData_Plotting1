# Plot3 function plots one graph displaying three (3) sub metering metrics to a PNG device

plot3 <- function() {
                
        # read in data
        data <- read.csv("household_power_consumption_from_01022007_to_02022007.csv")
        
        # convert Time to date/time
        data$Time <- paste(data$Date, data$Time)
        tmp <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")
        data$Time <- tmp
        
        # plot Global Active Power to PNG file device
        png(filename = "plot3.png")
        with(data, plot(data$Time, data$Sub_metering_1, xlab = "",  ylab = "Energy sub metering", type="n"))
        with(data, lines(data$Time, data$Sub_metering_1, col="black"))
        with(data, lines(data$Time, data$Sub_metering_2, col="red"))
        with(data, lines(data$Time, data$Sub_metering_3, col="blue"))
        legend("topright", lty=1, col =c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off() ##Close the PNG file device
}