# Download and unzip data file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="/Users/Doris/Desktop/ExData_Plotting1/household_power_consumption.zip", method="curl")
unzip("household_power_consumption.zip")

# Read and subset data
hpower <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")
sub_hpower <- hpower[hpower$Date %in% c("1/2/2007", "2/2/2007"),]

# Open the png file device
png(file="plot1.png", width=480, height=480 )

# Create plot1 and send to a file
hist(sub_hpower$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

# Close the png file device
dev.off()
