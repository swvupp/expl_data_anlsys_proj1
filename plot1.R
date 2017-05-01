setwd("~/Coursera/Data Science/Exploratory Data Analysis")
household_powerconsumption_data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE)

household_powerconsumption_data$Date <- as.Date(household_powerconsumption_data$Date, "%d/%m/%Y")
feb_power_Consumption_data <- subset(household_powerconsumption_data, Date == "2007-02-01" | Date == "2007-02-02") 

feb_power_Consumption_data$Time <- as.character(feb_power_Consumption_data$Time)

Datetime <- strptime(paste(feb_power_Consumption_data$Date, feb_power_Consumption_data$Time), "%Y-%m-%d %H:%M:%OS")

feb_2day_power_consp_fmtd <- cbind(Datetime, feb_power_Consumption_data)

feb_2day_power_consp_fmtd$Global_active_power <- as.numeric(as.character(feb_2day_power_consp_fmtd$Global_active_power))

png(filename="./plot1.png", width = 480, height = 480)
with(feb_2day_power_consp_fmtd, hist(Global_active_power, xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = "red"))
axis(2, at=c(0,200,400,600,800,1000,1200))
dev.off()