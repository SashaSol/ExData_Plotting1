options(strinsAsFactors=FALSE)

#Create folder data and unzip the file there
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

#Extract the data set
PowerConsuption <- read.table("./data/household_power_consumption.txt",header = TRUE,sep=";")
PC <- PowerConsuption[(PowerConsuption$Date == "1/2/2007" | PowerConsuption$Date == "2/2/2007"),]

DateTime <- paste(PC$Date, PC$Time, sep=" ")
DateTime <- strptime(DateTime, format='%d/%m/%Y %H:%M:%S')

#Generating plot
png("./data/plot4.png",height=480, width=480, bg="white")
par(mfrow=c(2,2))
plot(DateTime, PC$Global_active_power, col = "blue", type="l", ylab="Global Active Power")
plot(DateTime, PC$Voltage, type="l", ylab="Voltage")
g_range <- range(0,PC$Sub_metering_1,PC$Sub_metering_2,PC$Sub_metering_3)
plot(DateTime, PC$Sub_metering_1, type="l", ylab="Energy Sub Metering", ylim=g_range)
lines(DateTime, PC$Sub_metering_2, type="l", col = "blue")
lines(DateTime, PC$Sub_metering_3, type="l", col = "red")
legend("topright",c("Sub metering1", "Sub metering2","Sub metering3"), cex=0.8, col=c("black","blue","red"), lty=c(1,1,1))
plot(DateTime, PC$Global_reactive_power, type="l", ylab="Global reactive power")

dev.off()