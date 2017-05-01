setwd("~/Coursera/Data Science/Exploratory Data Analysis")
household_powerconsumption_data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE)

household_powerconsumption_data$Date <- as.Date(household_powerconsumption_data$Date, "%d/%m/%Y")
feb_power_Consumption_data <- subset(household_powerconsumption_data, Date == "2007-02-01" | Date == "2007-02-02") 

feb_power_Consumption_data$Time <- as.character(feb_power_Consumption_data$Time)

Datetime <- strptime(paste(feb_power_Consumption_data$Date, feb_power_Consumption_data$Time), "%Y-%m-%d %H:%M:%OS")

feb_2day_power_consp_fmtd <- cbind(Datetime, feb_power_Consumption_data)

feb_2day_power_consp_fmtd$Global_active_power <- as.numeric(as.character(feb_2day_power_consp_fmtd$Global_active_power))

feb_2day_power_consp_fmtd$Sub_metering_1 <- as.numeric(as.character(feb_2day_power_consp_fmtd$Sub_metering_1))
feb_2day_power_consp_fmtd$Sub_metering_2 <- as.numeric(as.character(feb_2day_power_consp_fmtd$Sub_metering_2))
feb_2day_power_consp_fmtd$Sub_metering_3 <- as.numeric(as.character(feb_2day_power_consp_fmtd$Sub_metering_3))

png(filename = "./plot3.png", width = 480, height = 480)
with(feb_2day_power_consp_fmtd, plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering"))
with(feb_2day_power_consp_fmtd, lines(Datetime, Sub_metering_2, type = "l", col = "red"))
with(feb_2day_power_consp_fmtd, lines(Datetime, Sub_metering_3, type = "l", col = "blue"))
with(feb_2day_power_consp_fmtd, legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")))
dev.off()
