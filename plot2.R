## Reading the rows corresponding to to the dates "01/02/2007" and "02/02/2007"
library(sqldf)
library(lubridate)
data <- read.csv.sql("household_power_consumption.txt",'select * from file where Date in ("1/2/2007","2/2/2007")',sep=";")

##Changing the "Dates" column's type

data$Date <- dmy(data$Date)

## launching the png graphics' device
png(filename="plot2.png",width=480,height=480,units="px")

## Creating the histogram with th desired parameters

plot(data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xaxt='n',xlab="")
axis(1,at=c(0,1401,2801),labels=c("Thu","Fri","Sat"))
par(mar=c(3,6,2,2))

## closing the graphics device
dev.off()



