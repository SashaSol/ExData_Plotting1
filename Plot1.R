options(strinsAsFactors=FALSE)

#Create folder data and unzip the file there
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

#Extract the data set
PowerConsuption <- read.table("./data/household_power_consumption.txt",header = TRUE,sep=";")
PC <- PowerConsuption[(PowerConsuption$Date == "1/2/2007" | PowerConsuption$Date == "2/2/2007"),]

#Generating histogm
png("./data/plot1.png",height=480, width=480, bg="white")
hist(as.numeric(PC$Global_active_power),col="red", main = "Global Active Power", xlab = "Global Active Power [kilowatts]")
dev.off()