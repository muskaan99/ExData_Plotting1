dat<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(dat)
dat <- dat[complete.cases(dat), ]#remove data entered as '?'

dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
dat <- subset(dat,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))#read data of 1 day

png(file="plot1.png",width=480, height=480)
hist(as.numeric(dat$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()