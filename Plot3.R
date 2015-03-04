# Plot3 ---- project 1
tag <- c("^[12]/2/2007|^Date")
data<-grep(tag, readLines("household_power_consumption.txt"), value=TRUE)
writeLines(data, "hpc_new.txt")
data<- read.table("hpc_new.txt",sep=";",header=T,na.strings="?")
data$Date <- strptime(paste(data$Date, data$Time, sep =" " ), "%d/%m/%Y %H:%M:%S")
png(filename="Plot3.png", width=480, height=480)
 
plot(data$Date, data$Sub_metering_1, xlab="", ylab="Energy sub metering",type="l",col="Black")
with(data, lines(Date, Sub_metering_2, type="l",col="Red"))
with(data, lines(Date, Sub_metering_3, type="l",col="Blue"))

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  lty=1,
       col=c("Black","Red","Blue"),cex=0.6)

dev.off()