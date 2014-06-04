power.consumption.all <- read.csv2(
  "household_power_consumption.txt",
  #"household_power_consumption_subset.txt",
  colClasses = c("character", "character", "character", "character", "character", "character", "character", "character", "character")
)
#head(power.consumption.all)
power.consumption <- power.consumption.all[power.consumption.all$Date == '1/2/2007' | power.consumption.all$Date == '2/2/2007', ]
power.consumption$Global_active_power <- as.numeric(power.consumption$Global_active_power)
#nrow(power.consumption)
#head(power.consumption)

hist(power.consumption$Global_active_power, freq=TRUE, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.copy(png, "plot1.png")
dev.off()