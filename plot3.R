power.consumption.all <- read.csv2(
  "household_power_consumption.txt",
  #"household_power_consumption_subset.txt",
  colClasses = c("character", "character", "character", "character", "character", "character", "character", "character", "character")
)
#head(power.consumption.all)
power.consumption <- power.consumption.all[power.consumption.all$Date == '1/2/2007' | power.consumption.all$Date == '2/2/2007', ]
power.consumption$DateTime <- apply(power.consumption, 1, function(row) paste(row[1], row[2], sep = " "))
power.consumption$DateTime <- as.POSIXct(power.consumption$DateTime, format="%d/%m/%Y %H:%M:%S")

power.consumption$Sub_metering_1 <- as.numeric(power.consumption$Sub_metering_1)
power.consumption$Sub_metering_2 <- as.numeric(power.consumption$Sub_metering_2)
power.consumption$Sub_metering_3 <- as.numeric(power.consumption$Sub_metering_3)
#nrow(power.consumption)
#head(power.consumption)

with(power.consumption, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
lines(power.consumption$DateTime, power.consumption$Sub_metering_2, col = "red")
lines(power.consumption$DateTime, power.consumption$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.width = 57500)
dev.copy(png, "plot3.png")
dev.off()