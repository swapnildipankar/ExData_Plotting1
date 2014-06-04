setClass('custom.date')
setClass('custom.time')

as.numeric.factor <- function(x) {
  (as.numeric(levels(x))[x])
}

setAs("character","custom.date", function(from) as.Date(from, format="%d/%m/%Y"))
setAs("character","custom.time", function(from) strptime(from, format="%H:%M:%S"))

power.consumption.all <- read.csv2(
  "household_power_consumption.txt",
  #colClasses = c("custom.date", "custom.time", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
  colClasses = c("custom.date", "factor", "factor", "factor", "factor", "factor", "factor", "factor", "factor")
)
#head(power.consumption.all)

# filter the power consumption data for two dates
power.consumption <- power.consumption.all[power.consumption.all$Date == as.Date('2007-02-01') | power.consumption.all$Date == as.Date('2007-02-02'), ]

# convert all the data from "factor" to "numeric"
power.consumption$Global_active_power = as.numeric.factor(power.consumption$Global_active_power)
power.consumption$Global_reactive_power = as.numeric.factor(power.consumption$Global_reactive_power)
power.consumption$Voltage = as.numeric.factor(power.consumption$Voltage)
power.consumption$Global_intensity = as.numeric.factor(power.consumption$Global_intensity)
power.consumption$Sub_metering_1 = as.numeric.factor(power.consumption$Sub_metering_1)
power.consumption$Sub_metering_2 = as.numeric.factor(power.consumption$Sub_metering_2)
power.consumption$Sub_metering_3 = as.numeric.factor(power.consumption$Sub_metering_3)

#nrow(power.consumption)
#head(power.consumption)
#power.consumption

hist(power.consumption$Global_active_power, freq=TRUE, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.copy(png, "plot1.png")
dev.off()