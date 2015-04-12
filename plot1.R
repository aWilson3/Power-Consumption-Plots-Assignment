power <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE)
power <- power[power$Date=='1/2/2007' | power$Date == '2/2/2007',]

power$Date <- as.Date(power$Date, format='%d/%m/%Y')
power$Time <- strptime(power$Time, format = '%H:%M:%S')
power$Time <- strftime(power$Time, format = '%H:%M:%S')

for(i in 3:ncol(power)){
  power[,i] = as.numeric(power[,i])
}

png(file='plot1.png')
with(power, hist(Global_active_power, col='red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)'))
dev.off()
