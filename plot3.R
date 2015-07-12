# Reading text file here and storing as data frame
df <- read.csv("household_power_consumption.txt",sep = ";")

# Converting dates into comparable format. Using as.Date
df$Date <- as.Date(df$Date,format = "%d/%m/%Y")

# Fetching those dates which are required to generate the plot
k <- df[which(df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02")),]

# Creating extra column DateTime for X-Axis.
k$DateTime <- paste(k$Date,k$Time)

# Using strptime to define DataTime
k$DateTime <- strptime(k$DateTime, "%Y-%m-%d %H:%M:%OS")

# Converting to numeric
k$Sub_metering_1 <- as.numeric(as.character(k$Sub_metering_1))
k$Sub_metering_2 <- as.numeric(as.character(k$Sub_metering_2))
k$Sub_metering_3 <- as.numeric(as.character(k$Sub_metering_3))

# Opening png file called plot2.png with width = 480 and height = 480 (Default is also same)
png("plot3.png",width = 480,height = 480)

# Generating plot inside plot2.png
plot(k$DateTime,k$Sub_metering_1,type = "l",col = "black", ylab="Energy sub metering",xlab = "")
points(k$DateTime,k$Sub_metering_2,type = "l",col = "red")
points(k$DateTime,k$Sub_metering_3,type = "l",col = "blue")
legend("topright",col = c("black","red","blue"),lty=1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Closing device
dev.off()