## Reading the rows corresponding to to the dates "01/02/2007" and "02/02/2007"
library(sqldf)
library(lubridate)
data <- read.csv.sql("household_power_consumption.txt",'select * from file where Date in ("1/2/2007","2/2/2007")',sep=";")

##Changing the "Dates" column's type

data$Date <- dmy(data$Date)

## launching the png graphics' device
png(filename="plot3.png",width=480,height=480,units="px")

## Creating and annotating the graph

with(data,plot(Sub_metering_1,type='n',ylim=c(0.0,40.0),xaxt='n',xlab="",ylab="Energy sub metering"))
axis(1,at=c(0,1401,2801),labels=c("Thu","Fri","Sat"))
with(data,points(Sub_metering_1,type='l'))
with(data,points(Sub_metering_2,type='l',col="red"))
with(data,points(Sub_metering_3,type='l',col="blue"))
legend("topright",col=c("black","red","blue"), legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),lty=1)
par(mar=c(3,5,2,2))

## closings the graphics device
dev.off()

