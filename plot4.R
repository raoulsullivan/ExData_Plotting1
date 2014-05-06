message('Reading data - this will take a moment')

#reads all the data
data <- read.table('household_power_consumption.txt', sep=";", colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'), header=T, na.strings="?")

message('Data reading complete, nearly done now')

#pull out desired dates
data <- subset(data,data$Date %in% c('1/2/2007','2/2/2007'))

#add in datetime column
data$datetime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

#create png device
png('plot4.png')

#change rows and columns
par(mfrow=c(2,2))

#draw plot 1
plot(data$datetime,data$Global_active_power,type='l',xlab='',ylab='Global Active Power')

#draw plot 2
plot(data$datetime,data$Voltage,type='l',xlab='datetime',ylab='Voltage')

#draw plot 3
plot(data$datetime,data$Sub_metering_1,type='n',xlab='',ylab='Energy sub metering')
#add lines
points(data$datetime,data$Sub_metering_1,type='l')
points(data$datetime,data$Sub_metering_2,type='l',col='red')
points(data$datetime,data$Sub_metering_3,type='l',col='blue')
#add legend
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,col=c('black','red','blue'),box.lty=0)

#draw plot 4
plot(data$datetime,data$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')

#close device
dev.off()

message('All done!')