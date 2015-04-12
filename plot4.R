power <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE)
power <- power[power$Date=='1/2/2007' | power$Date == '2/2/2007',]

power$Date <- as.Date(power$Date, format='%d/%m/%Y')
power$Time <- strptime(power$Time, format = '%H:%M:%S')
power$Time <- strftime(power$Time, format = '%H:%M:%S')

for(i in 3:ncol(power)){
  power[,i] = as.numeric(power[,i])
}

png(file='plot4.png')
par(mfcol=C(2,2))

#First plot
with(power, plot(Global_active_power, type='l', xaxt = 'n', xlab = '', ylab = 'Global Active Power (kilowatts)'))
axis(1, at=c(0,1500,2950), labels = c('Thu', 'Fri', 'Sat'))

#Second plot
with(power, plot(Sub_metering_1, type = 'l', xaxt = 'n', xlab = '', ylab = 'Energy sub metering', col = 'black'))
axis(1, at = c(0,1500,2950), labels = c('Thu', 'Fri', 'Sat'))
lines(power$Sub_metering_2, col='red')
lines(power$Sub_metering_3, col='blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

#Third Plot
with(power, plot(Voltage, type='l', xaxt = 'n', xlab = 'datetime', ylab = 'Voltage'))
axis(1, at=c(0,1500,2950), labels = c('Thu', 'Fri', 'Sat'))

#Fourth Plot
with(power, plot(Global_reactive_power, type='l', xaxt = 'n', xlab = 'datetime', ylab = 'Global_reactive_power'))
axis(1, at=c(0,1500,2950), labels = c('Thu', 'Fri', 'Sat'))

dev.off()

