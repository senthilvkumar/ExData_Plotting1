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

## Plot the histogram of Global active power in these two days
hist(as.numeric(reqd$Global_active_power),col="red",main="Global Active Power", 
	xlab="Global Active Power (kilowatts)",
	xlim=range(0,6),ylim=range(0,1200),axes=FALSE)
axis(side=1,at=seq(0,6,by=2))
axis(side=2,at=seq(0,1200,by=200))

# Saving the plot to a png file
png("plot1.png")
hist(as.numeric(reqd$Global_active_power),col="red",main="Global Active Power", 
	xlab="Global Active Power (kilowatts)",
	xlim=range(0,6),ylim=range(0,1200),axes=FALSE)
axis(side=1,at=seq(0,6,by=2))
axis(side=2,at=seq(0,1200,by=200))
dev.off()


