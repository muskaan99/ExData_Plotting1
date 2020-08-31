library(lubridate)

dat<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(dat)
dat <- dat[complete.cases(dat), ]#remove data entered as '?'

dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
dat <- subset(dat,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))#read data of 1 day

d_t <- Sys.time()
d_t<-paste(dat$Date,dat$Time)

png(file="plot2.png",width=480, height=480)
plot(as.POSIXct(d_t),as.numeric(dat$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()