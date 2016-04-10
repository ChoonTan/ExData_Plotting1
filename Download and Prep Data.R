## 1. Download and Prep Data

## Check if data file already exists. Download if outcome is NO.

if(!file.exists("exdata-data-household_power_consumption.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        datafile <- unzip(temp)
        unlink(temp)
}

powerdata <- read.table(datafile, header=T, sep=";")

## Convert date and time variables
powerDates <- as.Date(powerDates, format="%d/%m/%Y")

## Select sample data required.
Sampledata <- powerdata[(powerDates=="2007-02-01") | (powerDates=="2007-02-02"),]

## Format Data
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

