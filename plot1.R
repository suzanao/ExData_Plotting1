# put unzipped data in your working directory
# install package sqldf
library(sqldf)

# load data
podaci <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
                       stringsAsFactors=FALSE, 
                       sql="select * from file where Date in ('1/2/2007','2/2/2007')")
closeAllConnections()

# plot1
hist(podaci$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red")
dev.copy(png, file="plot1.png", width=480, height=480)     
dev.off()                           
