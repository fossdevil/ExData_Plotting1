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
k$Global_active_power <- as.numeric(as.character(k$Global_active_power))

# Opening png file called plot2.png with width = 480 and height = 480 (Default is also same)
png("plot2.png",width = 480,height = 480)

# Generating plot inside plot2.png
plot(k$DateTime,k$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",xlab = "")

# Closing device
dev.off()