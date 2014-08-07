# Read file
df <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)

# convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions

df$myDate <- as.Date(df$Date,format="%d/%m/%Y")

# Filter only 2 dates 2007-02-01 and 2007-02-02

dftmp <- df[(df$myDate == "2007-02-01") | (df$myDate == "2007-02-02"),]

# Prepare X axis, concatenating date and time

dftmp$myDate <- strptime(paste(dftmp$Date,dftmp$Time), "%d/%m/%Y %H:%M:%S")

# plot

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

plot(dftmp$myDate,                            # X axis
     dftmp$Global_active_power,               # Y axis
     type="l",                                # type of graph - continous line
     xlab="",                                 # X label - empty
     ylab="Global Active Power (kilowatts)"   # Y label - provided label
     )

dev.off()
