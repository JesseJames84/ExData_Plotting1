# download and unzip the file

fileurl   <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file( fileurl, destfile = "data.zip" )

unzip( "data.zip" )

# read in the file into R

df <- read.csv("~/RStudio/ExData_Plotting1/household_power_consumption.txt", sep=";", na.strings="?")

# create datetime variable and convert date variable

df$Date <- as.Date(df$Date, "%d/%m/%Y")

df$datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

data$datetime <- as.POSIXct(data$datetime)

# subset data frame by relevant dates

data <- subset(df, Date == "2007-02-01" | Date == "2007-02-02")

# create plots

png("plot4.png", height=480, width=480)

par(mfrow=c(2,2))

# plot 1

with(data, plot(Global_active_power ~ datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

#plot 2

with(data, plot(Voltage ~ datetime, type="l", ylab="Global Active Power (kilowatts)"))

# plot 3

with(data, plot(Sub_metering_1 ~ datetime, type="l", ylab="Energy sub metering", xlab=""))

with(data, lines(Sub_metering_2 ~ datetime, col="red"))

with(data, lines(Sub_metering_3 ~ datetime, col="blue"))

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot 4

with(data, plot(Global_reactive_power ~ datetime, type="l"))

dev.off()