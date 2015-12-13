
# read in the loadPowerData function
# It would be better to have loadPowerData() in another
# .R file, but the assignment says there should only be four
# .R files, one for each plot.
source("Plot1.R")

# make plot3, with independent indicating whether it should
# be an independent plot (rather than part of another series
# of plots). Write to "plot3.png" if independent is TRUE.
plot3 <- function(independent=TRUE)
{
    if(!exists("powerData"))
    {
        powerData <<- loadPowerData()
    }
    
    if(independent)
    {
        png(filename="plot3.png", height = 480, width = 480)
        btyValue = "o"
    }
    else
    {
        # not enough room for the box around the legend
        # when plot included in plot4
        btyValue = "n"
    }
        
    plot(powerData$Sub_metering_1, type="l", xlab="", xaxt="n", 
               ylab="Energy sub metering")
    lines(powerData$Sub_metering_2, type="l", col="red")
    lines(powerData$Sub_metering_3, type="l", col="blue")
    legend("topright", names(powerData)[7:9], lwd=c(1,1,1), 
           col=c("black", "red", "blue"), bty=btyValue)
    # compute locations of Fri and Sat on axis
    thursdayLocation = 1
    fridayLocation = length(powerData$Sub_metering_1) / 2
    saturdayLocation = length(powerData$Sub_metering_1)
    
    axis(1, at=c(thursdayLocation, fridayLocation, saturdayLocation), 
         labels=c("Thu", "Fri", "Sat"))
    
    if(independent)
    {
        dev.off()
    }
    
}