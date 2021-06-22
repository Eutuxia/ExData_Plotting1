household_power_consumption <- read.csv("D:/R/household_power_consumption.txt", header=FALSE, sep=";")
names(household_power_consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subsethhpc <- subset(household_power_consumption,household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date =="2/2/2007")

subsethhpc$Date <- as.Date(subsethhpc$Date, format="%d/%m/%Y")
subsethhpc$Time <- strptime(subsethhpc$Time, format="%H:%M:%S")
subsethhpc[1:1440,"Time"] <- format(subsethhpc[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsethhpc[1441:2880,"Time"] <- format(subsethhpc[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


png(file="D:/R/plot2.jpg", width = 480, height = 480)
plot(subsethhpc$Time,as.numeric(as.character(subsethhpc$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()