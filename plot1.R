## Reading the rows corresponding to to the dates "01/02/2007" and "02/02/2007"
library(sqldf)
library(lubridate)
data <- read.csv.sql("household_power_consumption.txt",'select * from file where Date in ("1/2/2007","2/2/2007")',sep=";")

##Changing the "Dates" column's type

data$Date <- dmy(data$Date)

## launching the png graphics' device
png(filename="plot1.png",width=480,height=480,units="px")

## Creating the histogram with th desired parameters
hist(data$Global_active_power,col="red",xlab="Global Active Power (killowatts)", ylab="Frequency",main="Global Active Power")
par(mar=c(5,5,5,3))

## closing the graphics device
dev.off()



