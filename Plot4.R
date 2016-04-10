## Plot 4 - 

plot4 <- function() {
        par(mfrow=c(2,2))
        
        ##PLOT 4-1: Active Power over sample days
        plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        
	  ##PLOT 4-2: Voltage over sample days
        plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        ##PLOT 4-3: Sub metering over sample days
        plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(df$timestamp,df$Sub_metering_2,col="red")
        lines(df$timestamp,df$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
        
        #PLOT 4-4 Reactive Power over sample days
        plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        
        #Generate Plot4
        dev.copy(png, file="plot4.png", width=480, height=480)
        dev.off()
}

plot4()