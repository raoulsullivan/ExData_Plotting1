message('Reading data - this will take a moment')

#reads all the data
data <- read.table('household_power_consumption.txt', sep=";", colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'), header=T, na.strings="?")

message('Data reading complete, nearly done now')

#pull out desired dates
data <- subset(data,data$Date %in% c('1/2/2007','2/2/2007'))

#add in datetime column
data$datetime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

#create png device
png('plot1.png')

#draw histogram
hist(data$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')

#close device
dev.off()

message('All done!')