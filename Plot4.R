
# read in the loadPowerData function
# It would be better to have loadPowerData() in another
# .R file, but the assignment says there should only be four
# .R files, one for each plot.
source("Plot1.R")

# Create "plot4.png" from plot2() and plot3() and
# two new plots.
plot4 <- function()
{
    if(!exists("powerData"))
    {
        powerData <<- loadPowerData()
    }
    
    
    png(filename="plot4.png", height = 480, width = 480)
    parOptions <- par(mfcol=c(2,2))
    
    
    plot2(independent = FALSE)
    plot3(independent = FALSE)
    plotVoltage()
    plotGlobalReactivePower()

    dev.off()

    # reset to previous settings
    par(parOptions)
}

plotVoltage <- function()
{
    plot(powerData$Voltage, type="l", xlab="datetime", xaxt="n", 
        ylab="Voltage")
    createXAxis()
}

plotGlobalReactivePower <- function()
{
    with(powerData, {
        plot(Global_reactive_power, type="l", xlab="datetime", 
             xaxt="n")
    })
    createXAxis()
}

createXAxis <- function()
{
    # compute locations of Fri and Sat on axis
    thursdayLocation = 1
    fridayLocation = length(powerData$Global_active_power) / 2
    saturdayLocation = length(powerData$Global_active_power)
    
    axis(1, at=c(thursdayLocation, fridayLocation, saturdayLocation), 
        labels=c("Thu", "Fri", "Sat"))
    
}