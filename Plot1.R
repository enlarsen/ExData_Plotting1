library(lubridate)

# Download and clean up the power data
loadPowerData <- function()
{
    if(!file.exists("power.zip")) # only download if the file doesn't exist
    {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  "power.zip")
    
        unzip("power.zip")    
    }

    # read.csv imports almost everything as factor, so tell read.csv 
    # the correct classes for the columns
    classes = c("character", "character", "numeric", "numeric", 
                "numeric","numeric","numeric","numeric","numeric")
    powerData <- read.csv("household_power_consumption.txt", sep=";",
                          na.strings="?", colClasses = classes)
    
    # Fix the date column so it's real dates
    powerData$Date <- dmy(powerData$Date)

    intervalFilter <- new_interval(ymd("2007-02-01"), ymd("2007-02-02"))
    
    # create and return a filtered dataset for dates 2007-02-01 through
    # 2007-02-02
    shortenedPowerData <- powerData[powerData$Date %within% intervalFilter, ]
    shortenedPowerData
}

# create plot1 to an file, plot1.png
plot1 <- function()
{
    if(!exists("powerData"))
    {
        powerData <<- loadPowerData()
    }
    
    png(filename="plot1.png", height = 480, width = 480)
    hist(powerData$Global_active_power, col="red", 
         main="Global Active Power", xlab="Global Active Power (kilowatts)")
    dev.off()
    
}
