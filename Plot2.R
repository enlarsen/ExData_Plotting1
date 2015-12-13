
# read in the loadPowerData function
# It would be better to have loadPowerData() in another
# .R file, but the assignment says there should only be four
# .R files, one for each plot.
source("Plot1.R")

# create the second plot to a file, "plot2.png"
# (unless independent is set to TRUE).
# if independent is set to FALSE, the plot is part of
# a collection of plots (see Plot4.R).
plot2 <- function(independent=TRUE)
{
    if(!exists("powerData"))
    {
        powerData <<- loadPowerData()
    }
    
    ylabel = "Global Active Power"
    
    if(independent)
    {
        png(filename="plot2.png", height = 480, width = 480)
        # There is more room in the independent plot for a longer y label
        ylabel <- paste(ylabel, " (kilowatts)")
    }
    plot(powerData$Global_active_power, type="l", xlab="", xaxt="n", 
         ylab=ylabel)
    # compute locations of Fri and Sat on axis
    thursdayLocation = 1
    fridayLocation = length(powerData$Global_active_power) / 2
    saturdayLocation = length(powerData$Global_active_power)
    
    axis(1, at=c(thursdayLocation, fridayLocation, saturdayLocation), 
         labels=c("Thu", "Fri", "Sat"))
    
    if(independent)
    {
        dev.off()
    }
    
}