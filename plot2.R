power.consumption.all <- read.csv2(
  "household_power_consumption.txt",
  #"household_power_consumption_subset.txt",
  colClasses = c("character", "character", "character", "character", "character", "character", "character", "character", "character")
)
#head(power.consumption.all)
power.consumption <- power.consumption.all[power.consumption.all$Date == '1/2/2007' | power.consumption.all$Date == '2/2/2007', ]
power.consumption$DateTime <- apply(power.consumption, 1, function(row) paste(row[1], row[2], sep = " "))
power.consumption$DateTime <- as.POSIXct(power.consumption$DateTime, format="%d/%m/%Y %H:%M:%S")
power.consumption$Global_active_power <- as.numeric(power.consumption$Global_active_power)
#nrow(power.consumption)
#head(power.consumption)

with(power.consumption, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.copy(png, "plot2.png")
dev.off()