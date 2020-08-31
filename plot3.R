library(lubridate)

dat<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(dat)
dat <- dat[complete.cases(dat), ]#remove data entered as '?'

dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
dat <- subset(dat,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))#read data of 1 day

d_t <- Sys.time()
d_t<-paste(dat$Date,dat$Time)

png(file="plot3.png",width=480, height=480)
plot(as.POSIXct(d_t),as.numeric(dat$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
lines( as.POSIXct(d_t),as.numeric(dat$Sub_metering_2), type="l", col="red")
lines( as.POSIXct(d_t),as.numeric(dat$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"))
dev.off()