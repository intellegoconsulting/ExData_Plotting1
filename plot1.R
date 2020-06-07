setwd("~/Coursera class/C4/data1")
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
str(df)

head(df)
df$date_new <- as.Date(df$Date, format = "%d/%m/%Y")  #convert string into date class
head(df)

subdf <- subset(df, df$date_new >="2007-02-01" & df$date_new <= "2007-02-02")
head(subdf)

table(subdf$Date)

#par(mfrow = c(1, 1), mar = c(4, 4, 2, 1))

png("plot1.png", width=480, height=480)

hist(subdf$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="red")

# dev.copy(png, file="plot1.png")
dev.off()


