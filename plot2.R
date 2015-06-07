#  save the local time (need to switch to US) 
backkup_locale <- Sys.getlocale('LC_TIME')
Sys.setlocale('LC_TIME', 'C')


# put unzipped data in your working directory
# install package sqldf
library(sqldf)

# load data
podaci <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=";",
                       stringsAsFactors=FALSE, 
                       sql="select * from file where Date in ('1/2/2007','2/2/2007')")
closeAllConnections()


# create new DateTime variable
DateTime = paste(podaci$Date,podaci$Time, sep=" ")

x <- strptime(DateTime, format ="%d/%m/%Y %H:%M:%S")
y <- as.numeric(podaci$Global_active_power)

# plot2
plot(x,y, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480) 
dev.off()


#---------  restore changes -------------------    
Sys.setlocale('LC_TIME', backkup_locale)

