# Download and unzip data file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="/Users/Doris/Desktop/ExData_Plotting1/household_power_consumption.zip", method="curl")
unzip("household_power_consumption.zip")

# Read and subset data
hpower <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
sub_hpower <- hpower[hpower$Date %in% c("1/2/2007", "2/2/2007"),]

# Add a new column "Date_Time"
sub_hpower$Date_Time <- strptime(paste(sub_hpower$Date, sub_hpower$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# Open the png file device
png(file="plot3.png", width=480, height=480)

# Create plot3 and send it to a file
plot(sub_hpower$Date_Time, sub_hpower$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sub_hpower$Date_Time, sub_hpower$Sub_metering_2, type="l", col="red")
lines(sub_hpower$Date_Time, sub_hpower$Sub_metering_3, type="l", col="blue")
legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close the png file device
dev.off()
