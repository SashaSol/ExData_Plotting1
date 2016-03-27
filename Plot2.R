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
png("./data/plot2.png",height=480, width=480, bg="white")
plot(DateTime, PC$Global_active_power, col = "blue", type="l", ylab="Global Active Power")

dev.off()