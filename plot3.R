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
#View(podaci)


# create new DateTime variable
DateTime = paste(podaci$Date,podaci$Time, sep=" ")

x <- strptime(DateTime, format ="%d/%m/%Y %H:%M:%S")
sm1 <- podaci$Sub_metering_1
sm2 <- podaci$Sub_metering_2
sm3 <- podaci$Sub_metering_3


# plot3
plot(x,sm1, type="n", xlab="",ylab="Energy sub metering",)
points(x,sm1,type="l")
points(x,sm2,type="l",col="red")
points(x,sm3,type="l",col="blue")
# add a legend
legend("topright",c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "),
       lty=c(1,1,1), cex=0.75, 
       col=c("black","red","blue"))
dev.copy(png, file="plot3.png", width=480, height=480) 
dev.off()


#---------  restore changes -------------------    
Sys.setlocale('LC_TIME', backkup_locale)

