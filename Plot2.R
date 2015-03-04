# Plot2 ---- project 1
tag <- c("^[12]/2/2007|^Date")
data<-grep(tag, readLines("household_power_consumption.txt"), value=TRUE)
writeLines(data, "hpc_new.txt")
data<- read.table("hpc_new.txt",sep=";",header=T,na.strings="?")
data$Date <- strptime(paste(data$Date, data$Time, sep =" " ), "%d/%m/%Y %H:%M:%S")
png(filename="Plot2.png", width=480, height=480)

plot(data$Date, data$Global_active_power, type="l",
     xlab="" ,ylab=("Global Active Power(kilowatts)"),
     frame.plot=T)
dev.off()