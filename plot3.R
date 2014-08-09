## Read the full data set
data <- read.table("household_power_consumption.txt", sep=";", 
	header=TRUE,na.string="?")

## Identify the index for start of 1/2/2007 and end of 2/2/2007 data
## and subset the required data
i1<-match("1/2/2007",data$Date)
i2<-match("3/2/2007",data$Date)-1
reqd<-data[i1:i2,]

## Remove full data
rm(data)

## Fuse date and time
reqd$Date<-strptime(paste(reqd$Date,reqd$Time),"%d/%m/%Y %H:%M:%S")

## Plot the time series of Energy sub-metering in these two days
plot(reqd$Date,reqd$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(reqd$Date,reqd$Sub_metering_2,col="red")
lines(reqd$Date,reqd$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),names(reqd)[7:9])

# Saving the plot to a png file
png("plot3.png")
plot(reqd$Date,reqd$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(reqd$Date,reqd$Sub_metering_2,col="red")
lines(reqd$Date,reqd$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),names(reqd)[7:9])
dev.off()


