#Plot1 function plots a histogram of Global Active Power to a PNG device

plot1 <- function() {
       
        #read in data
        data <- read.csv("household_power_consumption_from_01022007_to_02022007.csv")
        
        #plot histogram of Global Active Power to PNG file device
        png(filename = "plot1.png")
        hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main ="Global Active Power")
        
        dev.off() ##Close the PNG file device
        
}