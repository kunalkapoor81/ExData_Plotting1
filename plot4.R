##This code reads the household_power_consumption.txt, constructs a plot for the data and saves
##it to a PNG file named plot4.png

##Read data into R
powercon <- read.table("household_power_consumption.txt",
                       header = TRUE, sep = ";",stringsAsFactors = FALSE,
                       na.strings = "?")

#Filter on Dates
subpowercon <- powercon[powercon$Date %in% c("1/2/2007","2/2/2007") ,]

#Load dplyr package 
library(dplyr)
hpc <- tbl_df(subpowercon)

#Create a datetime variable
dateTime <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Open a PNG device to write the plot to
png("plot4.png", width = 480, height = 480)

#Create space for 4 graphs in a 2X2 area
par(mfrow = c(2, 2))

plot(dateTime, hpc$Global_active_power,type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

plot(dateTime, hpc$Voltage,type = "l",
     ylab = "Voltage", xlab = "datetime")

#Start with a plot for sub_metering_1
plot(dateTime, hpc$Sub_metering_1,type = "l",
     ylab = "Energy sub metering", xlab = "")

#Add lines to the graph for sub_metering_2 and sub_metering_3
lines(dateTime, hpc$Sub_metering_2, type = "l", col = "red")
lines(dateTime, hpc$Sub_metering_3, type = "l", col = "blue")

#Add legend to the graph
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)


#Global Reactive Power w.r.t TIme
plot(dateTime, hpc$Global_reactive_power,type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")




#Close device
dev.off()
