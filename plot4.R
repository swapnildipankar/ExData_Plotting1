power.consumption.all <- read.csv2(
  "household_power_consumption.txt",
  #"household_power_consumption_subset.txt",
  colClasses = c("character", "character", "character", "character", "character", "character", "character", "character", "character")
)
#head(power.consumption.all)

power.consumption                       <- power.consumption.all[power.consumption.all$Date == '1/2/2007' | power.consumption.all$Date == '2/2/2007', ]
power.consumption$DateTime              <- apply(power.consumption, 1, function(row) paste(row[1], row[2], sep = " "))
power.consumption$DateTime              <- as.POSIXct(power.consumption$DateTime, format="%d/%m/%Y %H:%M:%S")
power.consumption$Global_active_power   <- as.numeric(power.consumption$Global_active_power)
power.consumption$Global_reactive_power <- as.numeric(power.consumption$Global_reactive_power)
power.consumption$Voltage               <- as.numeric(power.consumption$Voltage)
power.consumption$Global_intensity      <- as.numeric(power.consumption$Global_intensity)
power.consumption$Sub_metering_1        <- as.numeric(power.consumption$Sub_metering_1)
power.consumption$Sub_metering_2        <- as.numeric(power.consumption$Sub_metering_2)
power.consumption$Sub_metering_3        <- as.numeric(power.consumption$Sub_metering_3)
#nrow(power.consumption)
#head(power.consumption)

par(mfrow = c(2, 2))
with(power.consumption, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
with(power.consumption, plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))
with(power.consumption, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
lines(power.consumption$DateTime, power.consumption$Sub_metering_2, col = "red")
lines(power.consumption$DateTime, power.consumption$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(power.consumption, plot(DateTime, Global_reactive_power, xlab = "datetime", type = "l"))
dev.copy(png, "plot4.png")
dev.off()