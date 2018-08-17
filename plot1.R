##This code reads the household_power_consumption.txt, constructs a plot for the data and saves
##it to a PNG file named plot1.png

##Read data into R
powercon <- read.table("household_power_consumption.txt",
                       header = TRUE, sep = ";",stringsAsFactors = FALSE,
                       na.strings = "?")

#Load dplyr package 
library(dplyr)
hpc <- tbl_df(powercon)

#Convert Date variable to date format
hpc<- mutate(hpc, Date=as.Date(Date, format = "%d/%m/%Y")) 
   
      
#Filter records on date range  
hpc_data <- filter(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")


#Open a PNG device to write the plot to
png("plot1.png", width = 480, height = 480)


#Construct plot
hist(hpc_data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (killowatts)",
     ylab = "Frequency",
     col = "red")

#Close device
dev.off()
