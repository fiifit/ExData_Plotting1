#Plot2 function  plots a graph of Global Active Power over the observed period to a PNG device

plot2 <- function() {
        
        #read in data
        data <- read.csv("household_power_consumption_from_01022007_to_02022007.csv")
        
        #convert Time to date/time
        data$Time <- paste(data$Date, data$Time)
        tmp <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")
        data$Time <- tmp
        
        
        #plot Global Active Power to PNG file device
        png(filename = "plot2.png")
        plot(data$Time, data$Global_active_power, type="s", xlab ="", ylab = "Global Active Power (kilowatts)")
        dev.off() ##Close the PNG file device
}