##This code reads the household_power_consumption.txt, constructs a plot for the data and saves
##it to a PNG file named plot2.png

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
png("plot2.png", width = 480, height = 480)


#Construct plot with type set equals to "l"
plot(dateTime, hpc$Global_active_power,type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")


#Close device
dev.off()
