power<-read.table("household_power_consumption.txt",skip=1,sep = ";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub<-subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
sub$Date<- as.Date(sub$Date, format="%d/%m/%Y")
sub$Time<-strptime(sub$Time,format = "%H:%M:%S")
sub[1:1440,"Time"]<-format(sub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub[1440:2880,"Time"]<-format(sub[1440:2880,"Time"],"2007-02-02 %H:%M:%S")
sub[1440:2880,"Time"]<-format(sub[1440:2880,"Time"],"2007-02-02 %H:%M:%S")
par(mfrow=c(2,2))
with(sub,{
  plot(sub$Time,as.numeric(as.character(sub$Global_active_power)),type="l",xlab="",ylab="Global Active Power")
 plot(sub$Time,as.numeric(as.character(sub$Voltage)),type="l",xlab="datetime",ylab="Voltage")
 plot(sub$Time,sub$Sub_metering_1, type="n",xlab = "", ylab = "Energy sub metering")
 with(sub,lines(Time,as.numeric(as.character(Sub_metering_1))))
 with(sub,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
 with(sub,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
 legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.6)
 plot(sub$Time,as.numeric(as.character(sub$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})