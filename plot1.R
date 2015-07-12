# Reading text file here and storing as data frame
df <- read.csv("household_power_consumption.txt",sep = ";")

# Converting dates into comparable format. Using as.Date
df$Date <- as.Date(df$Date,format = "%d/%m/%Y")

# Fetching those dates which are required to generate the plot
k <- df[which(df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02")),]
  
# Subsetting those values which are not "?"
k <- k[which(k$Global_active_power!="?"),]

# Converting into numeric the values for global active power
xAxis <- as.numeric(as.character.numeric_version(k$Global_active_power))

# Opening png file called plot1.png with width = 480 and height = 480 (Default is also same)
png("plot1.png",width = 480,height = 480)

# Generating histogram inside png
hist(xAxis,col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Closing device
dev.off()