# Plot4 ---- project 1
tag <- c("^[12]/2/2007|^Date")
data<-grep(tag, readLines("household_power_consumption.txt"), value=TRUE)
writeLines(data, "hpc_new.txt")
data<- read.table("hpc_new.txt",sep=";",header=T,na.strings="?")
data$Date <- strptime(paste(data$Date, data$Time, sep =" " ), "%d/%m/%Y %H:%M:%S")
png(filename="Plot4.png", width=480, height=480)

par(mfrow=c(2,2))
# plot 4.1
plot(data$Date, data$Global_active_power, type="l",
     xlab="" ,ylab=("Global Active Power"),
     frame.plot=T)
# plot 4.2
plot(data$Date, data$Voltage, type="l",
     xlab="datatime" ,ylab=("Voltage"),
     frame.plot=T)
#Plot 4.3
with(data, plot(Date, Sub_metering_1,
        xlab="", ylab="Energy sub metering",type="l",col="Black"))
with(data,lines(Date, Sub_metering_2, type="l",col="Red"))
lines(data$Date, data$Sub_metering_3, type="l",col="Blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),  lty=1,
       col=c("Black","Red","Blue"),cex=0.8, box.lty=0, inset=.02)
# Plot 4. 4
with(data, plot(Date, Global_reactive_power, type="l",
        xlab="datatime" ), frame.plot=T)
dev.off()