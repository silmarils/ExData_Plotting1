# Read file
df <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)

# convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions
# -> as.Date(head(df$Date),format="%d/%m/%Y")

# Filter only 2 dates 2007-02-01 and 2007-02-02

df$myDate <- as.Date(df$Date,format="%d/%m/%Y")


# graph
# note that format used to transform date is not the same as format provided in assignment
#

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)


hist(as.numeric((df[(df$myDate == "2007-02-01") | (df$myDate == "2007-02-02"),]$Global_active_power)),
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col="red",
     xlim=c(0,8),ylim=c(0,1400),axes=FALSE)

axis(side=1, at=seq(0, 6, by=2))        ### Validated
axis(side=2, at=seq(0, 1400, by=200))   ### Work in progress

dev.off()

