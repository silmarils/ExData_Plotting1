# Read file
df <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)

# convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions

df$myDate <- as.Date(df$Date,format="%d/%m/%Y")

# Filter only 2 dates 2007-02-01 and 2007-02-02

dftmp <- df[(df$myDate == "2007-02-01") | (df$myDate == "2007-02-02"),]

# Prepare X axis, concatenating date and time

dftmp$myDate <- strptime(paste(dftmp$Date,dftmp$Time), "%d/%m/%Y %H:%M:%S")

# plot

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

plot(dftmp$myDate,
     dftmp$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering",
     col="gray"
     )

lines(dftmp$myDate,
      dftmp$Sub_metering_2,
      type="l",
      xlab="",
      ylab="",
      col="red"
      )

lines(dftmp$myDate,
      dftmp$Sub_metering_3,
      type="l",
      xlab="",
      ylab="",
      col="blue"
      )

legend("topright", 
       pch = 151, 
       col = c("gray", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )

dev.off()
