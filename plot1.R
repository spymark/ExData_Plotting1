library(data.table)

setwd('D:\\Coursera\\Exploratory Data Analysis\\ExData_Plotting1')

#define the range of minutes we are interested in loading
dtime <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins")
#convert the aforementioned time difference to numeric
rowsToRead <- as.numeric(dtime)
#using the fread function from data.table package we read only the rows we need, starting from '1/2/2007
#and proceeding for as many rows as we calculated that fall into the range of interest
#at the same time converting ? to empty string
df <- fread("household_power_consumption.txt", skip="1/2/2007", nrows = rowsToRead, na.strings = c("?", ""))
#properly set the names of df, using the appropriate data table method
setnames(df,names(df),c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 
                        'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

#introduce a new column with both date and time in the correct format
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S") 

#plot1
png(filename = 'plot1.png', width = 480, height = 480, units = "px")
hist(df$Global_active_power, main = 'Global Active Power', xlab ='Global Active Power (kilowats)' , col = 'red')
dev.off()




