# Plot1 ---- project 1
tag <- c("^[12]/2/2007|^Date")
data<-grep(tag, readLines("household_power_consumption.txt"), value=TRUE)
writeLines(data, "hpc_new.txt")
data<- read.table("hpc_new.txt",sep=";",header=T,na.strings="?")
data$Date <- strptime(paste(data$Date, data$Time, sep =" " ), "%d/%m/%Y %H:%M:%S")
png(filename="Plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power",xlab=("Global Active Power(kilowatts)"))
dev.off()
