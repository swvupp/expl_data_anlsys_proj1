setwd("~/Coursera/Data Science/Exploratory Data Analysis")
household_powerconsumption_data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE)

household_powerconsumption_data$Date <- as.Date(household_powerconsumption_data$Date, "%d/%m/%Y")
feb_power_Consumption_data <- subset(household_powerconsumption_data, Date == "2007-02-01" | Date == "2007-02-02") 

feb_power_Consumption_data$Time <- as.character(feb_power_Consumption_data$Time)

Datetime <- strptime(paste(feb_power_Consumption_data$Date, feb_power_Consumption_data$Time), "%Y-%m-%d %H:%M:%OS")

feb_2day_power_consp_fmtd <- cbind(Datetime, feb_power_Consumption_data)

feb_2day_power_consp_fmtd$Global_active_power <- as.numeric(as.character(feb_2day_power_consp_fmtd$Global_active_power))

png(filename = "./plot2.png", width = 480, height = 480)
with(feb_2day_power_consp_fmtd, plot(Datetime, Global_active_power, xlab = "", ylab = "Global Active Power (Kilowatts)", type = "l"))
dev.off()

