# Read file
df <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)

# convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions

df$myDate <- as.Date(df$Date,format="%d/%m/%Y")

# Filter only 2 dates 2007-02-01 and 2007-02-02

dftmp <- df[(df$myDate == "2007-02-01") | (df$myDate == "2007-02-02"),]

# Prepare X axis, concatenating date and time

dftmp$myDate <- strptime(paste(dftmp$Date,dftmp$Time), "%d/%m/%Y %H:%M:%S")

# plot

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

par(mfrow = c(2, 2))

# first plot @ (1,1) is plot # 2

plot(dftmp$myDate,                # X axis
     dftmp$Global_active_power,   # Y axis
     type="l",                    # type of graph - continous line
     xlab="",                     # X label - empty
     ylab="Global Active Power"   # Y label - provided label
)

# 2nd plot @ (1,2) is similar to plot # 2 (other distinct metric)

plot(dftmp$myDate,     # X axis
     dftmp$Voltage,    # Y axis
     type="l",         # type of graph - continous line
     xlab="datetime",  # X label - empty
     ylab="Voltage"    # Y label - provided label
)


# 3rd plot @ (2,1) is plot # 3

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

# 4th plot @ (2,2) is similar to plot # 2 (other distinct metric)

plot(dftmp$myDate,                  # X axis
     dftmp$Global_reactive_power,   # Y axis
     type="l",                      # type of graph - continous line
     xlab="datetime",               # X label - empty
     ylab="Global_reactive_power"   # Y label - provided label
)

dev.off()
