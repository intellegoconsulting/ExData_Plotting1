setwd("~/Coursera class/C4/data1")
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
str(df)

head(df)
df$date_new <- as.Date(df$Date, format = "%d/%m/%Y")
head(df)

df$time_new <- as.Date(df$Time, format="%H:%M:%S")
class(df$time_new)
head(df)

subdf <- subset(df, df$date_new >="2007-02-01" & df$date_new <= "2007-02-02")
head(subdf)

subdf$new_datetime <-strptime(paste(subdf$Date, subdf$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
head(subdf)
tail(subdf)
str(subdf)
summary(subdf)

png("plot3.png", width=480, height=480)
with(subdf, plot(new_datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(subdf, lines(new_datetime, Sub_metering_2, col="red"))
with(subdf, lines(new_datetime, Sub_metering_3, col="blue"))
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))
       
dev.off()


